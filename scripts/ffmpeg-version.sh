#!/bin/bash

echo ""
echo "## ====================================================== ##"
echo "##        Checking 'ffmpeg' installation version...       ##"
echo "## ====================================================== ##"

if ffmpeg -version | grep -q 'ffmpeg version'; then
  version=`ffmpeg -version`
  number=`echo $version | cut -c 1-18`
  echo ""
  echo "       ## ====================================== ##"
  echo "       ## ==== YOU ARE USING FFMPEG VERSION ==== ##"
  echo "       ## ====     $number       ==== ##"
  echo "       ## ====================================== ##"
  echo ""
fi

echo "## ====================================================== ##"
echo "##             Done checking 'ffmpeg' version.            ##"
echo "## ====================================================== ##"
