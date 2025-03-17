# lilypond_web.py
from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def index():
  if os.path.exists("templates/index.html"):
    return render_template('index.html')
else:
    return "HTML fails nav atrasts!", 500

if __name__ == '__main__':
    app.run(debug=True)
