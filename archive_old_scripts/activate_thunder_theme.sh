#!/bin/bash

# ⚡ Quick Thunder Breathing Theme Activator ⚡
# This script automatically activates both the Zenitsu layout and style

echo "⚡ Activating Thunder Breathing Theme..."

# Set the Zenitsu layout
ln -sf "$HOME/.config/waybar/configs/⚡ [BOT] Zenitsu-Peony" "$HOME/.config/waybar/config"
echo "  ✓ Layout activated: ⚡ [BOT] Zenitsu-Peony"

# Set the Thunder Breathing style
ln -sf "$HOME/.config/waybar/style/⚡ [Zenitsu] Thunder Breathing.css" "$HOME/.config/waybar/style.css"
echo "  ✓ Style activated: ⚡ [Zenitsu] Thunder Breathing"

# Reload Waybar
echo "  ⚡ Reloading Waybar..."
pkill waybar
sleep 0.5
waybar &>/dev/null &
disown

echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║     ⚡ THUNDER BREATHING THEME ACTIVATED! ⚡               ║"
echo "║   First Form - Thunderclap and Flash!                     ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
echo "Your Waybar now channels the power of Thunder Breathing!"
echo ""
