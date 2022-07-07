#!/bin/bash

# Warn that ffmpeg must be installed #
echo ""
echo "## ====================================================== ##"
echo "## This script requires that you have 'ffmpeg' installed! ##"
echo "## ====================================================== ##"

# Test how the command `ffmpeg -version` is returned #
if ffmpeg -version | grep -q 'ffmpeg version'; then
  ## Succesfull test of ffmpeg command ##
   echo ""
   echo "## ffmpeg -version returned succesfully! ##"
   echo ""
   else
   ## Broken ffmpeg installation ##
   echo ""
   echo "## `ffmpeg -version` returned an unexpected value... ##"
   echo ""
   echo "## STOPPING FURTHER COMMAND EXECUTION - fix ffmpeg first!  ##"
   return 1
fi

# Define the location of the folders that hold the (source & destination) video files #
## (must be within the /scripts/ folder to work without elevated permissions) ##
INFOLDER="./scripts/IN/"
OUTFOLDER="./scripts/OUT/"

# Prompt user for the name of the MP4 file to convert #
echo ""
echo "## ==================================================================== ##"
echo "##    Please enter the filename of your MP4 located in ./scripts/IN/    ##"
echo "##              (be sure to include the .mp4 file extension)            ##"
echo "## ==================================================================== ##"

read INFILE

## Set location of input file ##
INPUT="${INFOLDER}${INFILE}"

echo "SOURCE FILE: $INPUT"

# Setup some video and quality audio settings #
## Default video quality setting of 30 ##
read -p "Enter a -crf video-quality setting [30]: " VQ
VQ=${VQ:-30}

echo ""
echo "## =============================== ##"
echo "##   Video quality set to -crf ${VQ}  ##"
echo "## =============================== ##"


# Set location and part of name of converted/output file #
## (Suffix is added later) ##
OUTPUT="${OUTFOLDER}${INFILE%.mp4}"

run_ffmpeg_command () {
  echo " "
  echo "## ====================== ##"
  echo "## Running FFMPEG command ##"
  echo "## ====================== ##"
  echo ""
  # Preview of the command #
  echo "ffmpeg -i ${INPUT} -c:v libvpx-vp9 -crf ${VQ} -b:v 0 $1 ${OUTPUT}_crf${VQ}-a${AQ}.webm"
  echo ""

  # Finally, we run the ffmpeg command:
  ffmpeg -i $INPUT -c:v libvpx-vp9 -crf $VQ -b:v 0 $1 "${OUTPUT}_crf${VQ}-a${AQ}.webm"
}


read -p "Do you want to process any audio for the video? (Yy/Nn) [y]: " yn
yn=${yn:-y}

case $yn in
  [Yy] )
  # Handle audio processing here
  ## Default audio quality setting of 128k
  read -p "Enter an audio quality -b:a value (must end with 'k') [128k]: " AQ
  AQ=${AQ:-128k}

  echo ""
  echo "## =============================== ##"
  echo "## Audio quality set to -b:a ${AQ} ##"
  echo "## =============================== ##"

  run_ffmpeg_command "-c:a libopus -b:a ${AQ}"
  ;;
  [Nn] )
  # No audio flag
  run_ffmpeg_command "-an"
  ;;
  * )
  echo invalid response;
  exit 1
  ;;
esac
