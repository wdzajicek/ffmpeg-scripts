# `ffmpeg` Scripts

>
> Bash scripts to help automate common `ffmpeg` video-conversion commands that I'm always using for work!
> 

-----

## Prerequisites

1. A **Linux-like environment** with a `bash` version that supports the `read` command:
   - `read` is a `bash` builtin that may not exist in older versions of bash &mdash; check by running: `help read` or `man read`
1. A working `ffmpeg` installation with the necessary libraries for MP4, OGV, & WEBM formats:
   - I use **Homebrew** to install ffmpeg &mdash; the latest homebrew installation and info can be found at: <https://brew.sh/>:
     - Once `brew` is working install `ffmpeg` and libraries using: `brew install ffmpeg --with-fdk-aac --with-libass --with-libvpx --with-openssl`
   - **OTHERWISE**, `ffmpeg` can *now* be installed as a standalone software/tool: <https://ffmpeg.org/download.html>

Check out more information about ffmpeg at the official website: <https://ffmpeg.org>.

-----

## Checking your `ffmpeg` installation

**This section is provided as a convenience and is not necessary** — especially if you have a brand new `ffmpeg` install of the latest version. The scripts in this section are used to verify your `ffmpeg` installation and configuration settings.

If you installed `ffmpeg` a long time ago, you may want to run these scripts and make sure your install can handle the video conversions.

### `ffmpeg` version

Use the bash script `./scripts/ffmpeg-version.sh` to figure out what version of ffmpeg you are using:

```bash
sh ./scripts/ffmpeg-version.sh
```

It uses the output from running `ffmpeg -version` to get your version number.

At the time of writing this, I am using **ffmpeg version 4.4** which is not the latest (version 5.)

### Enabled libraries

Run this command to make sure you have the `libtheora`, `libvorbis`, `libvpx`, & `libopus` libraries installed and enabled in `ffmpeg`:

```bash
sh ./scripts/ffmpeg-enabled-libraries.sh
```

It checks for each of the libraries in your ffmpeg configuration and will let you know if any are missing.

It uses the output from the `ffmpeg -buildconf` command to check for the correct `--enable-lib*` settings.

-----

## Usage

1. Copy your source `*.mp4` video-file into the local `./scripts/IN/` folder
2. Run desired bash script:
   - E.g. `sh ./scripts/mp4-to-ogv.sh`
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

### Check your `ffmpeg` install/config

- `ffmpeg-version.sh` &mdash; bash script to verify `ffmpeg` is installed and return ffmpeg version number
- `ffmpeg-enabled-libraries.sh` &mdash; bash script to check if `libtheora`, `libvorbis`, `libvpx`, &  `libopus` are installed and enabled in ffmpeg. **_These libraries are necessary to run most of the ffmpeg scripts in the project._**

### Convert videos

| Script | Description | Features | File Naming |
|--------|-------------|----------|-------------|
| `mp4-to-ogv.sh` | bash script to convert MP4 file into OGV format | Video & audio quality are set when prompted | `<SOURCE_FILENAME>_v<#>-a<#>.ogv` &mdash; where `<#>` represents an integer corresponding to the chosen video and audio quality settings |
| `mp4-to-webm.sh` | bash script to convert MP4 file into WEBM | Video & audio quality are set when prompted | `<SOURCE_FILENAME>_crf<#>-a<#>.webm` &mdash; where `<#>` represents the video and audio quality settings |

#### MP4 to OGV — `mp4-to-ogv.sh`

Use this script to convert an MP4 video file into OGV.

It uses `libtheora` and `libvorbis` to convert the audio and video streams from your source MP4 file.

Default video and audio settings are as follows:
- **Video quality:** 6
- **Audio quality:** 3

Press return when prompted for video and quality settings to accept the default values.
If these quality settings produce a video file that is too large, reduce the quality settings and run the command again.

#### MP4 to WEBM — `mp4-to-webm.sh`

Use this script to convert an MP4 video file to WEBM.

It uses `libvpx-vp9` and `libopus` to convert the audio and video streams.

- Video quality is set using the `-crf` flag (default is set to `30`.)
- Audio quality is set using the `-b:a` flag (value should be specified as a bitrate e.g. `128k` — which is the set default.)

-----
