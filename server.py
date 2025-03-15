from flask import Flask, request, send_file, jsonify
import os
import subprocess
import uuid

app = Flask(__name__)

@app.route("/")
def index():
    return "Sveiki! Šī ir LilyPond + GPT konvertēšanas API."

@app.route("/convert-pdf-to-lilypond", methods=["POST"])
def convert_pdf_to_lilypond():
    """
    Pieņem PDF failu ar notīm, izmanto OMR, lai konvertētu uz LilyPond.
    """
    # 1. Saņem augšupielādēto failu
    if 'file' not in request.files:
        return "Nav atrasts 'file' parametrs", 400

    file = request.files['file']
    pdf_filename = f"/tmp/{uuid.uuid4()}.pdf"
    file.save(pdf_filename)

    # 2. Izsauciet kādu OMR rīku, piemēram, Audiveris, vai citu
    #   Piemērs komandai (ja būtu instalēts Audiveris):
    # subprocess.run(["audiveris", pdf_filename, "-export", "ly"], check=True)
    #   Tas, kas reāli tiek izsaukts, būs atkarīgs no jūsu OMR rīka. 
    #   Rezultātā dabūsiet LilyPond (.ly) failu.

    # Šeit tikai DEMO vajadzībām parādām, ka radam kaut kādu saturu:
    # (Faktiski vajadzētu pareizu OMR konversijas rezultātu)
    lilypond_code = r"""
\version "2.22.0"
\relative c' {
  \time 4/4
  c4 d e f | g f e d | c1
}
"""
    # 3. Saglabā .ly
    ly_filename = f"/tmp/{uuid.uuid4()}.ly"
    with open(ly_filename, "w", encoding="utf-8") as f:
        f.write(lilypond_code)

    return jsonify({
        "message": "Konvertēšana pabeigta (demo).",
        "lilypond_file": ly_filename,
        "lilypond_code": lilypond_code
    })

@app.route("/render-lilypond-to-png", methods=["POST"])
def render_lilypond_to_png():
    """
    Pieņem LilyPond kodu (kā tekstu), uzģenerē PNG un atgriež lietotājam.
    """
    data = request.json
    if not data or "lilypond_code" not in data:
        return "Nepareizi ievaddati", 400

    lilypond_code = data["lilypond_code"]
    ly_filename = f"/tmp/{uuid.uuid4()}.ly"
    with open(ly_filename, "w", encoding="utf-8") as f:
        f.write(lilypond_code)

    # Izsaucam lilypond, lai ģenerētu PNG
    # -dbackend=eps vai -dbackend=svg vai citi parametri - atkarīgs no vajadzībām.
    subprocess.run([
        "lilypond",
        "-dbackend=eps",
        "-dno-gs-load-fonts",
        "-dinclude-eps-fonts",
        "--png",  # radīs PNG failu
        "--output", ly_filename,
        ly_filename
    ], check=True)

    # LilyPond ģenerē failus ar to pašu pamatnosaukumu
    output_png = ly_filename.replace(".ly", ".png")
    return send_file(output_png, mimetype="image/png")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=9090)
