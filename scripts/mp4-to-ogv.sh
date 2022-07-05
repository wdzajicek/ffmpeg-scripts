#!/bin/bash

echo "## ====================================================== ##"
echo "## This script requires that you have 'ffmpeg' installed! ##"
echo "## ====================================================== ##"

if ffmpeg -version | grep -q 'ffmpeg version'; then
   echo "ffmpeg -version returned"
fi

INFOLDER="./IN/"
OUTFOLDER="./OUT/"

echo "  "

echo "## ==================================================================== ##"
echo "## Please enter the filename of your MP4 located in ~/Movies/FFMPEG/IN/ ##"
echo "## ==================================================================== ##"

read INFILE

INPUT="${INFOLDER}${INFILE}"

echo $INPUT

echo "  "
echo "## =========================================== ##"
echo "## Please enter a video-quality setting (0-10) ##"
echo "## =========================================== ##"

read -p "Enter video quality [6]: " VQ
VQ=${VQ:-6} ## Set default value to 6

echo "  "
echo "## ============================================ ##"
echo "## Please enter an audio-quality setting (0-10) ##"
echo "## ============================================ ##"

read -p "Enter audio quality [3]: " AQ
AQ=${AQ:-3} ## Set default value to 3

OUTPUT="${OUTFOLDER}${INFILE%.mp4}"

echo " "
echo "## ====================== ##"
echo "## Running FFMPEG command ##"
echo "## ====================== ##"

echo "## RUNNING: ffmpeg -i ${INPUT} -c:v libtheora -q:v ${VQ} -c:a libvorbis -q:a ${AQ} ${OUTPUT}_v${VQ}-a${AQ}.ogv ##"

ffmpeg -i $INPUT -c:v libtheora -q:v $VQ -c:a libvorbis -q:a $AQ "${OUTPUT}_v${VQ}-a${AQ}.ogv"
