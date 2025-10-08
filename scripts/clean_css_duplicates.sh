#!/bin/bash

# ⚡⚡⚡ ZENITSU THEME - CSS CLEANUP UTILITY ⚡⚡⚡
# This script removes duplicate CSS entries from Thunder Glow CSS

echo "🎨 Zenitsu Theme - CSS Cleanup Utility"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

GLOW_CSS="$HOME/.config/waybar/style/⚡ [Zenitsu] Thunder Glow.css"

if [ ! -f "$GLOW_CSS" ]; then
    echo "✗ Error: Thunder Glow CSS not found at:"
    echo "  $GLOW_CSS"
    exit 1
fi

# Create backup
BACKUP_FILE="${GLOW_CSS}.backup_$(date +%Y%m%d_%H%M%S)"
cp "$GLOW_CSS" "$BACKUP_FILE"
echo "✓ Created backup: $BACKUP_FILE"
echo ""

# Count duplicates
ANIMATION_COUNT=$(grep -c "CLICK SPARK ANIMATION" "$GLOW_CSS" 2>/dev/null || echo "0")
echo "Found $ANIMATION_COUNT instance(s) of CLICK SPARK ANIMATION"

if [ "$ANIMATION_COUNT" -gt 1 ]; then
    echo "→ Removing duplicates..."
    
    # Create a clean version
    # Remove all lines from first occurrence to last occurrence of the animation block
    awk '
        /\/\* ========== CLICK SPARK ANIMATION ========== \*\// {
            if (!found) {
                found = 1
                skip = 1
                next
            } else {
                skip = 1
                next
            }
        }
        skip && /#tray:active {/ {
            # Skip this line and the next closing brace
            getline
            skip = 0
            next
        }
        skip { next }
        { print }
    ' "$GLOW_CSS" > "${GLOW_CSS}.tmp"
    
    # Move the temp file back
    mv "${GLOW_CSS}.tmp" "$GLOW_CSS"
    
    # Add the animation CSS once at the end
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
    
    echo "✓ Duplicates removed and clean CSS applied"
    
elif [ "$ANIMATION_COUNT" -eq 0 ]; then
    echo "→ No animation found, adding it..."
    
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
    
    echo "✓ Animation CSS added"
else
    echo "✓ CSS is already clean (exactly one animation entry)"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✓ CSS cleanup complete!"
echo ""
echo "To apply changes, reload waybar:"
echo "  pkill waybar && waybar &"
echo ""
