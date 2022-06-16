#!/bin/bash

# Default packages are for the configuration and corresponding .config folders
# Install packages after installing base Debian with no GUI

# Configure DNF
sudo dnf install -y \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install -y \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
  
sudo cp -f dnf.conf /etc/dnf/
sudo dnf update -y

# xorg display server installation
sudo dnf install -y sddm
systemctl enable sddm
systemctl set-default graphical.target

# Build-essential.
#sudo dnf install -y build-essential 

# Microcode for Intel/AMD 
# sudo dnf install -y amd-microcode
sudo dnf install -y intel-microcode 

#XFCE packages
sudo dnf install -y xfce4 xfce4-goodies xfconf

# Browser Installation (eg. chromium)
sudo dnf install -y firefox

# Sound packages (pulseaudio installed prior)
sudo dnf install -y alsa-utils volumeicon-alsa

# Neofetch/HTOP
sudo dnf install -y neofetch htop

#copy my bashrc file
sudo cp -f .bashrc ~/

# Printing and bluetooth (if needed)
sudo dnf install -y cups libcupsimage2
sudo dnf install -y bluez blueman

sudo systemctl enable bluetooth
sudo systemctl enable cups

sudo systemctl stop cups-browsed
sudo systemctl disable cups-browsed

# Command line text editor -- nano preinstalled
sudo dnf install -y vim

# Install fonts
#sudo dnf install fonts-font-awesome fonts-powerline fonts-ubuntu fonts-liberation2 fonts-liberation fonts-terminus

#install icons and theme
sudo dnf install -y papirus-icon-theme arc-theme

#install video player
sudo dnf install -y celluloid

#install video transcoder
sudo dnf install -y handbrake

#install video codecs


sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel

sudo dnf install lame\* --exclude=lame-devel

sudo dnf group upgrade --with-optional Multimedia

#install torrent app
sudo dnf install -y transmission-gtk

#install vir-manager
sudo dnf install -y virt-manager
sudo gpasswd -a louis libvirt
sudo gpasswd -a louis libvirt-qemu

#flatpak setup
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#flatpak apps
flatpak install flathub com.brave.Browser -y
flatpak install flathub com.makemkv.MakeMKV -y
flatpak install flathub com.github.tchx84.Flatseal -y

# Install LightDM GTK Greeter Settings (lightdm,lightdm-gtk-greeter installs with xfce)
#sudo dnf install -y lightdm-gtk-greeter-settings slick-greeter
#sudo cp -f lightdm.conf /etc/lightdm/
#sudo cp -f slick-greeter.conf /etc/lightdm/
#sudo cp -f purplegalaxy.jpg /usr/share/backgrounds/
#sudo systemctl enable lightdm


sudo dnf autoremove

printf "\e[1;32mTime to reboot! Thanks!\e[0m\n"
