from waitress import serve
from flask import Flask, request, send_file, jsonify, render_template
import os
import subprocess
import uuid
import paramiko
import atexit
import time
import pytz
from datetime import datetime

##
# Šī ir server.py kods, kas nodrošina LilyPond konvertēšanu
# (PDF, PNG, MIDI, LaTeX) un OMR (PDF→LilyPond). 
# Papildus iekļauta sadaļa /health stāvokļa pārbaudei un
# /scores/<filename> GET maršruts, lai izgūtu ģenerētos failus.
##

app = Flask(__name__)

UPLOAD_FOLDER = "static/uploaded_scores"
os.makedirs(UPLOAD_FOLDER, exist_ok=True)

DEFAULT_TIMEZONE = os.getenv("TIMEZONE", "Europe/Riga")

def get_current_time():
    tz = pytz.timezone(DEFAULT_TIMEZONE)
    return datetime.now(tz).strftime("%Y-%m-%d %H:%M:%S")

temp_files = []  # Saglabā failus, ko tīram pēc servera izslēgšanas

@app.route("/health", methods=["GET"])
def health():
    """
    Vienkāršs endpunkts, lai pārbaudītu, vai serveris strādā.
    """
    return {
        "status": "ok",
        "message": "Server is running",
        "time": get_current_time()
    }

@app.route("/")
def index():
    """
    Parāda HTML formu (index.html) ar visām iespējām –
    PDF→LilyPond, LilyPond→PDF, PNG, MIDI, LaTeX.
    """
    return render_template("index.html")

@app.route("/scores/<path:filename>", methods=["GET"])
def get_score_file(filename):
    """
    Iespēja ar GET pieprasījumu lejupielādēt PDF, PNG, MIDI utt.
    Fails tiek meklēts static/uploaded_scores/<filename>.
    """
    filepath = os.path.join(UPLOAD_FOLDER, filename)
    if not os.path.exists(filepath):
        return jsonify({"error": "File not found"}), 404
    return send_file(filepath)

@app.route("/convert-pdf-to-lilypond", methods=["GET", "POST"])
def convert_pdf_to_lilypond():
    """
    Pieņem PDF failu ar notīm (OMR simulācija) un atgriež LilyPond kodu.
    GET => atgriež index.html formu.
    POST => apstrādā failu, ģenerē .ly failu.
    """
    if request.method == "GET":
        return render_template("index.html")

    if 'file' not in request.files:
        return jsonify({"error": "Nav atrasts 'file' parametrs"}), 400

    file = request.files['file']
    pdf_filename = f"/tmp/{uuid.uuid4()}.pdf"
    file.save(pdf_filename)
    temp_files.append(pdf_filename)

    # DEMO: Fiksēts LilyPond kods, nevis reāls OMR
    lilypond_code = r"""
\version "2.24.0"
\relative c' {
  \time 4/4
  c4 d e f | g f e d | c1
}
"""
    ly_filename = f"/tmp/{uuid.uuid4()}.ly"
    with open(ly_filename, "w", encoding="utf-8") as f:
        f.write(lilypond_code)
    temp_files.append(ly_filename)

    return jsonify({
        "message": "Konvertēšana pabeigta.",
        "lilypond_file": ly_filename,
        "lilypond_code": lilypond_code
    })

@app.route("/render-lilypond-to-pdf", methods=["GET", "POST"])
def render_lilypond_to_pdf():
    """
    Saņem LilyPond kodu (POST formā vai JSON) un renderē PDF.
    Atgriež 'pdf_url' ar /scores/<pdffail>.pdf
    """
    if request.method == "GET":
        return render_template("index.html")

    # Iegūst lilypond_code no form vai JSON
    lilypond_code = request.form.get("lilypond_code") or (request.json or {}).get("lilypond_code")
    if not lilypond_code:
        return jsonify({"error": "Nepareizi ievaddati"}), 400

    ly_filename = f"{UPLOAD_FOLDER}/{uuid.uuid4()}.ly"
    with open(ly_filename, "w", encoding="utf-8") as f:
        f.write(lilypond_code)
    temp_files.append(ly_filename)

    try:
        subprocess.run(["lilypond", "--pdf", ly_filename], check=True)
    except subprocess.CalledProcessError as e:
        return jsonify({"error": f"LilyPond kļūda: {str(e)}"}), 500

    output_pdf = ly_filename.replace(".ly", ".pdf")
    temp_files.append(output_pdf)

    pdf_file = os.path.basename(output_pdf)
    return jsonify({
        "message": "PDF renderēts veiksmīgi!",
        "pdf_url": f"/scores/{pdf_file}"
    })

