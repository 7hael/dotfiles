#!/bin/sh

dwmblocks &
setxkbmap -option caps:swapescape
lxsession &
# systemctl start touchegg.service &
# touchegg &
thunar --daemon &
transmission-daemon &
dunst &
wallset &
