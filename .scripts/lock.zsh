#!/usr/bin/env zsh

background="#1F1F1F"
foreground="#D4D4D4"
red='#e06c75'
green='#98c379'
blue='#61afef'
alpha='4b'
orange='#ffb86c'
none='#00000000'

i3lock \
	--insidever-color=$none \
	--insidewrong-color=$none \
	--inside-color=$none \
	--separator-color=$none \
	--line-color=$none \
	--verif-text="" \
	--wrong-text="" \
	--noinput="" \
	--lock-text="" \
	--lockfailed="" \
	--pass-media-keys \
	--pass-screen-keys \
	--pass-volume-keys \
	--color=$background$alpha \
	--ringver-color=$orange \
	--ringwrong-color=$red \
	--ring-color=$blue \
	--keyhl-color=$foreground \
	--bshl-color=$orange \
	--layout-color=$blue \
	--date-color=$foreground \
	--time-color=$foreground \
	--clock \
	--force-clock \
	--indicator \
	--time-str="%H:%M:%S" \
	--date-str="%A %e %B %Y" \
	--radius=128 \
	--ring-width=12 \
