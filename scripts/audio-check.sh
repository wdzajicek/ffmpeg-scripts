#!/bin/bash

read -p "Do you want to process any audio for the video? (Yy/Nn) [y]: " yn
yn=${yn:-y}

case $yn in
  [Yy] )
  echo ok, we will proceed
  
  ;;
  [Nn] )
  echo exiting...;
  exit
  ;;
  * )
  echo invalid response;
  exit 1
  ;;
esac

## Default audio quality setting of 128k
read -p "Enter an audio quality -b:a value (must end with 'k') [128k]: " AQ
AQ=${AQ:-128k}

echo ""
echo "## =============================== ##"
echo "## Audio quality set to -b:a ${AQ} ##"
echo "## =============================== ##"

run_ffmpeg_command () {
  # Set location and part of name of converted/output file #
  ## (Suffix is added later) ##
  OUTPUT="${OUTFOLDER}${INFILE%.mp4}"

  echo ""
  echo "## ====================== ##"
  echo "## Running FFMPEG command ##"
  echo "## ====================== ##"

  # Preview of the command #
  echo "ffmpeg -i ${INPUT} -c:v libvpx-vp9 -crf ${VQ} -b:v 0 -c:a libopus -b:a ${AQ} ${OUTPUT}_crf${VQ}-a${AQ}.webm"

  # Finally, we run the ffmpeg command:
  ffmpeg -i $INPUT -c:v libvpx-vp9 -crf $VQ -b:v 0 -c:a libopus -b:a $AQ "${OUTPUT}_crf${VQ}-a${AQ}.webm"

}

