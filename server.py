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

app = Flask(__name__)

UPLOAD_FOLDER = "static/uploaded_scores"
os.makedirs(UPLOAD_FOLDER, exist_ok=True)

DEFAULT_TIMEZONE = os.getenv("TIMEZONE", "Europe/Riga")
def get_current_time():
    tz = pytz.timezone(DEFAULT_TIMEZONE)
    return datetime.now(tz).strftime("%Y-%m-%d %H:%M:%S")

temp_files = []

@app.route("/health", methods=["GET"])
def health():
    """Vienkārši parāda, ka serveris strādā."""
    return {
        "status": "ok",
        "message": "Server is running",
        "time": get_current_time()
    }

@app.route("/")
def index():
    """Parāda HTML formu, kur var augšupielādēt PDF vai LilyPond kodu."""
    return render_template("index.html")

@app.route("/scores/<path:filename>")
def get_score_file(filename):
    """Iespēja GET pieprasījumā lejupielādēt PDF, PNG utt., kas ir saglabāts UPLOAD_FOLDER."""
    filepath = os.path.join(UPLOAD_FOLDER, filename)
    if not os.path.exists(filepath):
        return jsonify({"error": "File not found"}), 404
    return send_file(filepath)

@app.route("/convert-pdf-to-lilypond", methods=["GET", "POST"])
def convert_pdf_to_lilypond():
    """
    Pieņem PDF failu ar notīm, izmanto OMR (demo) un atgriež LilyPond.
    Tagad atļaujam arī GET, lai var parādīt formu pārlūkā.
    """
    if request.method == "GET":
        # Parādi vienkāršu formu, lai augšupielādētu PDF
        # (ja gribi to pašu index.html, vari to atgriezt)
        return render_template("index.html")
    # POST loģika
    if 'file' not in request.files:
        return jsonify({"error": "Nav atrasts 'file' parametrs"}), 400

    file = request.files['file']
    pdf_filename = f"/tmp/{uuid.uuid4()}.pdf"
    file.save(pdf_filename)
    temp_files.append(pdf_filename)

    # Demo LilyPond kods (reāli izmanto OMR rīku)
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

@app.route("/convert", methods=["GET", "POST"])
def convert_lilypond():
    """Saņem LilyPond kodu un renderē PDF, atļauj GET, lai rāda formu."""
    if request.method == "GET":
        return render_template("index.html")  # Rāda ievades formu
    # POST loģika
    # Pārbaudām, vai sūtīts form-data vai JSON
    lilypond_code = None
    if "lilypond_code" in request.form:
        # sūtīts form-data
        lilypond_code = request.form["lilypond_code"]
    else:
        # sūtīts JSON
        data = request.json
        if data and "lilypond_code" in data:
            lilypond_code = data["lilypond_code"]

    if not lilypond_code:
        return jsonify({"error": "Nepareizi ievaddati"}), 400

    ly_filename = f"{UPLOAD_FOLDER}/{uuid.uuid4()}.ly"
    with open(ly_filename, "w", encoding="utf-8") as f:
        f.write(lilypond_code)
    temp_files.append(ly_filename)

    try:
        subprocess.run(["lilypond", "--pdf", ly_filename], check=True)
    except subprocess.CalledProcessError as e:
        return jsonify({"error": f\"LilyPond kļūda: {str(e)}\"}), 500

    output_pdf = ly_filename.replace(".ly", ".pdf")
    temp_files.append(output_pdf)
    # Varam saglabāt to failu un atgriezt linku
    pdf_filename = os.path.basename(output_pdf)
    return jsonify({
        "message": "Render pabeigts!",
        "pdf_url": f"/scores/{pdf_filename}"
    })

@app.route("/render-lilypond-to-png", methods=["GET", "POST"])
def render_lilypond_to_png():
    """Saņem LilyPond kodu, ģenerē PNG."""
    if request.method == "GET":
        return render_template("index.html")

    # Līdzīgi kā /convert
    lilypond_code = None
    if "lilypond_code" in request.form:
        lilypond_code = request.form["lilypond_code"]
    else:
        data = request.json
        if data and "lilypond_code" in data:
            lilypond_code = data["lilypond_code"]

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
        return jsonify({"error": f\"LilyPond kļūda: {str(e)}\"}), 500

    output_png = ly_filename.replace(".ly", ".png")
    temp_files.append(output_png)
    eps_file = ly_filename.replace(".ly", ".eps")
    if os.path.exists(eps_file):
        os.remove(eps_file)

    # Saglabā failu mapē, lai var GET piekļūt
    png_filename = os.path.basename(output_png)
    # Pārvieto no /tmp uz static
    newpath = os.path.join(UPLOAD_FOLDER, png_filename)
    os.rename(output_png, newpath)

    return jsonify({
        "message": "Render pabeigts!",
        "png_url": f"/scores/{png_filename}"
    })

def cleanup_temp_files():
    """Automātiski izdzēš pagaidu failus, kad aplikācija beidz darbu."""
    for file in temp_files:
        if os.path.exists(file):
            os.remove(file)

atexit.register(cleanup_temp_files)

if __name__ == "__main__":
    print(\"Starting production WSGI server with Waitress...\")
    print(\"Pašreizējais laiks:\", get_current_time())
    serve(app, host=\"0.0.0.0\", port=8080)

if __name__ == "__main__":
    print("Starting production WSGI server with Waitress...")
    print("Pašreizējais laiks:", get_current_time())
    serve(app, host="0.0.0.0", port=8080)
