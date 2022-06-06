#!/bin/bash

# Ansi color code variables
# shellcheck disable=SC2034
red="\e[0;91m"
# shellcheck disable=SC2034
blue="\e[0;94m"
# shellcheck disable=SC2034
green="\e[0;92m"
# shellcheck disable=SC2034
white="\e[0;97m"
# shellcheck disable=SC2034
bold="\e[1m"
# shellcheck disable=SC2034
uline="\e[4m"
# shellcheck disable=SC2034
reset="\e[0m"

clear

bigtext() {
	if [ "$(which figlet)" == "/usr/bin/figlet" ]; then
		echo -e "${bold}$(figlet Zorin Tweaks)"
	else
		echo -e "${bold}Zorin Tweaks${reset}"
	fi
}

restart_gnome() {
	if [ "$XDG_SESSION_TYPE" != "wayland" ]; then
		echo -e "${green}restarting GNOME...${reset}"
		sleep 5s
		busctl --user call org.gnome.Shell /org/gnome/Shell org.gnome.Shell Eval s 'Meta.restart("Restarting...")'
		sleep 5s
		echo -e "${green}GNOME restarted!${reset}"
	else
		echo -e "${red}Wayland won't restart GNOME by default, please logout and enable the extensions yourself using the GNOME Extensions app!${reset}"
	fi
}

help() {
	bigtext
	echo -e "${bold}This script allows to set different Layouts on Zorin OS 16, as well as applying some other tweaks.${reset}"
	echo -e "${green}Source Code: GitHub.com/TGRush/ZorinLayoutsRevised${reset}"
	echo -e "${reset}------------"
	echo -e "${blue}${bold}${uline}Syntax${reset}: $0 [Options]"
	echo -e "${reset}------------"
	echo -e "${blue}${bold}${uline}Available options:${reset}"
	echo -e "$0 -h   |   ${green}shows a help to do different actions${reset}"
	echo "------------"
	printf "\n"
	exit
}

popshell() {
	echo -e "${red} heavily in-Beta, might not work as expected${reset}"
	echo -e "${red}THIS REPLACES GNOME DEFAULT KEYBOARD SHORTCUTS${reset}"
	read -r -p "Press [Enter] to continue, or [CTRL + C] to cancel."
	sudo apt install git node-typescript make build-essential -y
	mkdir ~/.popshell
	cd ~/.popshell || exit
	git clone https://github.com/pop-os/shell.git
	cd shell || exit
	make local-install
	restart_gnome
	gnome-extensions enable pop-shell@system76.com -q
	echo -e "${red}The Keybinds can be reset in settings > keybinds!${reset}"
	exit
}

noannoyance() {
	# old ↓
	# echo -e "${green}Downloading extension...${reset}"
	# sudo apt install gnome-shell-extension-no-annoyance
	# restart_gnome
	# gnome-extensions enable noannoyance@sindex.com -q
	$PWD/gnome-shell-extension-installer 2182 3.8 --restart-shell
}

tilingassistant() {
	# echo -e "${green}Downloading Extension...${reset}"
	# wget https://extensions.gnome.org/extension-data/tiling-assistantleleat-on-github.v23.shell-extension.zip
	# unzip tiling-assistantleleat-on-github.v23.shell-extension.zip -d ~/.local/share/gnome-shell/extensions/tiling-assistant@leleat-on-github/
	# restart_gnome
	# gnome-extensions enable tiling-assistant@leleat-on-github
	# echo -e "${green}all done!${reset}"
	$PWD/gnome-shell-extension-installer 3733 3.8 --restart-shell
}

caffeine() {
	# echo -e "${green}Downloading extension...${reset}"
	# wget https://extensions.gnome.org/extension-data/caffeinepatapon.info.v37.shell-extension.zip
	# unzip caffeinepatapon.info.v37.shell-extension.zip -d ~/.local/share/gnome-shell/extensions/caffeine@patapon.info/
	# restart_gnome
	# gnome-extensions enable caffeine@patapon.info
	# echo -e "${green}all done!${reset}"
	$PWD/gnome-shell-extension-installer 517 3.8 --restart-shell
}

justperfection() {
	# echo -e "${green}Downloading extension...${reset}"
	# wget https://extensions.gnome.org/extension-data/just-perfection-desktopjust-perfection.v16.shell-extension.zip
	# unzip just-perfection-desktopjust-perfection.v16.shell-extension.zip -d ~/.local/share/gnome-shell/extensions/just-perfection-desktop@just-perfection/
	# restart_gnome
	# gnome-extensions enable just-perfection-desktop@just-perfection
	# echo -e "${green}all done!${reset}"
	$PWD/gnome-shell-extension-installer 3843 3.8 --restart-shell
}

blurmyshell() {
	# echo -e "${green}Downloading extension...${reset}"
	# wget https://extensions.gnome.org/extension-data/blur-my-shellaunetx.v22.shell-extension.zip
	# unzip blur-my-shellaunetx.v22.shell-extension.zip -d ~/.local/share/gnome-shell/extensions/blur-my-shell@aunetx/
	# restart_gnome
	# gnome-extensions enable blur-my-shell@aunetx
	# echo -e "${green}all done!${reset}"
	$PWD/gnome-shell-extension-installer 3193 3.8 --restart-shell
}

