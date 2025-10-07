#!/bin/bash
# ⚡ Zenitsu Icon Theme Installation Script ⚡
# Installs and configures Tela Orange icons for the Zenitsu theme

echo "⚡⚡⚡ ZENITSU ICON THEME INSTALLER ⚡⚡⚡"
echo "Installing Tela-circle-icon-theme-orange..."
echo ""

# Step 1: Install the icon theme from Arch repos
echo "Step 1: Installing icon theme from repository..."
sudo pacman -S --needed tela-circle-icon-theme-orange

if [ $? -ne 0 ]; then
    echo "❌ Installation failed!"
    exit 1
fi

echo "✓ Icon theme installed successfully!"
echo ""

# Step 2: Verify installation
echo "Step 2: Verifying installation..."
if [ -d "/usr/share/icons/Tela-circle-orange" ] || [ -d "/usr/share/icons/Tela-circle-orange-dark" ]; then
    echo "✓ Icon theme found in /usr/share/icons/"
    ls -d /usr/share/icons/Tela-circle-orange* 2>/dev/null
else
    echo "⚠ Warning: Icon theme directory not found in expected location"
fi

echo ""

# Step 3: Update icon cache
echo "Step 3: Updating icon cache..."
sudo gtk-update-icon-cache -f /usr/share/icons/Tela-circle-orange-dark 2>/dev/null
sudo gtk-update-icon-cache -f /usr/share/icons/Tela-circle-orange 2>/dev/null
echo "✓ Icon cache updated"

echo ""
echo "⚡ Installation complete!"
echo ""
echo "Next steps:"
echo "1. Run: ./configure_zenitsu_icons.sh"
echo "2. Or manually set icons using the configuration script"
echo ""
