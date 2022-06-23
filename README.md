# `ffmpeg` Scripts

> Bash scripts to make running common ffmpeg commands faster!

-----

## Prerequisites

- A `bash` version that supports the `read` command and has `ffmpeg` installed:
- `ffmpeg` &mdash; installed via homebrew (with necessary libraries)

## Usage

1. Copy `*.mp4` video file into the local `./IN/` folder
2. Run desired shell command
   - E.g. `sh mp4-to-ogv.sh`
3. Answer prompts to set quality settings
4. Converted video will be found in local `./OUT/` folder after ffmpeg has completed running
