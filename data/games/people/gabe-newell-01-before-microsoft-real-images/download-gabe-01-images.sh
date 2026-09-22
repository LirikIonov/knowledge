#!/usr/bin/env bash
set -euo pipefail
mkdir -p images
curl -L --fail 'https://upload.wikimedia.org/wikipedia/commons/6/60/Texas_Instruments_SR-52.jpg' -o images/ti-sr52.jpg
curl -L --fail 'https://www.lakeheadu.ca/sites/default/files/uploads/395/Keypunch%20Machine%20%28Cropped%29.jpg' -o images/university-keypunch.jpg
curl -L --fail 'https://djcube.co.uk/wp-content/uploads/2025/09/004.jpg' -o images/star-trek-printout-1975.jpg
curl -L --fail 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Student_led_tour_of_Harvard_University_1976.jpg' -o images/harvard-1976.jpg
curl -L --fail 'https://msftstories.thesourcemediaassets.com/sites/716/2025/01/4-whitebg.jpg' -o images/microsoft-1978.jpg
printf 'Downloaded 5 real images into images/\n'
