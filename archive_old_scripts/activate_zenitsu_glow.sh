#!/bin/bash

# ⚡⚡⚡ ZENITSU THEME - ACTIVATE THUNDER GLOW ⚡⚡⚡
# Activates the Zenitsu Glow style (compact & electrifying)

echo "╔════════════════════════════════════════════════════════════╗"
echo "║      ⚡⚡⚡ ACTIVATING ZENITSU THUNDER GLOW ⚡⚡⚡         ║"
echo "║          Compact & Maximum Electrical Effects!             ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# Ensure symlink points to Thunder Glow CSS
cd ~/.config/waybar
ln -sf "style/⚡ [Zenitsu] Thunder Glow.css" style.css

# Verify the symlink
CURRENT_STYLE=$(readlink style.css)
echo "✓ Waybar style set to: $CURRENT_STYLE"
echo ""

# Kill existing waybar
echo "→ Restarting waybar..."
pkill waybar 2>/dev/null
sleep 1

# Start waybar
waybar &
sleep 2

# Check if waybar is running
if ps aux | grep -v grep | grep waybar > /dev/null; then
    echo "✓ Waybar started successfully!"
    echo ""
    echo "╔════════════════════════════════════════════════════════════╗"
    echo "║           ⚡⚡⚡ THUNDER GLOW ACTIVE! ⚡⚡⚡              ║"
    echo "╚════════════════════════════════════════════════════════════╝"
    echo ""
    echo "✨ Features Activated:"
    echo "  • MEGA intense electrical glow around waybar"
    echo "  • Pulsing thunder borders"
    echo "  • Lightning crackle on hover"
    echo "  • Thunder strike on active workspace"
    echo "  • Spark flash on click"
    echo "  • Compact spacing (less wasted space)"
    echo "  • All modules electrified"
    echo ""
    echo "🎯 What to Notice:"
    echo "  • Waybar glows with yellow-orange electrical aura"
    echo "  • Borders pulse between orange and yellow"
    echo "  • Hover modules to see intense lightning"
    echo "  • Click modules for instant spark flash"
    echo "  • Active workspace glows intensely"
    echo ""
else
    echo "✗ Waybar failed to start!"
    echo ""
    echo "🔧 Troubleshooting:"
    echo "  1. Check for errors:"
    echo "     $ waybar -l debug"
    echo ""
    echo "  2. Verify Nerd Fonts installed:"
    echo "     $ fc-list | grep -i nerd"
    echo ""
    echo "  3. Check CSS file exists:"
    echo "     $ ls -la ~/.config/waybar/style/"
    echo ""
fi

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
