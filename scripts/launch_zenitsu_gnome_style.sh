#!/bin/bash

# ⚡⚡⚡ ZENITSU GLOW - GNOME STYLE LAUNCHER ⚡⚡⚡
# Compact horizontal bar with electric glow

echo "╔════════════════════════════════════════════════════════════╗"
echo "║     ⚡⚡⚡ ZENITSU GLOW - GNOME STYLE COMPACT ⚡⚡⚡      ║"
echo "║        Clock Left • Tray/System Right • Electric!         ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# Kill any running waybar instances
pkill waybar 2>/dev/null
sleep 1

# Ensure correct symlinks
cd ~/.config/waybar
ln -sf "style/⚡ [Zenitsu] Thunder Glow.css" style.css
ln -sf "configs/⚡ [BOT] Zenitsu-Peony" config

echo "✓ Configuration: GNOME Style (top bar)"
echo "✓ Style: Thunder Glow (intense electric effects)"
echo ""
echo "→ Starting waybar..."

# Start waybar
waybar &
sleep 2

if ps aux | grep -v grep | grep waybar > /dev/null; then
    echo ""
    echo "╔════════════════════════════════════════════════════════════╗"
    echo "║          ⚡⚡⚡ WAYBAR GNOME STYLE ACTIVE! ⚡⚡⚡         ║"
    echo "╚════════════════════════════════════════════════════════════╝"
    echo ""
    echo "✨ Layout (GNOME Style):"
    echo "  • Top bar (not bottom)"
    echo "  • Clock on the LEFT"
    echo "  • System indicators on the RIGHT"
    echo "  • Compact and narrow"
    echo ""
    echo "⚡ Electric Effects:"
    echo "  • Intense glow around bar (maintained)"
    echo "  • Pulsing borders (maintained)"
    echo "  • Hover lightning (maintained)"
    echo "  • Click spark flash (NOW VISIBLE!)"
    echo ""
    echo "🖱️  Test Click Spark:"
    echo "  Click any module to see the yellow flash!"
    echo ""
    echo "📏 Dimensions:"
    echo "  • Height: 36px"
    echo "  • Width: Dynamic (fits content)"
    echo "  • Padding: Minimal"
    echo "  • Spacing: 3px between modules"
    echo ""
else
    echo "✗ Waybar failed to start!"
    echo ""
    echo "🔧 Check errors:"
    echo "  $ waybar -l debug"
fi

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
