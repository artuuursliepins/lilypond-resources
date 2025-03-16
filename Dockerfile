FROM ubuntu:22.04

# Lai tzdata instalācijas laikā nejautā interaktīvi
ENV DEBIAN_FRONTEND=noninteractive

# 1. Atjauninām sistēmu un instalējam nepieciešamās pakotnes
RUN apt-get update && \
    apt-get install -y \
      tzdata \
      wget \
      bzip2 \
      python3 \
      python3-pip \
      python3-venv \
      python3-setuptools \
      python3-wheel \
      tesseract-ocr \
      poppler-utils \
      ghostscript \
      texlive \
      texlive-latex-base \
      texlive-latex-extra \
      texlive-fonts-recommended \
      latexmk \
      imagemagick \
      libsm6 \
      libxext6 \
      libxrender-dev \
    && ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime \
    && dpkg-reconfigure --frontend noninteractive tzdata \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 2. Pārliecināmies, ka pip ir jaunākajā versijā
RUN python3 -m pip install --upgrade pip

# 3. Iestatām darba mapi un kopējam projektus
WORKDIR /app
COPY . /app

# 4. Nodrošinām, ka bin/lilypond ir izpildāms un iekļauts PATH
RUN chmod +x /app/bin/lilypond
ENV PATH="/app/bin:$PATH"

# 5. Instalējam Python atkarības no requirements.txt
COPY requirements.txt /app/requirements.txt
RUN python3 -m pip install --no-cache-dir -r requirements.txt

# 6. Atveram 8080 portu (Flask “EXPOSE” ports)
EXPOSE 8080

# 7. Noklusētā komanda – palaižam serveri
CMD ["python3", "server.py"]

# (F) Atveram 8080 portu (Flask “EXPOSE” ports)
EXPOSE 8080

# (G) Noklusētā komanda – palaižam serveri
CMD ["python3", "server.py"]
