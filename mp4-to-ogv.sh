#!/bin/bash

echo "## ====================================================== ##"
echo "## This script requires that you have 'ffmpeg' installed! ##"
echo "## ====================================================== ##"

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

read VQ

echo "  "
echo "## ============================================ ##"
echo "## Please enter an audio-quality setting (0-10) ##"
echo "## ============================================ ##"

read AQ

OUTPUT="${OUTFOLDER}${INFILE%.mp4}"

echo " "
echo "## ====================== ##"
echo "## Running FFMPEG command ##"
echo "## ====================== ##"

echo "## RUNNING: ffmpeg -i ${INPUT} -c:v libtheora -q:v ${VQ} -c:a libvorbis -q:a ${AQ} ${OUTPUT}_v${VQ}-a${AQ}.ogv ##"

ffmpeg -i $INPUT -c:v libtheora -q:v $VQ -c:a libvorbis -q:a $AQ "${OUTPUT}_v${VQ}-a${AQ}.ogv"
