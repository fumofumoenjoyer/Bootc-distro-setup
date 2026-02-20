# Bootc-distro-setup

Modify the distrobox with your architecture (this one uses v4)
```
distrobox create --name "gaming" --image "docker.io/cachyos/cachyos-v4:latest" --nvidia --hostname "${HOSTNAME}" --additional-flags "--volume /run/user/$(id -u)/bus:/run/user/$(id -u)/bus:z --device /dev/dri:/dev/dri"
```
```
sudo pacman -Syu yay
yay -Syu noto-fonts-cjk noto-fonts-emoji noto-fonts otf-ipafont libdisplay-info lib32-libdisplay-info libappindicator lib32-libappindicator libappindicator-gtk3 lib32-libappindicator-gtk3 libdbusmenu-gtk3 lib32-libdbusmenu-gtk3 bottles lsfg-vk-bin cachyos-gaming-applications cachyos-gaming-meta
```
