from waitress import serve
from server import app

if __name__ == "__main__":
    print("Starting production WSGI server...")
    serve(app, host="0.0.0.0", port=8080)
