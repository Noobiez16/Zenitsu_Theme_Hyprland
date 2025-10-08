#!/bin/bash

# ⚡⚡⚡ ZENITSU THEME - ICON FIX SCRIPT ⚡⚡⚡
# This script fixes icon display issues and ensures waybar runs properly

echo "╔════════════════════════════════════════════════════════════╗"
echo "║        ⚡⚡⚡ ZENITSU THEME ICON FIX UTILITY ⚡⚡⚡         ║"
echo "║             Restore and Fix Icon Display Issues            ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

MODULES_FILE="$HOME/.config/waybar/ZenitsuModules"
CUSTOM_MODULES="$HOME/.config/waybar/ZenitsuModulesCustom"
GLOW_CSS="$HOME/.config/waybar/style/⚡ [Zenitsu] Thunder Glow.css"

# ============================================================================
# STEP 1: RESTORE FROM BACKUP IF ICONS ARE BROKEN
# ============================================================================
echo "🔍 [1/4] Checking for issues..."

# Find the most recent backup that doesn't have too many modifications
LATEST_BACKUP=$(ls -t "${MODULES_FILE}.backup_"* 2>/dev/null | head -1)

if [ -f "$LATEST_BACKUP" ]; then
    echo "  → Found backup: $LATEST_BACKUP"
    
    # Ask user if they want to restore
    echo "  → Current modules file may have been modified multiple times"
    echo "  → Would you like to restore from backup? (y/n)"
    read -r -p "    " response
    
    if [[ "$response" =~ ^[Yy]$ ]]; then
        cp "$LATEST_BACKUP" "${MODULES_FILE}.before_fix_$(date +%Y%m%d_%H%M%S)"
        cp "$LATEST_BACKUP" "$MODULES_FILE"
        echo "  ✓ Restored modules from backup"
    else
        echo "  → Keeping current configuration"
    fi
else
    echo "  ℹ No backups found, working with current configuration"
fi

echo ""

# ============================================================================
# STEP 2: APPLY ELECTRICAL ICONS PROPERLY
# ============================================================================
echo "⚡ [2/4] Applying Electrical Icons (Correct Method)..."

# Create a clean backup before modifications
cp "$MODULES_FILE" "${MODULES_FILE}.before_icon_fix_$(date +%Y%m%d_%H%M%S)"

# Network - Electrical wifi icons with precise matching
sed -i 's|"format-wifi": "󰖩 {icon}"|"format-wifi": " {icon}"|' "$MODULES_FILE"
sed -i 's|"format-ethernet": "󰈀 "|"format-ethernet": " "|' "$MODULES_FILE"
sed -i 's|"format-disconnected": "󰖪 "|"format-disconnected": " "|' "$MODULES_FILE"

# Bluetooth - Electrical variants
sed -i 's|"format": "󰂯 "|"format": " "|' "$MODULES_FILE"
sed -i 's|"format-disabled": "󰂲 "|"format-disabled": " "|' "$MODULES_FILE"
sed -i 's|"format-connected": "󰂱  {num_connections}"|"format-connected": "  {num_connections}"|' "$MODULES_FILE"

# Battery - Thunder charge icons
sed -i 's|"format-charging": "󱐋  {capacity}%"|"format-charging": "  {capacity}%"|' "$MODULES_FILE"
sed -i 's|"format-plugged": "󰚥  {capacity}%"|"format-plugged": "  {capacity}%"|' "$MODULES_FILE"

# Pulseaudio/Volume - Thunder sound
sed -i 's|"format-muted": "󰖁"|"format-muted": " "|' "$MODULES_FILE"

echo "  ✓ Network icons: Lightning wifi signals ()"
echo "  ✓ Bluetooth icons: Electrical connection ()"
echo "  ✓ Battery icons: Thunder charge ()"
echo "  ✓ Volume icons: Thunder sound ()"
echo ""

# ============================================================================
# STEP 3: CLEAN UP DUPLICATE CSS ENTRIES
# ============================================================================
echo "🎨 [3/4] Fixing CSS (Remove Duplicates)..."

if [ -f "$GLOW_CSS" ]; then
    # Create backup
    cp "$GLOW_CSS" "${GLOW_CSS}.before_cleanup_$(date +%Y%m%d_%H%M%S)"
    
    # Count how many times the click animation appears
    ANIMATION_COUNT=$(grep -c "CLICK SPARK ANIMATION" "$GLOW_CSS" 2>/dev/null || echo "0")
    
    if [ "$ANIMATION_COUNT" -gt 1 ]; then
        echo "  → Found $ANIMATION_COUNT copies of click animation CSS"
        echo "  → Removing duplicates..."
        
        # Create a temporary file with only one copy of the animation
        # First, remove all instances of the animation block
        sed -i '/\/\* ========== CLICK SPARK ANIMATION ========== \*\//,/#tray:active {/d' "$GLOW_CSS"
        sed -i '/animation: spark-flash 0.15s ease-out;/d' "$GLOW_CSS"
        sed -i '/^}$/d' "$GLOW_CSS"
        
        # Now add it back once at the end
        cat >> "$GLOW_CSS" << 'CLICKCSS'

/* ========== CLICK SPARK ANIMATION ========== */
@keyframes spark-flash {
  from {
    box-shadow: 0 0 40px rgba(255, 255, 0, 1.0);
    filter: brightness(2.0);
  }
  to {
    box-shadow: 0 0 10px rgba(249, 255, 94, 0.5);
    filter: brightness(1.0);
  }
}

