#!/bin/bash

echo ""
echo "## ====================================================== ##"
echo "## ====================================================== ##"

buildconfig=`ffmpeg -buildconf`

if [[ $buildconfig =~ "--enable-libvorbis" ]] ; then
  echo "\"libvorbis\" is installed"
else
  echo "\"libvorbis\" must be installed with the --enable-libvorbis flag"
fi

if [[ $buildconfig =~ "--enable-libtheora" ]] ; then
  echo "\"libtheora\" is installed"
else
  echo "\"libtheora\" must be installed with the --enable-libtheora flag"
fi

if [[ $buildconfig =~ "--enable-libvpx" ]] ; then
  echo "\"libvpx\" is installed"
else
  echo "\"libvpx\" must be installed with the --enable-libvpx flag"
fi

if [[ $buildconfig =~ "--enable-libopus" ]] ; then
  echo "\"libopus\" is installed"
else
  echo "\"libopus\" must be installed with the --enable-libopus flag"
fi

# while read line ; do
# if [[ $line =~ "--enable-libvorbis" ]]
# then
#   echo $line
# fi
# done < "$buildconfig"

# if "$buildconfig" | grep -q "\--enable-libvorbis" ; then
#   echo "libvorbis"
# else
#   echo "no libvorbis"
# fi

echo "## ====================================================== ##"
echo "## ====================================================== ##"
