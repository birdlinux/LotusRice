#!/bin/bash

print_ascii_art() {
	clear
    echo "        _____  "
    echo "      /  ___  \\"
    echo "    /  /  _  \\  \\"
    echo "  /( /( /(_)\ )\ )\\"
    echo " (  \\  \\ ___ /  /  )"
    echo " (    \\ _____ /    )"
    echo " /(               )\\"
    echo "|  \\             /  |"
    echo "|    \\ _______ /    |"
    echo " \\    / \\   / \\    /"
    echo "   \\/    | |    \\/"
    echo "         | | "
    echo "         | |"
    echo "         | |"
    echo " "
    echo " "
}

create_directories() {
	cd $HOME
	echo "🢒 Creating the Folders"
    pictures_directory="Pictures"
    documents_directory="Documents"
    picture_subdirectories=("ProfilePictures" "Screenshots" "Memes" "Important" "Junk")
    document_subdirectories=("Books" "Projects" "Work Related")

    for subdirectory in "${picture_subdirectories[@]}"; do
        path="$pictures_directory/$subdirectory"
        mkdir -p "$path"
    done

    for subdirectory in "${document_subdirectories[@]}"; do
        path="$documents_directory/$subdirectory"
        mkdir -p "$path"
    done
}

update_system() {
	cd $HOME
	echo "🢒 Updating the system"
	sudo apt-get update -y &> /dev/null
	echo "🢒 Upgrading the system"
	sudo apt-get upgrade -y &> /dev/null
}

install_components() {
    cd $HOME
	echo "🢒 Installing Dependencies"
    sudo apt-get install libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-dpms0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl-dev libegl-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev meson libxcb-util-dev feh xdo rofi flameshot wget libx11-dev curl gpg git libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev libxcb-render0-dev libxcb-shape0-dev libxcb-xfixes0-dev bspwm sxhkd zathura ranger polybar dunst build-essential ninja-build nemo thunar python3 python3-pip python3-setuptools alacritty mpv cmus neofetch bashtop vim apt-transport-https golang -y &> /dev/null
}

install_picom() {
	cd $HOME
	"🢒 Installing Picom"
	git clone --quiet https://github.com/yshui/picom
	cd picom
	meson setup --buildtype=release . build &> /dev/null
	ninja -C build &> /dev/null
	cd build
	cd src
	sudo chmod +x picom
	sudo cp picom /usr/bin/ 
}

install_fonts() {
	cd $HOME
	echo "🢒 Installing and Configuring Fonts"
    wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip
    sudo unzip JetBrainsMono.zip -d /usr/share/fonts &> /dev/null
}

setup_config() {
	cd $HOME
	git clone --quiet https://github.com/birdlinux/LotusRice
    cd $HOME/LotusRice/.config/
    
    echo "🢒 Configuring files"
    cp -r * ~/.config/
    
    echo "🢒 Configuring scripts"
    cd 	$HOME/LotusRice/
    cp -r .scripts $HOME/
    
    echo "🢒 Setting permissions"
   	cd $HOME
    cd .config/
    sudo chmod +x * &> /dev/null
    sudo chmod +x */* &> /dev/null
    sudo chmod +x */*/* &> /dev/null
    sudo chmod +x */*/*/* &> /dev/null
    sudo chmod +x */*/*/*/* &> /dev/null
    sudo chmod +x */*/*/*/*/* &> /dev/null
    sudo chmod +x */*/*/*/*/*/* &> /dev/null
}
 
clean_files () {
	cd $HOME
	rm -rf JetBrainsMono.zip
	rm -rf LotusRice
	echo ""
	echo "🢒 Restart your system for the changes to apply"
	echo "🢒 Make sure to choose the BSPWM Window Manager on the Login Screen"
}
 

print_ascii_art
create_directories
update_system
install_components
install_picom
install_fonts
setup_config
clean_files



