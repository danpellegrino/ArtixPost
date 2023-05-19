#!/bin/sh

# Daniel Pellegrino Script
# by Daniel Pellegrino
# License: GNU GPLv3
# Based Upon: https://raw.githubusercontent.com/LukeSmithxyz/LARBS/master/static/larbs.sh


dotfiles="https://github.com/danpellegrino/ArtixRice.git"
aurhelper="yay"
repobranch="main"
export TERM=ansi


installpkg() {
	pacman --noconfirm --needed -S "$1" >/dev/null 2>&1
}

error() {
	# Log to stderr and exit with failure.
	printf "%s\n" "$1" >&2
	exit 1
}

welcomemsg() {
	whiptail --title "Welcome!" \
		--msgbox "Welcome to Daniel's Auto-Rice Bootstrapping Script!\\n\\nThis script will automatically install a fully-featured Linux desktop, which I use on my laptop.\\n\\n-Daniel" 10 60

	whiptail --title "Important Note!" --yes-button "All ready!" \
		--no-button "Return..." \
		--yesno "Be sure the computer you are using has current pacman updates and refreshed Arch keyrings.\\n\\nIf it does not, the installation of some programs might fail." 8 70
}

pacman --noconfirm --needed -Sy libnewt ||
	error "Are you sure you're running this as the root user, are on an Arch-based distribution and have an internet connection?"

# Welcome user and pick dotfiles.
welcomemsg || error "User exited."
