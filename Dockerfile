FROM ubuntu:22.04

# 1. Atjauninām sistēmu un instalējam vajadzīgās pakotnes
RUN apt-get update && apt-get install -y \
    wget \
    software-properties-common \
    python3 \
    python3-pip \
    # LilyPond instalācija
    lilypond \
    # Papildu rīki, kurus var izmantot OMR
    tesseract-ocr \
    # citi rīki atkarībā no jūsu OMR vajadzībām...
    # ...
    && rm -rf /var/lib/apt/lists/*

# 2. Kopējam sava projekta failus konteinerī
WORKDIR /app
COPY . /app

# 3. Instalējam Python atkarības
RUN pip3 install --no-cache-dir -r requirements.txt

# Ja nepieciešams, expose portu, piemēram, 8080
EXPOSE 8080

# 4. Palaižam aplikāciju
CMD ["python3", "server.py"]
