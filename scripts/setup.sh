#!/bin/bash

set -e

echo ">>> Installing important packages..."
sudo pacman -S --noconfirm \
	git \
	curl \
	zsh \
	firefox \
	tmux \
	ghostty \
	unzip \
	neovim \
	base-devel \
	xdg-utils \
	stow \
	grim \
	wl-clipboard \
	slurp \
	jq

echo ">>> Installing AUR helper (yay)..."
if ! command -v yay &>/dev/null; then
  git clone https://aur.archlinux.org/yay.git ~/yay && cd ~/yay
  makepkg -si --noconfirm
  cd ~
  rm -rf ~/yay
fi

echo ">>> Installing base Hyprland packages..."
yay -S --noconfirm \
	qt5-wayland \
	qt6-wayland \
	hyprlock \
	hypridle \
	hyprpaper \
	hyprpolkitagent \
	hyprpicker \
	hyprshot \
	waybar \
	rofi \
	cliphist \
	brightnessctl \
	playerctl \
	xdg-desktop-portal-hyprland \
	xdg-desktop-portal \
	noto-fonts \
	noto-fonts-emoji \
	ttf-font-awesome \
	ttf-droid \
	dunst \
	nordic-theme \
	thunar

echo ">>> Done. Now load the config and reboot!" 
