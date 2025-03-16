# Pilns Dockerfile projekta "lilypond-resources" vajadzībām
# ====================================================================

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
    texlive \
    texlive-latex-base \
    texlive-fonts-recommended \
    texlive-latex-extra \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 2. Iestatām darba mapi un kopējam projektus
WORKDIR /app
COPY . /app

# 3. Instalējam Python atkarības
RUN pip3 install --no-cache-dir -r requirements.txt

# 4. Atveram 8080 portu
EXPOSE 8080

# 5. Noklusētā komanda - palaižam Flask serveri (server.py) ar python3
CMD ["python3", "server.py"]
