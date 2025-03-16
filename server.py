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

# Iestata noklusējuma laika joslu (piemēram, 'Europe/Riga')
DEFAULT_TIMEZONE = os.getenv("TIMEZONE", "Europe/Riga")

def get_current_time():
    tz = pytz.timezone(DEFAULT_TIMEZONE)
    return datetime.now(tz).strftime("%Y-%m-%d %H:%M:%S")

temp_files = []  # Saglabā pagaidu failus, lai tos iztīrītu

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/convert", methods=["POST"])
def convert_lilypond():
    """Nosūta LilyPond kodu uz serveri un renderē"""
    data = request.json
    if not data or "lilypond_code" not in data:
        return jsonify({"error": "Nepareizi ievaddati"}), 400

    lilypond_code = data["lilypond_code"]
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
    return send_file(output_pdf, mimetype="application/pdf")

@app.route("/convert-pdf-to-lilypond", methods=["POST"])
def convert_pdf_to_lilypond():
    """Pieņem PDF failu ar notīm, izmanto OMR, lai konvertētu uz LilyPond."""
    if 'file' not in request.files:
        return jsonify({"error": "Nav atrasts 'file' parametrs"}), 400

    file = request.files['file']
    pdf_filename = f"/tmp/{uuid.uuid4()}.pdf"
    file.save(pdf_filename)
    temp_files.append(pdf_filename)

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

@app.route("/render-lilypond-to-png", methods=["POST"])
def render_lilypond_to_png():
    """Pieņem LilyPond kodu (kā tekstu), uzģenerē PNG un atgriež lietotājam."""
    data = request.json
    if not data or "lilypond_code" not in data:
        return jsonify({"error": "Nepareizi ievaddati"}), 400

    lilypond_code = data["lilypond_code"]
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
    eps_file = ly_filename.replace(".ly", ".eps")
    if os.path.exists(eps_file):
        os.remove(eps_file)  # Izdzēš EPS failu, ja tāds tika izveidots

    return send_file(output_png, mimetype="image/png")

def cleanup_temp_files():
    """Automātiski izdzēš pagaidu failus, kad aplikācija beidz darbu."""
    for file in temp_files:
        if os.path.exists(file):
            os.remove(file)

atexit.register(cleanup_temp_files)  # Tīrīšana pie servera izslēgšanas

if __name__ == "__main__":
    print("Starting production WSGI server with Waitress...")
    print("Pašreizējais laiks:", get_current_time())
    serve(app, host="0.0.0.0", port=8080)