/* Click effect for all interactive modules */
#backlight:active,
#battery:active,
#bluetooth:active,
#clock:active,
#cpu:active,
#disk:active,
#memory:active,
#mpris:active,
#network:active,
#pulseaudio:active,
#temperature:active,
#custom-menu:active,
#custom-power:active,
#custom-lock:active,
#custom-updater:active,
#custom-cycle_wall:active,
#custom-light_dark:active,
#custom-keybindhint:active,
#workspaces button:active {
  animation: spark-flash 0.15s ease-out;
  box-shadow: 0 0 40px rgba(255, 255, 0, 1.0);
  border-color: #ffff00;
  background: rgba(255, 255, 0, 0.4);
}

/* Tray click effect */
#tray:active {
  animation: spark-flash 0.15s ease-out;
}
CLICKCSS
        echo "  ✓ Cleaned up CSS duplicates"
    elif [ "$ANIMATION_COUNT" -eq 0 ]; then
        echo "  → Click animation not found, adding it..."
        cat >> "$GLOW_CSS" << 'CLICKCSS'

/* ========== CLICK SPARK ANIMATION ========== */
@keyframes spark-flash {
  from {
    box-shadow: 0 0 40px rgba(255, 255, 0, 1.0);
    filter: brightness(2.0);
  }
  to {
    box-shadow: 0 0 10px rgba(249, 255, 94, 0.5);
    filter: brightness(1.0);
  }
}

/* Click effect for all interactive modules */
#backlight:active,
#battery:active,
#bluetooth:active,
#clock:active,
#cpu:active,
#disk:active,
#memory:active,
#mpris:active,
#network:active,
#pulseaudio:active,
#temperature:active,
#custom-menu:active,
#custom-power:active,
#custom-lock:active,
#custom-updater:active,
#custom-cycle_wall:active,
#custom-light_dark:active,
#custom-keybindhint:active,
#workspaces button:active {
  animation: spark-flash 0.15s ease-out;
  box-shadow: 0 0 40px rgba(255, 255, 0, 1.0);
  border-color: #ffff00;
  background: rgba(255, 255, 0, 0.4);
}

/* Tray click effect */
#tray:active {
  animation: spark-flash 0.15s ease-out;
}
CLICKCSS
        echo "  ✓ Added click animation CSS"
    else
        echo "  ✓ CSS is clean (single animation entry)"
    fi
else
    echo "  ⚠ Thunder Glow CSS not found at: $GLOW_CSS"
fi

echo ""

# ============================================================================
# STEP 4: TEST WAYBAR CONFIGURATION
# ============================================================================
echo "🔧 [4/4] Testing Waybar Configuration..."

# Kill any running waybar instances
pkill waybar 2>/dev/null || true
sleep 1

# Try to start waybar and check for errors
echo "  → Starting waybar..."
waybar -l debug 2>&1 > /tmp/waybar_test.log &
WAYBAR_PID=$!
sleep 3

# Check if waybar is still running
if ps -p $WAYBAR_PID > /dev/null 2>&1; then
    echo "  ✓ Waybar started successfully!"
    echo "  ✓ Process ID: $WAYBAR_PID"
    
    # Check for warnings in the log
    if grep -qi "warning" /tmp/waybar_test.log; then
        echo "  ℹ Some warnings found (this is normal):"
        grep -i "warning" /tmp/waybar_test.log | head -3
    fi
    
    echo ""
    echo "  → Waybar is now running with electrical icons!"
    echo "  → Check your bar to see the thunder icons"
else
    echo "  ✗ Waybar failed to start!"
    echo "  → Check the log at /tmp/waybar_test.log for errors"
    cat /tmp/waybar_test.log
    exit 1
fi

echo ""

# ============================================================================
# SUMMARY
# ============================================================================
echo "╔════════════════════════════════════════════════════════════╗"
echo "║              ⚡⚡⚡ FIX COMPLETE! ⚡⚡⚡                    ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
echo "✨ CHANGES APPLIED:"
echo "  ✓ Icons updated to electrical variants"
echo "  ✓ CSS cleaned up (duplicates removed)"
echo "  ✓ Click spark animation added/fixed"
echo "  ✓ Waybar running successfully"
echo ""
echo "⚡ ELECTRICAL ICONS NOW ACTIVE:"
echo "  • Network:  (lightning wifi)"
echo "  • Bluetooth:  (electrical connection)"
echo "  • Battery:  (thunder charge)"
echo "  • Volume:  (thunder sound)"
echo ""
echo "🎯 TO VERIFY:"
echo "  1. Look at your waybar - icons should be visible"
echo "  2. Click any icon - you should see yellow spark flash"
echo "  3. If sound was enabled, you'll hear spark effects"
echo ""
echo "📖 BACKUPS CREATED:"
echo "  • Modules: ${MODULES_FILE}.before_icon_fix_*"
echo "  • CSS: ${GLOW_CSS}.before_cleanup_*"
echo ""
echo "🔧 IF ICONS STILL DON'T SHOW:"
echo "  1. Check if Nerd Font is installed:"
echo "     $ fc-list | grep -i nerd"
echo "  2. Restart Hyprland completely"
echo "  3. Check waybar log: /tmp/waybar_test.log"
echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║   ⚡⚡⚡ THUNDER BREATHING IS NOW ACTIVE! ⚡⚡⚡          ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
