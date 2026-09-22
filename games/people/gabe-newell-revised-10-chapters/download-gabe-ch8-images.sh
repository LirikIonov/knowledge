#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
IMAGES_DIR="$SCRIPT_DIR/images"
mkdir -p "$IMAGES_DIR"

CURL=(curl -fL --retry 3 --retry-delay 1 --connect-timeout 20 -A "Mozilla/5.0")

download() {
  local url="$1"
  local file="$2"
  printf 'Downloading %s\n' "$file"
  "${CURL[@]}" "$url" -o "$IMAGES_DIR/$file"
}

# Gabe Newell, 2002. Wikimedia Commons, CC BY 2.0.
download "https://commons.wikimedia.org/wiki/Special:Redirect/file/Gabe_Newell_-_2002.jpg" \
  "gabe-newell-2002.jpg"

# Lisa Castaneda. UW Bothell, 2026.
download "https://www.uwb.edu/give/wp-content/uploads/sites/11/2026/05/260428_lisa_castaneda_foundry10_2137_w-683x1024.jpg" \
  "lisa-castaneda-foundry10.jpg"

# Punch-card computer terminal, c. 1970. Wikimedia Commons / U.S. DOE, public domain.
download "https://commons.wikimedia.org/wiki/Special:Redirect/file/HD.6B.030_%2810693137083%29.jpg" \
  "punch-card-terminal-1970.jpg"

# Gabe Newell at The International 2018. Wikimedia Commons, CC BY 2.0.
download "https://commons.wikimedia.org/wiki/Special:Redirect/file/The_International_2018_%2843263984845%29_%28cropped%29.jpg" \
  "gabe-newell-ti-2018.jpg"

# Gabe Newell and J. J. Abrams at D.I.C.E. 2013.
download "https://www.slashfilm.com/img/gallery/votd-j-j-abrams-discusses-storytelling-with-valve-co-founder-gabe-newell/intro-import.jpg" \
  "gabe-newell-jj-abrams-dice-2013.jpg"

# Knife collection and Gabe holding two knives. Images reproduced by 3DJuegos PC from the well-known Valve/Giant Bomb material.
download "https://i.blogs.es/8aba27/imagen-de-valve/450_1000.jpeg" \
  "gabe-knife-collection.jpg"
download "https://i.blogs.es/157667/imagen-de-gabe-newell/450_1000.jpeg" \
  "gabe-newell-with-knives.jpg"

# Gabe Newell at GDC 2010. Wikimedia Commons, CC BY 2.0.
download "https://commons.wikimedia.org/wiki/Special:Redirect/file/Gabe_Newell_GDC_2010_%28cropped%29.jpg" \
  "gabe-newell-gdc-2010.jpg"

# Valve video: Gabe Newell delivering the first Steam Decks, 2022.
download "https://img.youtube.com/vi/9Dy-KWjp-m0/maxresdefault.jpg" \
  "gabe-newell-steam-deck-delivery.jpg"

printf '\nDone. Images saved to: %s\n' "$IMAGES_DIR"
