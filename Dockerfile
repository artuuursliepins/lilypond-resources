# Pilns Dockerfile projekta "lilypond-resources" vajadzībām
# ====================================================================

FROM ubuntu:22.04

# Iestatām neinteraktīvo režīmu
ENV DEBIAN_FRONTEND=noninteractive

# Atjaunojam pakotņu sarakstu un instalējam tzdata
RUN apt-get update && \
    apt-get install -y tzdata && \
    ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata
    
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
    imagemagick \
    libsm6 \
    libxext6 \
    libxrender-dev \
    python3-setuptools \
    python3-wheel \
    latexmk \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 2. Iestatām darba mapi un kopējam projektus
WORKDIR /app
COPY . /app

# 3. Instalējam Python atkarības
COPY requirements.txt /app/requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

# 4. Atveram 8080 portu
EXPOSE 8080

# 5. Noklusētā komanda - palaižam Flask serveri (server.py) ar python3
CMD ["python3", "server.py"]
# 3. Instalējam Python atkarības no requirements.txt
