#!/bin/sh
[ -f ~/.config/x11/xresources ] && xrdb -merge -I $HOME ~/.config/x11/xresources
[ -f "$HOME/.config/shell/profile" ] && . "$HOME/.config/shell/profile"
[ -f "$HOME/.config/shell/aliases" ] && . "$HOME/.config/shell/aliases"
exec dwm
