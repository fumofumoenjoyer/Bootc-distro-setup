# Bootc-distro-setup

Modify the distrobox with your architecture (this one uses v4)

### Gaming
```
distrobox create --name "gaming" --image "docker.io/cachyos/cachyos-v4:latest" --nvidia --hostname "${HOSTNAME}" --additional-flags "--volume /run/user/$(id -u)/bus:/run/user/$(id -u)/bus:z --device /dev/dri:/dev/dri"
```
```
sudo pacman -Syu yay
yay -Syu noto-fonts-cjk noto-fonts-emoji noto-fonts otf-ipafont ttf-hack-nerd ttf-jetbrains-mono-nerd libdisplay-info lib32-libdisplay-info libappindicator lib32-libappindicator libappindicator-gtk3 lib32-libappindicator-gtk3 libdbusmenu-gtk3 lib32-libdbusmenu-gtk3 bottles lsfg-vk-bin cachyos-gaming-applications cachyos-gaming-meta
```
```
distrobox-export --bin steam
distrobox-export --app lsfg-vk-ui
distrobox-export --app goverlay
distrobox-export --app heroic
distrobox-export --app bottles
```
### Dev
```
distrobox create --name "dev" --image "docker.io/cachyos/cachyos-v4:latest" --init --nvidia --hostname "${HOSTNAME}" --additional-flags "--volume /run/user/$(id -u)/bus:/run/user/$(id -u)/bus:z --device /dev/dri:/dev/dri"
```
```
sudo pacman -Syu yay
yay -Syu noto-fonts-cjk noto-fonts-emoji noto-fonts otf-ipafont ttf-hack-nerd ttf-jetbrains-mono-nerd libdisplay-info lib32-libdisplay-info libappindicator lib32-libappindicator libappindicator-gtk3 lib32-libappindicator-gtk3 libdbusmenu-gtk3 lib32-libdbusmenu-gtk3 base-devel npm zsh bash spyder github-cli typescript eslint python-pip gdb gcc make maven jdk-openjdk kotlin clang llvm lld lldb libc++ cython libclc polly rustup antigravity gemini-cli google-chrome visual-studio-code-bin go
```
```
rustup default stable
rustup target add wasm32-unknown-unknown
```
```
distrobox-export --app antigravity
distrobox-export --bin antigravity
distrobox-export --app code
distrobox-export --bin code
```
```
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.zshrc
```
