#!/bin/bash

cd

flatpak install flathub com.discordapp.Discord
flatpak install flathub com.brave.Browser
flatpak install flathub com.heroicgameslauncher.hgl
flatpak install flathub net.retrodeck.retrodeck
flatpak install flathub org.qbittorrent.qBittorrent
flatpak install flathub org.onlyoffice.desktopeditors
flatpak install flathub com.obsproject.Studio
flatpak install flathub org.vinegarhq.Sober
flatpak install flathub com.protonvpn.www
flatpak install flathub io.podman_desktop.PodmanDesktop
flatpak install flathub io.mpv.Mpv
flatpak install flathub com.github.tchx84.Flatseal
flatpak install flathub com.usebottles.bottles

flatpak config --user --set languages "en;ja"
flatpak config --set languages "en;ja"
flatpak update

flatpak run io.podman_desktop.PodmanDesktop
