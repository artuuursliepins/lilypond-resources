import time
import requests

url = "https://lilypond-resources.onrender.com/"

while True:
    try:
        response = requests.get(url)
        print(f"Ping server: {response.status_code}")
    except requests.exceptions.RequestException as e:
        print(f"Error: {e}")
    
    time.sleep(300)  # 5 minūšu pauze