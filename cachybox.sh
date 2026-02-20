#!/bin/bash
#
# Archlinux environment setup script
#

# --- Configuration ---
# You can change the container name here if you like.
CONTAINER_NAME="cachybox"
CONTAINER_IMAGE="docker.io/cachyos/cachyos-v4:latest"

# --- Script Start ---
set -e # Exit immediately if a command exits with a non-zero status.

echo "Starting Archlinux Environment Setup..."

# 1. Check if distrobox is installed
if ! command -v distrobox &> /dev/null; then
    echo "Error: distrobox could not be found."
    echo "Please install distrobox on your host system before running this script."
    exit 1
fi

echo "Distrobox is installed."

# 2. Check if the container already exists
if distrobox list | grep -q " ${CONTAINER_NAME} "; then
    echo "ℹContainer '${CONTAINER_NAME}' already exists. Skipping creation."
else
    echo "Creating the '${CONTAINER_NAME}' container using image: ${CONTAINER_IMAGE}..."
    echo "This may take a few minutes depending on your internet connection."
    # We add --init to enable systemd inside the container, which is good practice.
    # We also add --nvidia for automatic NVIDIA GPU integration. If you have an AMD or Intel GPU,
    # this flag will be safely ignored.
    distrobox create --name "${CONTAINER_NAME}" --image "${CONTAINER_IMAGE}" --init --nvidia --dbus --hostname "${HOSTNAME}"
    echo "Container created successfully."
fi

# 3. Install dev tools and export applications
echo "Entering container to install tools and export applications..."

# We execute a series of commands inside the container.
# - Update the  database and install packages without asking for confirmation.
# - Export the desktop entries for the applications to the host.
distrobox enter "${CONTAINER_NAME}" -- <<EOF
echo "Installing packages..."
sudo pacman -Sy --noconfirm archlinux-keyring
sudo pacman -Syyu --noconfirm --needed base-devel git yay
yay -Syu --noconfirm npm zsh bash spyder github-cli typescript eslint helm python-pip gdb libdisplay-info lib32-libdisplay-info gcc make libappindicator lib32-libappindicator libappindicator-gtk3 lib32-libappindicator-gtk3 libdbusmenu-gtk3 lib32-libdbusmenu-gtk3bottles maven jdk-openjdk kotlin clang llvm lld lldb libc++ cython libclc polly rustup antigravity gemini-cli google-chrome cachyos-gaming-applications cachyos-gaming-meta lsfg-vk-bin
rustup update
rustup default stable
rustup target add wasm32-unknown-unknown
cargo install cargo-binstall
cargo binstall krabby
sudo ln -s /usr/bin/distrobox-host-exec /usr/local/bin/podman
sudo ln -s /usr/bin/distrobox-host-exec /usr/local/bin/kubectl
echo "Exporting applications to host..."
distrobox-export --app antigravity
distrobox-export --app steam
distrobox-export --app lsfg-vk-ui
distrobox-export --app goverlay
distrobox-export --app heroic
distrobox-export --app bottles

EOF

echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.zshrc
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc
echo "Applications installed and exported."
echo ""
echo "Setup complete!"
