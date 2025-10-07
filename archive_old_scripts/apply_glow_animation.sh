#!/bin/bash

# ⚡ Zenitsu Theme - Thunder Breathing Glow Animation ⚡
# This script creates an enhanced Waybar style with an electrifying pulsing glow effect

set -e  # Exit on error

echo "╔════════════════════════════════════════════════════════════╗"
echo "║     ⚡ THUNDER BREATHING GLOW ANIMATION INSTALLER ⚡       ║"
echo "║        Constant Electric Pulse - Zenitsu Style!           ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# ============================================================================
# STEP 1: LOCATE AND DUPLICATE THUNDER BREATHING STYLE
# ============================================================================
echo "🎨 [1/3] Locating Thunder Breathing Waybar Style..."

WAYBAR_STYLES="$HOME/.config/waybar/style"
THUNDER_STYLE="$WAYBAR_STYLES/⚡ [Zenitsu] Thunder Breathing.css"
GLOW_STYLE="$WAYBAR_STYLES/⚡ [Zenitsu] Thunder Glow.css"

if [ ! -f "$THUNDER_STYLE" ]; then
    echo "❌ ERROR: Thunder Breathing style not found at: $THUNDER_STYLE"
    echo "   Please run apply_waybar_theme.sh first."
    exit 1
fi

echo "  ✓ Found Thunder Breathing style"
echo "  → Creating Thunder Glow variant with pulsing animation"

# Create a copy of the Thunder Breathing style
cp "$THUNDER_STYLE" "$GLOW_STYLE"

echo "  ✓ Style duplicated successfully"
echo ""

# ============================================================================
# STEP 2: IMPLEMENT THUNDER BREATHING PULSING GLOW ANIMATION
# ============================================================================
echo "⚡ [2/3] Infusing Electrifying Glow Animation..."

# First, let's add the keyframes animation at the end of the file
echo "" >> "$GLOW_STYLE"
echo "/* ========== THUNDER BREATHING GLOW ANIMATION ========== */" >> "$GLOW_STYLE"
echo "/* Electrifying pulsing glow effect - Zenitsu's Thunder Power! */" >> "$GLOW_STYLE"
echo "" >> "$GLOW_STYLE"

cat >> "$GLOW_STYLE" << 'GLOWEOF'
@keyframes zenitsu-glow {
  0% {
    box-shadow: 0 0 8px 2px rgba(249, 255, 94, 0.7),
                0 0 20px 4px rgba(255, 162, 55, 0.4),
                inset 0 0 12px 2px rgba(249, 255, 94, 0.1);
  }
  50% {
    box-shadow: 0 0 16px 6px rgba(249, 255, 94, 1.0),
                0 0 30px 8px rgba(255, 162, 55, 0.6),
                inset 0 0 18px 4px rgba(249, 255, 94, 0.2);
  }
  100% {
    box-shadow: 0 0 8px 2px rgba(249, 255, 94, 0.7),
                0 0 20px 4px rgba(255, 162, 55, 0.4),
                inset 0 0 12px 2px rgba(249, 255, 94, 0.1);
  }
}

@keyframes zenitsu-border-glow {
  0% {
    border-top-color: #FFA237;
    border-bottom-color: #FFE66D;
  }
  50% {
    border-top-color: #f9ff5e;
    border-bottom-color: #FFA237;
  }
  100% {
    border-top-color: #FFA237;
    border-bottom-color: #FFE66D;
  }
}

/* Apply the glow animation to the main Waybar window */
window#waybar {
  animation: zenitsu-glow 2s ease-in-out infinite,
             zenitsu-border-glow 2s ease-in-out infinite;
}

/* Enhanced workspace glow on active */
#workspaces button.active {
  animation: workspace-thunder 1.5s ease-in-out infinite;
}

@keyframes workspace-thunder {
  0% {
    box-shadow: 0 0 15px rgba(255, 230, 109, 0.6);
  }
  50% {
    box-shadow: 0 0 25px rgba(249, 255, 94, 1.0),
                0 0 35px rgba(255, 162, 55, 0.5);
  }
  100% {
    box-shadow: 0 0 15px rgba(255, 230, 109, 0.6);
  }
}

/* Battery charging gets extra thunder glow */
#battery.charging {
  animation: battery-thunder-charge 1.8s ease-in-out infinite;
}

