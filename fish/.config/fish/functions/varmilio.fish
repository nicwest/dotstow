function varmilio
	setxkbmap gb
	xkbcomp -I$HOME/.config/xkb $HOME/.config/xkb/varmilio.xkb $DISPLAY
end
