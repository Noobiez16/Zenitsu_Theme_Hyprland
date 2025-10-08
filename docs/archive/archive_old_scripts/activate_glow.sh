#!/bin/bash

# ⚡ Quick Thunder Glow Activator ⚡

echo "⚡ Activating Thunder Breathing Glow Animation..."

# Set the Thunder Glow style
ln -sf "$HOME/.config/waybar/style/⚡ [Zenitsu] Thunder Glow.css" "$HOME/.config/waybar/style.css"
echo "  ✓ Glow style activated"

# Reload Waybar
echo "  ⚡ Reloading Waybar..."
pkill waybar
sleep 0.5
waybar &>/dev/null &
disown

echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║     ⚡ THUNDER GLOW ANIMATION ACTIVATED! ⚡                ║"
echo "║   Your Waybar now pulses with electric energy!            ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