@keyframes battery-thunder-charge {
  0% {
    box-shadow: 0 0 10px rgba(255, 230, 109, 0.5);
  }
  50% {
    box-shadow: 0 0 20px rgba(249, 255, 94, 1.0),
                0 0 30px rgba(255, 162, 55, 0.6);
  }
  100% {
    box-shadow: 0 0 10px rgba(255, 230, 109, 0.5);
  }
}

/* Clock gets subtle electric pulse */
#clock {
  animation: clock-electric-pulse 3s ease-in-out infinite;
}

@keyframes clock-electric-pulse {
  0%, 100% {
    box-shadow: 0 0 10px rgba(255, 162, 55, 0.4);
  }
  50% {
    box-shadow: 0 0 18px rgba(249, 255, 94, 0.7),
                0 0 25px rgba(255, 162, 55, 0.5);
  }
}

/* Power button gets attention-grabbing pulse */
#custom-power {
  animation: power-warning-pulse 2.5s ease-in-out infinite;
}

@keyframes power-warning-pulse {
  0%, 100% {
    box-shadow: 0 0 8px rgba(231, 76, 60, 0.5);
  }
  50% {
    box-shadow: 0 0 20px rgba(255, 230, 109, 0.8),
                0 0 30px rgba(231, 76, 60, 0.7);
  }
}
GLOWEOF

echo "  ✓ Thunder Breathing glow animation created"
echo "  ✓ Animation features:"
echo "    • Main panel: Constant electric pulse (2s cycle)"
echo "    • Active workspace: Thunder glow effect"
echo "    • Battery charging: Intense thunder charge animation"
echo "    • Clock: Subtle electric pulse (3s cycle)"
echo "    • Power button: Attention-grabbing pulse"
echo "    • Border colors: Animated color transitions"
echo ""

# ============================================================================
# STEP 3: CREATE QUICK ACTIVATION SCRIPT
# ============================================================================
echo "🔧 [3/3] Creating Quick Activation Script..."

ACTIVATE_SCRIPT="$HOME/Project_Zenitsu_Theme/activate_glow.sh"

cat > "$ACTIVATE_SCRIPT" << 'ACTIVATEOF'
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
ACTIVATEOF

chmod +x "$ACTIVATE_SCRIPT"

echo "  ✓ Quick activation script created at:"
echo "    $ACTIVATE_SCRIPT"
echo ""

# ============================================================================
# FINAL SUMMARY
# ============================================================================
echo "╔════════════════════════════════════════════════════════════╗"
echo "║        ⚡ THUNDER GLOW ANIMATION INSTALLED! ⚡             ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
echo "✨ WHAT WAS CREATED:"
echo "  ✓ New Waybar Style: '⚡ [Zenitsu] Thunder Glow'"
echo "  ✓ Constant pulsing glow animation (2s cycle)"
echo "  ✓ Enhanced workspace thunder effects"
echo "  ✓ Battery charging animations"
echo "  ✓ Clock electric pulse"
echo "  ✓ Power button warning pulse"
echo "  ✓ Quick activation script"
echo ""
echo "⚡ ANIMATION FEATURES:"
echo "  • Main Panel: Vibrant yellow glow pulses constantly"
echo "  • Borders: Animated color transitions (orange ↔ yellow)"
echo "  • Active Elements: Enhanced thunder glow effects"
echo "  • Smooth Animations: Perfectly timed with Thunder Breathing"
echo "  • Zenitsu Colors: Uses #f9ff5e (vibrant yellow) + Haori Orange"
echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║              🎯 ACTIVATION INSTRUCTIONS 🎯                 ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
echo "QUICK METHOD (RECOMMENDED):"
echo "  $ ~/Project_Zenitsu_Theme/activate_glow.sh"
echo ""
echo "MANUAL METHOD:"
echo "  Step 1: Press  SUPER + CTRL + B"
echo "  Step 2: Select '⚡ [Zenitsu] Thunder Glow'"
echo "  Step 3: Press Enter"
echo ""
echo "TO RELOAD WAYBAR ANYTIME:"
echo "  Press: SUPER + ALT + R"
echo "  Or run: pkill waybar && waybar &"
echo ""
echo "TO SWITCH BACK TO NON-ANIMATED STYLE:"
echo "  Press: SUPER + CTRL + B"
echo "  Select: '⚡ [Zenitsu] Thunder Breathing'"
echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║   ⚡ Thunder Breathing: Constant Form - Electric Pulse! ⚡ ║"
echo "║        Your Waybar now channels pure lightning!           ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
echo "💡 TIP: The glow animation is subtle yet constant, creating an"
echo "   electrifying presence that matches Zenitsu's lightning speed!"
echo ""