unity() {
	# echo -e "${green}Downloading extension...${reset}"
	# wget https://extensions.gnome.org/extension-data/unitehardpixel.eu.v59.shell-extension.zip
	# unzip unitehardpixel.eu.v59.shell-extension.zip -d ~/.local/share/gnome-shell/extensions/unite@hardpixel.eu/
	# restart_gnome
	gnome-extensions disable zorin-menu@zorinos.com
	gnome-extensions disable zorin-taskbar@zorinos.com
	cat unity-titlebar | dconf load /org/gnome/desktop/wm/preferences/button-layout/
	cat unity-dock | dconf load /org/gnome/shell/extensions/zorin-dash/
	gnome-extensions enable zorin-dash@zorinos.com
	# gnome-extensions enable unite@hardpixel.eu
	$PWD/gnome-shell-extension-installer 1287 3.8 --restart-shell
	echo -e "${green}all done!${reset}"
}

btquickconnect() {
	# wget https://extensions.gnome.org/extension-data/bluetooth-quick-connectbjarosze.gmail.com.v16.shell-extension.zip
	# unzip bluetooth-quick-connectbjarosze.gmail.com.v16.shell-extension.zip -d ~/.local/share/gnome-shell/extensions/bluetooth-quick-connect@bjarosze.gmail.com/
	# restart_gnome
	# gnome-extensions enable bluetooth-quick-connect@bjarosze.gmail.com
	# echo -e "${green}all done!${reset}"
	$PWD/gnome-shell-extension-installer 1401 3.8 --restart-shell
	echo -e "${green}all done!${reset}"
}

impatience() {
	$PWD/gnome-shell-extension-installer 277 3.8 --restart-shell 
	echo -e "${green}all done!${reset}"
}

revert() {
	# sudo apt remove gnome-shell-extension-no-annoyance node-typescript -y
	# rm -rf ~/.local/share/gnome-shell/extensions/{bluetooth-quick-connect@bjarosze.gmail.com,unite@hardpixel.eu,blur-my-shell@aunetx,just-perfection-desktop@just-perfection,caffeine@patapon.info,tiling-assistant@leleat-on-github,noannoyance@sindex.com,pop-shell@system76.com}
	# gnome-extensions disable bluetooth-quick-connect@bjarosze.gmail.com unite@hardpixel.eu blur-my-shell@aunetx just-perfection-desktop@just-perfection caffeine@patapon.info tiling-assistant@leleat-on-github noannoyance@sindex.com pop-shell@system76.com -q
	echo -e "${red}reverting is temporarily removed."
}

gui() {
	ask=$(zenity --list --title="Installation Options" --column="0" "Pop-Shell (BETA)" "Unity Layout (BETA)" "Misc." --width=100 --height=300 --hide-header)

	if [ "$ask" == "Pop-Shell (BETA)" ]; then
		popshell
	elif [ "$ask" == "Unity Layout (BETA)" ]; then
		unity
	elif [ "$ask" == "Info" ]; then
		help
	fi

	if [ "$ask" == "Misc." ]; then
		ask2=$(zenity --list --title="Installation Options" --column="0" "Install No Annoyance" "Install Tiling Assistant" "Install Caffeine" "Install BlurMyShell" "Install Just Perfection" "Install Bluetooth Quick Connect" --width=100 --height=300 --hide-header)
		elif [ "$ask2" == "Install No Annoyance" ]; then
			noannoyance
		elif [ "$ask2" == "Install Tiling Assistant" ]; then
			tilingassistant
		elif [ "$ask2" == "Install Caffeine" ]; then
			caffeine
		elif [ "$ask2" == "Install Just Perfection" ]; then
			justperfection
		elif [ "$ask2" == "Install BlurMyShell" ]; then
			blurmyshell
		elif [ "$ask2" == "Install Bluetooth Quick Connect" ]; then
			btquickconnect
	fi
}

tui () {
	echo "${bold}${green}ZorinLayoutsRevised${reset}"
	echo "Select one of the following to install:"
	echo "1		Install Pop-shell window tiling"
	echo "2		Install the unity-like layout"
	echo "3		Install NoAnnoyance"
	echo "4		Install Tiling Assistant (Win10 Window Tiling)"
	echo "5		Install Caffeine (stop auto-suspend)"
	echo "6		Install Just Perfection"
	echo "7		Install BlurMyShell"
	echo "8		Install Bluetooth Quick Connect"
	echo "9		Revert any changes"
	echo "0		Exit"
	read -r -p "Your selection: " tuiinput
		case $tuiinput in
			1)
				popshell
				;;
			2)
				unity
				;;
			3)
				noannoyance
				;;
			4)
				tilingassistant
				;;
			5)
				caffeine
				;;
			6)
				justperfection
				;;
			7)
				blurmyshell
				;;
			8)
				btquickconnect
				;;
			0)
				echo "Exiting!"
				exit 0;
				;;
			*)
				echo "$tuiinput is not a valid option!"
				exit 1;
		esac
}

if [ -n "$1" ]; then
	case "$1" in
	-h)
		help
		;;
	-g)
		gui
		;;
	--uninstall)
		revert
		;;
	-u)
		revert
		;;
	*)
		echo "$1 is not an option"
		;;
	esac
	shift
else
	gui
fi
