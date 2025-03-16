import requests

# API endpoint
API_URL = "https://lilypond-resources.onrender.com/api/convert"

# LilyPond kods (piemērs)
lilypond_code = r"""
\version "2.24.0"
\relative c' {
  \key c \major
  \time 4/4
  c4 d e f | g a b c | c2 g | f e d c
}
"""

# Nosūtām pieprasījumu uz serveri
response = requests.post(API_URL, json={"input_code": lilypond_code})

# Apstrādājam atbildi
if response.status_code == 200:
    result = response.json()
    print("Renderēšana veiksmīga! Faili pieejami:")
    print(result)
else:
    print("Kļūda:", response.text)
