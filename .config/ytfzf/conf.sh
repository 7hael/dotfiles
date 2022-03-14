#!/bin/sh

ytdl_path="yt-dlp"

external_menu () {
    dmenu -l 30 -p "$1"
}
