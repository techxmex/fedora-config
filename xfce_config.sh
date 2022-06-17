#!/bin/bash

# Install packages after installing Fedora XFCE

# Configure DNF
sudo dnf install -y \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install -y \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
  
sudo cp -f dnf.conf /etc/dnf/
sudo dnf update -y

# Browser Installation (eg. chromium)
sudo dnf install -y netsurf

# Neofetch/HTOP
sudo dnf install -y neofetch htop

# Printing and bluetooth (if needed)
sudo systemctl stop cups-browsed
sudo systemctl disable cups-browsed

# Command line text editor -- nano preinstalled
sudo dnf install -y vim mousepad

#install icons and theme
sudo dnf install -y papirus-icon-theme arc-theme

#install video player
sudo dnf install -y celluloid

#install video transcoder
sudo dnf install -y handbrake

#install video codecs
sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install -y lame\* --exclude=lame-devel
sudo dnf group upgrade --with-optional Multimedia -y

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
sudo dnf install -y lightdm-gtk-greeter-settings slick-greeter
sudo cp -f lightdm.conf /etc/lightdm/
sudo cp -f slick-greeter.conf /etc/lightdm/
sudo cp -f purplegalaxy.jpg /usr/share/backgrounds/

#script to configure themes
xfconf-query -c xsettings -p /Net/IconThemeName -s "Papirus-Dark"
xfconf-query -c xsettings -p /Net/ThemeName -s "Arc-Dark"
xfconf-query -c xfwm4 -p /general/theme -s "Arc-Dark"
xfconf-query -c xfwm4 -p /general/workspace_count -s "2"
#set wallpaper, path depends on system
#xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVirtual-1/workspace0/last-image -s /usr/share/backgrounds/purplegalaxy.jpg
#xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/last-image -s /usr/share/backgrounds/purplegalaxy.jpg
