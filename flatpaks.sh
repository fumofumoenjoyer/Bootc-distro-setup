#!/bin/bash

cd

flatpak install flathub com.discordapp.Discord --noninteractive
flatpak install flathub com.brave.Browser --noninteractive
flatpak install flathub com.heroicgameslauncher.hgl --noninteractive
flatpak install flathub org.qbittorrent.qBittorrent --noninteractive
flatpak install flathub org.onlyoffice.desktopeditors --noninteractive
flatpak install flathub com.obsproject.Studio --noninteractive
flatpak install flathub org.vinegarhq.Sober --noninteractive
flatpak install flathub com.protonvpn.www --noninteractive
flatpak install flathub io.podman_desktop.PodmanDesktop --noninteractive
flatpak install flathub io.mpv.Mpv --noninteractive
flatpak install flathub com.github.tchx84.Flatseal --noninteractive
flatpak install flathub com.usebottles.bottles --noninteractive
flatpak install flathub com.valvesoftware.Steam --noninteractive
flatpak install flathub com.vysp3r.ProtonPlus --noninteractive
flatpak install flathub com.ranfdev.DistroShelf --noninteractive

flatpak config --user --set languages "en;ja"
flatpak config --set languages "en;ja"
flatpak update