@app.route("/render-lilypond-to-png", methods=["GET", "POST"])
def render_lilypond_to_png():
    """
    Saņem LilyPond kodu un renderē PNG (ar lilypond --png).
    """
    if request.method == "GET":
        return render_template("index.html")

    lilypond_code = request.form.get("lilypond_code") or (request.json or {}).get("lilypond_code")
    if not lilypond_code:
        return jsonify({"error": "Nepareizi ievaddati"}), 400

    ly_filename = f"/tmp/{uuid.uuid4()}.ly"
    with open(ly_filename, "w", encoding="utf-8") as f:
        f.write(lilypond_code)
    temp_files.append(ly_filename)

    try:
        subprocess.run([
            "lilypond",
            "-dbackend=eps",
            "-dno-gs-load-fonts",
            "-dinclude-eps-fonts",
            "--png",
            "--output", ly_filename,
            ly_filename
        ], check=True)
    except subprocess.CalledProcessError as e:
        return jsonify({"error": f"LilyPond kļūda: {str(e)}"}), 500

    output_png = ly_filename.replace(".ly", ".png")
    temp_files.append(output_png)

    png_file = os.path.basename(output_png)
    newpath = os.path.join(UPLOAD_FOLDER, png_file)
    os.rename(output_png, newpath)

    return jsonify({
        "message": "PNG renderēts veiksmīgi!",
        "png_url": f"/scores/{png_file}"
    })

@app.route("/render-lilypond-to-midi", methods=["GET", "POST"])
def render_lilypond_to_midi():
    """
    Saņem LilyPond kodu un renderē MIDI (ar lilypond --output).
    """
    if request.method == "GET":
        return render_template("index.html")

    lilypond_code = request.form.get("lilypond_code") or (request.json or {}).get("lilypond_code")
    if not lilypond_code:
        return jsonify({"error": "Nepareizi ievaddati"}), 400

    ly_filename = f"/tmp/{uuid.uuid4()}.ly"
    with open(ly_filename, "w", encoding="utf-8") as f:
        f.write(lilypond_code)
    temp_files.append(ly_filename)

    try:
        subprocess.run(["lilypond", "--output", ly_filename, ly_filename], check=True)
    except subprocess.CalledProcessError as e:
        return jsonify({"error": f"LilyPond kļūda: {str(e)}"}), 500

    output_midi = ly_filename.replace(".ly", ".midi")
    if not os.path.exists(output_midi):
        return jsonify({"error": "MIDI fails netika ģenerēts!"}), 500

    temp_files.append(output_midi)
    midi_file = os.path.basename(output_midi)
    newpath = os.path.join(UPLOAD_FOLDER, midi_file)
    os.rename(output_midi, newpath)

    return jsonify({
        "message": "MIDI renderēts veiksmīgi!",
        "midi_url": f"/scores/{midi_file}"
    })

@app.route("/render-lilypond-latex", methods=["GET", "POST"])
def render_lilypond_latex():
    """
    Saņem LaTeX + LilyPond (lytex) saturu un izmanto lilypond-book + pdflatex,
    lai ģenerētu PDF. Nepieciešams TeX + lilypond-book instalācija Docker vidē.
    """
    if request.method == "GET":
        return render_template("index.html")

    latex_code = request.form.get("latex_code") or (request.json or {}).get("latex_code")
    if not latex_code:
        return jsonify({"error": "Trūkst LaTeX koda"}), 400

    base_id = uuid.uuid4()
    lytex_filename = f"/tmp/{base_id}.lytex"
    with open(lytex_filename, "w", encoding="utf-8") as f:
        f.write(latex_code)
    temp_files.append(lytex_filename)

    # 1) lilypond-book --pdf ...
    try:
        subprocess.run(["lilypond-book", "--pdf", lytex_filename], check=True)
    except subprocess.CalledProcessError as e:
        return jsonify({"error": f"Lilypond-book kļūda: {str(e)}"}), 500

    tex_filename = lytex_filename.replace(".lytex", ".tex")
    if not os.path.exists(tex_filename):
        return jsonify({"error": "Tex fails netika izveidots."}), 500
    temp_files.append(tex_filename)

    # 2) pdflatex
    try:
        subprocess.run(["pdflatex", tex_filename], check=True)
    except subprocess.CalledProcessError as e:
        return jsonify({"error": f"pdflatex kļūda: {str(e)}"}), 500

    pdf_output = tex_filename.replace(".tex", ".pdf")
    if not os.path.exists(pdf_output):
        return jsonify({"error": "PDF fails netika izveidots."}), 500
    temp_files.append(pdf_output)

    pdf_file = os.path.basename(pdf_output)
    newpath = os.path.join(UPLOAD_FOLDER, pdf_file)
    os.rename(pdf_output, newpath)

    return jsonify({
        "message": "LaTeX + LilyPond apstrāde pabeigta!",
        "pdf_url": f"/scores/{pdf_file}"
    })

def cleanup_temp_files():
    """
    Automātiski izdzēš pagaidu failus, kad aplikācija beidz darbu
    (atexit.register).
    """
    for f in temp_files:
        if os.path.exists(f):
            os.remove(f)

atexit.register(cleanup_temp_files)

if __name__ == "__main__":
    print("Starting production WSGI server with Waitress...")
    print("Pašreizējais laiks:", get_current_time())
    serve(app, host="0.0.0.0", port=8080)