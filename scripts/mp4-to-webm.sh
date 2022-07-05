#!/bin/bash

echo ""
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
echo "## Please enter the filename of your MP4 located in ./IN/ ##"
echo "## ==================================================================== ##"

read INFILE

INPUT="${INFOLDER}${INFILE}"

echo $INPUT

VQ=30

echo "  "
echo "## =============================== ##"
echo "## Video quality set to -crf ${VQ} ##"
echo "## =============================== ##"

AQ=128k

echo "  "
echo "## =============================== ##"
echo "## Audio quality set to -b:a ${AQ} ##"
echo "## =============================== ##"

OUTPUT="${OUTFOLDER}${INFILE%.mp4}"

echo " "
echo "## ====================== ##"
echo "## Running FFMPEG command ##"
echo "## ====================== ##"

echo "ffmpeg -i ${INPUT} -c:v libvpx-vp9 -crf ${VQ} -b:v 0 -c:a libopus -b:a ${AQ} ${OUTPUT}_crf${VQ}-a${AQ}.webm"

ffmpeg -i $INPUT -c:v libvpx-vp9 -crf $VQ -b:v 0 -c:a libopus -b:a $AQ "${OUTPUT}_crf${VQ}-a${AQ}.webm"
