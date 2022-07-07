# `ffmpeg` Scripts

>
> Bash scripts to help automate common `ffmpeg` video-conversion commands that I'm always using for work!
> 

-----

## Overview

```
  ./
  |
  |---- scripts/
  |        |
  |        |---- IN/
  |        |      |____ <source-file>.mp4
  |        |
  |        |---- OUT/
  |        |      |____ <converted-file>.{ogv,webm}
  |        |
  |        |---- mp4-to-ogv.sh
  |        |____ mp4-to-webm.sh
  |
  |---- .gitignore
  |____ README.md
```

This project consists of some bash scripts and a few folders.

To use it, without granting crazy permissions (to some random scripts you didn't create,) simply copy-and-paste your source MP4 video file into the projects' `./scripts/IN/` directory. Next, run the desired script, answer a few prompts, and your converted file will be in the projects' `./scripts/OUT/` directory.

Each script has the bash hashbang header (`#!/bin/bash`) in case you don't like to prefix your scripts with `bash`.

-----

## Prerequisites

1. A **Linux-like environment** with a `bash` version that supports the `read` command (which is pretty basic):
   - `read` is a `bash` builtin that may not exist in older versions of bash &mdash; check by running: `help read` or `man read`
1. A working `ffmpeg` installation with the necessary libraries for MP4, OGV, & WEBM formats:
   - I use **Homebrew** to install ffmpeg &mdash; the latest homebrew installation and info can be found at their website: <https://brew.sh/>:
     - Once `brew` is working install the `ffmpeg` command and libraries using: `brew install ffmpeg --with-fdk-aac --with-libass --with-libvpx --with-openssl`. **Or, better yet, check the latest brew formula & install for `ffmpeg` here: <https://formulae.brew.sh/formula/ffmpeg>.**
   - **OTHERWISE**, `ffmpeg` can *now* be installed as a standalone software/tool: <https://ffmpeg.org/download.html>. (I have never used it this way.)

Check out more information about **ffmpeg** at their official website: <https://ffmpeg.org>.

-----

## Checking your install (optional)

**This section is provided as a convenience and is not necessary** — especially if you have a brand new `ffmpeg` install of the latest version. 

The scripts in this section are used to verify your `ffmpeg` installation and configuration settings. If you installed `ffmpeg` a long time ago, you may want to use them to make sure your install can handle the video conversions.

### `ffmpeg` version

You can run the bash script `./scripts/ffmpeg-version.sh` to figure out what version of ffmpeg you have installed:
```bash
bash ./scripts/ffmpeg-version.sh
```

The script uses the output from running `ffmpeg -version` to get your version number.
At the time of writing this, I am using **ffmpeg version 4.4** which is not the latest (version 5.)

### Enabled libraries

If you want to make sure that you have the `libtheora`, `libvorbis`, `libvpx`, & `libopus` libraries installed and enabled in `ffmpeg`, run the following:

```bash
bash ./scripts/ffmpeg-enabled-libraries.sh
```

It checks for each of the libraries in your ffmpeg configuration and will let you know which ones are missing, if any.

The script uses the output from `ffmpeg -buildconf` to check for the correct `--enable-lib*` settings.

-----

## Usage

1. Copy your source `*.mp4` video-file into the local `./scripts/IN/` folder
2. Run desired bash script:
   - Convert MP4 file to OGV: `bash ./scripts/mp4-to-ogv.sh`
   - Convert Mp4 file to WEBM: `bash ./scripts/mp4-to-webm.sh`
3. Answer any prompts (to set your quality settings,) or press return to accept defaults.
4. The converted video will be output to the local `./scripts/OUT/` folder after `ffmpeg` has completed running (which may take several minutes depending on file size.)

-----

## The Scripts

This repository contains the following bash scripts in the (`./scripts/` folder):
```
  ./scripts/
      |---- ffmpeg-enabled-libraries.sh
      |---- ffmpeg-version.sh
      |---- mp4-to-ogv.sh
      |---- mp4-to-webm.sh
      |
      |---- IN/
      |      |____ *.mp4              ## Source MP4 files here ##
      |
      |____ OUT/
             |____ *.{ogv,webm,mp4}   ## Converted video files here ##
```

### Checking your `ffmpeg` install/config

- `ffmpeg-version.sh` &mdash; bash script to verify `ffmpeg` is installed and return ffmpeg version number
- `ffmpeg-enabled-libraries.sh` &mdash; bash script to check if `libtheora`, `libvorbis`, `libvpx`, &  `libopus` are installed and enabled in ffmpeg. **_These libraries are necessary to run most of the ffmpeg scripts in the project._**

### Convert videos

- `./scripts/mp4-to-ogv.sh` &mdash; bash script to convert MP4 file into OGV format
- `./scripts/mp4-to-webm.sh` &mdash; bash script to convert MP4 file into WEBM format

#### MP4 to OGV — `mp4-to-ogv.sh`

Use this script to convert an MP4 video file into OGV.

It uses `libtheora` and `libvorbis` to convert the audio and video streams from your source MP4 file.

Default video and audio settings are as follows:
- **Video quality:** `6`
- **Audio quality:** `3`

Press return when prompted to accept default values.
If these quality settings produce a video file that is too large, reduce the quality settings and run the script again.

#### MP4 to WEBM — `mp4-to-webm.sh`

Use this script to convert an MP4 video file to WEBM.

It uses `libvpx-vp9` and `libopus` to convert the audio and video streams.

- **Video quality** is set using the `-crf` flag (default is set to `30`.)
- **Audio quality** is set using the `-b:a` flag (value should be specified as a bitrate e.g. `128k` — which is the set default.)

-----
