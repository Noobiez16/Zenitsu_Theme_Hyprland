#!/bin/bash
# ⚡ Zenitsu Icon Theme Configuration Script ⚡
# Applies Tela Orange icons across all GTK applications

echo "⚡⚡⚡ ZENITSU ICON THEME CONFIGURATOR ⚡⚡⚡"
echo "Applying Tela-circle-orange-dark icon theme..."
echo ""

# Icon theme name
ICON_THEME="Tela-circle-orange-dark"
ICON_THEME_LIGHT="Tela-circle-orange"

# Backup existing configurations
echo "Step 1: Creating backups..."
if [ -f ~/.config/gtk-3.0/settings.ini ]; then
    cp ~/.config/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini.backup_$(date +%Y%m%d_%H%M%S)
    echo "✓ GTK-3 settings backed up"
fi

if [ -f ~/.gtkrc-2.0 ]; then
    cp ~/.gtkrc-2.0 ~/.gtkrc-2.0.backup_$(date +%Y%m%d_%H%M%S)
    echo "✓ GTK-2 settings backed up"
fi

echo ""

# Step 2: Configure GTK-3.0
echo "Step 2: Configuring GTK-3.0..."
mkdir -p ~/.config/gtk-3.0

cat > ~/.config/gtk-3.0/settings.ini << EOF
[Settings]
gtk-theme-name=Breeze-Dark
gtk-icon-theme-name=$ICON_THEME
gtk-font-name=JetBrainsMono Nerd Font 11
gtk-cursor-theme-name=breeze_cursors
gtk-cursor-theme-size=24
gtk-toolbar-style=GTK_TOOLBAR_BOTH_HORIZ
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-button-images=0
gtk-menu-images=0
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=0
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle=hintslight
gtk-xft-rgba=rgb
EOF

echo "✓ GTK-3.0 configured with $ICON_THEME"

# Step 3: Configure GTK-4.0
echo "Step 3: Configuring GTK-4.0..."
mkdir -p ~/.config/gtk-4.0

cat > ~/.config/gtk-4.0/settings.ini << EOF
[Settings]
gtk-theme-name=Breeze-Dark
gtk-icon-theme-name=$ICON_THEME
gtk-font-name=JetBrainsMono Nerd Font 11
gtk-cursor-theme-name=breeze_cursors
gtk-cursor-theme-size=24
EOF

echo "✓ GTK-4.0 configured with $ICON_THEME"

# Step 4: Configure GTK-2.0
echo "Step 4: Configuring GTK-2.0..."
cat > ~/.gtkrc-2.0 << EOF
gtk-theme-name="Breeze-Dark"
gtk-icon-theme-name="$ICON_THEME"
gtk-font-name="JetBrainsMono Nerd Font 11"
gtk-cursor-theme-name="breeze_cursors"
gtk-cursor-theme-size=24
EOF

echo "✓ GTK-2.0 configured with $ICON_THEME"

# Step 5: Apply with gsettings (for running applications)
echo ""
echo "Step 5: Applying settings with gsettings..."
gsettings set org.gnome.desktop.interface icon-theme "$ICON_THEME"
gsettings set org.gnome.desktop.interface gtk-theme "Breeze-Dark"
gsettings set org.gnome.desktop.interface cursor-theme "breeze_cursors"
gsettings set org.gnome.desktop.interface font-name "JetBrainsMono Nerd Font 11"

echo "✓ gsettings applied"

# Step 6: Configure Qt applications (optional, for consistency)
echo ""
echo "Step 6: Configuring Qt applications..."
mkdir -p ~/.config/qt5ct ~/.config/qt6ct

# Set Qt to use GTK theme
cat > ~/.config/qt5ct/qt5ct.conf << EOF
[Appearance]
icon_theme=$ICON_THEME
style=Breeze
EOF

echo "✓ Qt5 configured"

# Step 7: Add to Hyprland startup (if not already present)
echo ""
echo "Step 7: Checking Hyprland startup configuration..."
STARTUP_FILE="$HOME/.config/hypr/UserConfigs/Startup_Apps.conf"

if [ -f "$STARTUP_FILE" ]; then
    # Check if gsettings line already exists
    if ! grep -q "gsettings set org.gnome.desktop.interface icon-theme" "$STARTUP_FILE"; then
        # Backup the file
        cp "$STARTUP_FILE" "${STARTUP_FILE}.backup_$(date +%Y%m%d_%H%M%S)"
        
        # Add gsettings commands
        echo "" >> "$STARTUP_FILE"
        echo "# ⚡ Zenitsu Icon Theme - Apply on startup" >> "$STARTUP_FILE"
        echo "exec-once = gsettings set org.gnome.desktop.interface icon-theme '$ICON_THEME'" >> "$STARTUP_FILE"
        echo "exec-once = gsettings set org.gnome.desktop.interface gtk-theme 'Breeze-Dark'" >> "$STARTUP_FILE"
        echo "exec-once = gsettings set org.gnome.desktop.interface cursor-theme 'breeze_cursors'" >> "$STARTUP_FILE"
        
        echo "✓ Added to Hyprland startup configuration"
    else
        echo "✓ Hyprland startup already configured"
    fi
else
    echo "⚠ Hyprland startup config not found at $STARTUP_FILE"
    echo "  You may need to add gsettings commands manually"
fi

echo ""
echo "═══════════════════════════════════════════════════════════"
echo "✅ ZENITSU ICON THEME CONFIGURATION COMPLETE!"
echo "═══════════════════════════════════════════════════════════"
echo ""
echo "Applied icon theme: $ICON_THEME"
echo ""
echo "Changes made:"
echo "  ✓ GTK-2.0 settings (~/.gtkrc-2.0)"
echo "  ✓ GTK-3.0 settings (~/.config/gtk-3.0/settings.ini)"
echo "  ✓ GTK-4.0 settings (~/.config/gtk-4.0/settings.ini)"
echo "  ✓ gsettings (system-wide)"
echo "  ✓ Qt5 configuration"
echo "  ✓ Hyprland startup commands"
echo ""
echo "To see changes:"
echo "  1. Restart GTK applications"
echo "  2. Or logout and login again"
echo "  3. Or restart Hyprland"
echo ""
echo "⚡ Thunder icons are now active! ⚡"
echo ""
