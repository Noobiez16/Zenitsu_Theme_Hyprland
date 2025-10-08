#!/bin/bash
# ⚡ Zenitsu Theme - FiraCode Nerd Font Installation Script
# This script installs the FiraCode Nerd Font for proper icon rendering in Waybar

echo "⚡ Installing FiraCode Nerd Font..."
echo "This will require sudo privileges."
echo ""

sudo pacman -S ttf-firacode-nerd --noconfirm

if [ $? -eq 0 ]; then
    echo ""
    echo "✓ FiraCode Nerd Font installed successfully!"
    echo "⚡ Refreshing font cache..."
    fc-cache -fv
    echo ""
    echo "✓ Font installation complete!"
    echo "Please restart Waybar for changes to take effect:"
    echo "  killall waybar && waybar &"
else
    echo ""
    echo "✗ Font installation failed. Please check the error messages above."
    exit 1
fi
