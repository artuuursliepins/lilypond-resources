#!/bin/bash
while true; do
  curl -s https://lilypond-resources.onrender.com/ > /dev/null
  sleep 300  # Ping ik pēc 5 minūtēm (300 sekundes)
done