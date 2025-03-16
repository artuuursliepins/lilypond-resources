FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Atjauninām, dzēšam veco lilypond, instalējam palīgrīkus
RUN apt-get update && \
    apt-get remove -y lilypond && \
    apt-get install -y wget bzip2 && \
    rm -rf /var/lib/apt/lists/*
# 1. Dzēšam veco LilyPond, ja tas jau ir instalēts
RUN apt-get remove -y lilypond || true

# 2. Lejupielādējam un instalējam LilyPond 2.24.0 no oficiālās lapas
RUN wget -O lilypond-2.24.0.tar.gz \
    http://download.linuxaudio.org/lilypond/binaries/linux-64/lilypond-2.24.0.tar.gz && \
    tar -xvzf lilypond-2.24.0.tar.gz && \
    mv lilypond-2.24.0 /usr/local/lilypond && \
    rm -f lilypond-2.24.0.tar.gz

# 3. Pievienojam LilyPond ceļu globālajam PATH
ENV PATH="/usr/local/lilypond/bin:$PATH"

# 4. Pārbaudām, vai LilyPond darbojas
RUN lilypond --version

# Izpildām instalācijas skriptu neinteraktīvajā režīmā
RUN ./lilypond-2.24.0-1.linux-64.sh --batch

# (A) Instalējam tzdata (ja nepieciešams laika joslas iestatīšanai)
RUN apt-get update && \
    apt-get install -y tzdata && \
    ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata

# Pilns Dockerfile projekta "lilypond-resources" vajadzībām

# (B) Instalējam sistēmas pakotnes
RUN apt-get update && apt-get install -y \
    # Python
    python3 \
    python3-pip \
    python3-venv \
    python3-setuptools \
    python3-wheel \
    tesseract-ocr \
    poppler-utils \
    ghostscript \
    # LaTeX
    texlive \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-fonts-recommended \
    latexmk \
    # Attēlu apstrāde
    imagemagick \
    # X atkarības (OpenCV)
    libsm6 \
    libxext6 \
    libxrender-dev \
    # Beigās tīrām kešatmiņu
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# (C) Pārliecināmies, ka pip ir jaunākajā versijā
RUN python3 -m pip install --upgrade pip

# (D) Iestatām darba mapi un kopējam projektus
WORKDIR /app
COPY . /app

# (E) Instalējam Python atkarības no requirements.txt
COPY requirements.txt /app/requirements.txt
RUN python3 -m pip install --no-cache-dir -r requirements.txt

# (F) Atveram 8080 portu (Flask “EXPOSE” ports)
EXPOSE 8080

# (G) Noklusētā komanda – palaižam serveri
CMD ["python3", "server.py"]
