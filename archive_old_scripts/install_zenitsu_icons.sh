#!/bin/bash
# ⚡ Zenitsu Theme - Icon Theme Installation Script
# Installs Tela-yellow-dark icon theme for system-wide Zenitsu aesthetic

set -e

echo "⚡⚡⚡ ZENITSU ICON THEME INSTALLER ⚡⚡⚡"
echo ""
echo "This script will:"
echo "  1. Install nwg-look (if needed)"
echo "  2. Clone and install Tela-icon-theme (yellow variant)"
echo "  3. Configure Hyprland for persistence"
echo ""
read -p "Continue? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Installation cancelled."
    exit 0
fi

# Step 1: Install nwg-look
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Step 1: Installing Dependencies"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

if ! command -v nwg-look &> /dev/null; then
    echo "Installing nwg-look..."
    sudo pacman -S nwg-look --noconfirm
    echo "✓ nwg-look installed"
else
    echo "✓ nwg-look already installed"
fi

# Step 2: Install Tela Icon Theme
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Step 2: Installing Tela Icon Theme (Yellow Variant)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

cd /tmp

# Remove old clone if exists
if [ -d "Tela-icon-theme" ]; then
    echo "Removing old Tela-icon-theme directory..."
    rm -rf Tela-icon-theme
fi

echo "Cloning Tela-icon-theme repository..."
git clone https://github.com/vinceliuice/Tela-icon-theme.git

echo "Installing yellow variant for local user..."
cd Tela-icon-theme
./install.sh -c yellow

echo "✓ Tela-yellow-dark icons installed to ~/.local/share/icons/"

# Step 3: Configure Hyprland for persistence
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Step 3: Configuring Hyprland for Icon Theme Persistence"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

HYPR_CONF="$HOME/.config/hypr/hyprland.conf"

if [ -f "$HYPR_CONF" ]; then
    # Check if icon theme line already exists
    if grep -q "gsettings set org.gnome.desktop.interface icon-theme" "$HYPR_CONF"; then
        echo "Icon theme setting already exists in hyprland.conf"
    else
        echo "Adding icon theme to hyprland.conf..."
        
        # Add to exec-once section
        echo "" >> "$HYPR_CONF"
        echo "# ⚡ Zenitsu Theme - Icon Theme Persistence" >> "$HYPR_CONF"
        echo "exec-once = gsettings set org.gnome.desktop.interface icon-theme 'Tela-yellow-dark'" >> "$HYPR_CONF"
        
        echo "✓ Added icon theme persistence to hyprland.conf"
    fi
else
    echo "⚠ Warning: hyprland.conf not found at $HYPR_CONF"
    echo "You'll need to manually add this line to your Hyprland config:"
    echo "exec-once = gsettings set org.gnome.desktop.interface icon-theme 'Tela-yellow-dark'"
fi

# Step 4: Apply theme immediately using gsettings
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Step 4: Applying Icon Theme"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "Applying Tela-yellow-dark icon theme via gsettings..."
gsettings set org.gnome.desktop.interface icon-theme 'Tela-yellow-dark'
echo "✓ Icon theme applied via gsettings"

# Cleanup
echo ""
echo "Cleaning up temporary files..."
cd /tmp
rm -rf Tela-icon-theme
echo "✓ Cleanup complete"

# Final instructions
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "⚡ INSTALLATION COMPLETE! ⚡"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Icon theme: Tela-yellow-dark"
echo "Location: ~/.local/share/icons/Tela-yellow-dark"
echo ""
echo "NEXT STEPS:"
echo ""
echo "1. Run 'nwg-look' to verify the theme is applied:"
echo "   - Open nwg-look from terminal: nwg-look"
echo "   - Go to 'Icons' tab"
echo "   - Verify 'Tela-yellow-dark' is selected"
echo "   - Click 'Apply' if needed"
echo ""
echo "2. The theme will persist across reboots via hyprland.conf"
echo ""
echo "3. Restart GTK applications to see the new icons"
echo ""
echo "⚡ Thunder Breathing: Icon Form - System-Wide Lightning! ⚡"
echo ""
