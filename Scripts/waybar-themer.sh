#!/bin/bash

# --- Waybar Theme Switcher ---
# ⚡ Zenitsu Theme - Dynamic Theme Manager ⚡

THEME_DIR="$HOME/.config/waybar/themes"
WAYBAR_CONFIG_DIR="$HOME/.config/waybar"

# Check if theme directory exists
if [ ! -d "$THEME_DIR" ]; then
    notify-send "Theme Error" "Theme directory not found: $THEME_DIR"
    exit 1
fi

# Get list of themes by listing directories
themes=($(find "$THEME_DIR" -mindepth 1 -maxdepth 1 -type d -printf "%f\n"))

# Check if any themes exist
if [ ${#themes[@]} -eq 0 ]; then
    notify-send "Theme Error" "No themes found in $THEME_DIR"
    exit 1
fi

# Present themes in rofi
selected_theme=$(printf "%s\n" "${themes[@]}" | rofi -dmenu -p "Select Waybar Theme")

# Exit if no theme is selected
if [ -z "$selected_theme" ]; then
    exit 0
fi

# Define paths for selected theme
THEME_CONFIG="$THEME_DIR/$selected_theme/config.jsonc"
THEME_STYLE="$THEME_DIR/$selected_theme/style.css"

# Check if theme files exist
if [ ! -f "$THEME_CONFIG" ] || [ ! -f "$THEME_STYLE" ]; then
    notify-send "Theme Error" "Selected theme '$selected_theme' is missing required files."
    exit 1
fi

# Remove old symlinks
rm -f "$WAYBAR_CONFIG_DIR/config.jsonc"
rm -f "$WAYBAR_CONFIG_DIR/style.css"

# Create new symlinks
ln -s "$THEME_CONFIG" "$WAYBAR_CONFIG_DIR/config.jsonc"
ln -s "$THEME_STYLE" "$WAYBAR_CONFIG_DIR/style.css"

# Reload Waybar to apply changes
pkill -SIGUSR2 waybar

# If SIGUSR2 doesn't work, try full restart
sleep 0.5
if ! pgrep -x "waybar" > /dev/null; then
    waybar &>/dev/null & disown
fi

notify-send "⚡ Waybar Theme Switcher" "Theme set to: $selected_theme" -i preferences-desktop-theme

exit 0
