#!/bin/sh 
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
userprofile=$HOME/.xprofile.sh
fehbg=$HOME/.fehbg
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

if [ -f "$userprofile" ]; then
    source "$userprofile"
fi

if [ -f "$fehbg" ]; then
    source "$fehbg"
fi

systemctl --user import-environment DISPLAY

autocutsel -fork &
autocutsel -selection PRIMARY -fork &

setxkbmap gb
setxkbmap -option caps:escape

#xautolock -time 5 -locker i3lock -notify 20 -notifier 'notify-send "locking in 20 seconds"' &

# https://www.x.org/wiki/Development/Documentation/PointerAcceleration/
xinput --set-prop "TPPS/2 Elan TrackPoint" "Device Accel Profile" "6"
xinput --set-prop "TPPS/2 Elan TrackPoint" "Device Accel Constant Deceleration" "1.000000"
xinput --set-prop "TPPS/2 Elan TrackPoint" "Device Accel Adaptive Deceleration" "1.000000"
xinput --set-prop "TPPS/2 Elan TrackPoint" "Device Accel Velocity Scaling" "30"
xinput --set-prop "TPPS/2 Elan TrackPoint" "Evdev Middle Button Emulation" "1"
xinput --set-prop "TPPS/2 Elan TrackPoint" "Evdev Middle Button Button" "2"
xinput --set-prop "TPPS/2 Elan TrackPoint" "Evdev Wheel Emulation" "1"
xinput --set-prop "TPPS/2 Elan TrackPoint" "Evdev Wheel Emulation Button" "2"


exec i3
#exec gnome-session
