FROM ubuntu:22.04

# 1. Atjauninām sistēmu un instalējam nepieciešamās pakotnes
RUN apt-get update && apt-get install -y \
    wget \
    software-properties-common \
    python3 \
    python3-pip \
    lilypond \
    tesseract-ocr \
    poppler-utils \
    ghostscript \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 2. Iestatām darba mapi un kopējam projektus
WORKDIR /app
COPY . /app

# 3. Instalējam Python atkarības
RUN pip3 install --no-cache-dir -r requirements.txt

# 4. Atveram porta iestatījumus
EXPOSE 8080

# 5. Palaižam Flask aplikāciju ar Waitress
CMD ["python3", "server.py"]
