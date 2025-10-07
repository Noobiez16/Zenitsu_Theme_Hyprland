#!/bin/bash

# ⚡⚡⚡ ZENITSU THEME - ELECTRICAL ICONS APPLICATOR ⚡⚡⚡
# This script applies electrical-themed icons to waybar modules

echo "╔════════════════════════════════════════════════════════════╗"
echo "║      ⚡⚡⚡ ELECTRICAL ICONS APPLICATOR ⚡⚡⚡             ║"
echo "║         Transform Your Waybar with Thunder Icons!          ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

MODULES_FILE="$HOME/.config/waybar/ZenitsuModules"
CUSTOM_MODULES="$HOME/.config/waybar/ZenitsuModulesCustom"

if [ ! -f "$MODULES_FILE" ]; then
    echo "✗ Error: ZenitsuModules file not found at: $MODULES_FILE"
    exit 1
fi

# Create backup
BACKUP_FILE="${MODULES_FILE}.backup_$(date +%Y%m%d_%H%M%S)"
cp "$MODULES_FILE" "$BACKUP_FILE"
echo "✓ Created backup: $(basename $BACKUP_FILE)"
echo ""

echo "⚡ Applying Electrical Icons..."
echo ""

# ============================================================================
# NETWORK - Lightning WiFi Icons
# ============================================================================
echo "→ Network Module:"

# WiFi format
if grep -q '"format-wifi": "󰖩 {icon}"' "$MODULES_FILE"; then
    sed -i 's/"format-wifi": "󰖩 {icon}"/"format-wifi": " {icon}"/' "$MODULES_FILE"
    echo "  ✓ WiFi: 󰖩 → "
else
    echo "  ℹ WiFi format already modified or not found"
fi

# Ethernet format
if grep -q '"format-ethernet": "󰈀 "' "$MODULES_FILE"; then
    sed -i 's/"format-ethernet": "󰈀 "/"format-ethernet": " "/' "$MODULES_FILE"
    echo "  ✓ Ethernet: 󰈀 → "
else
    echo "  ℹ Ethernet format already modified or not found"
fi

# Disconnected format
if grep -q '"format-disconnected": "󰖪 "' "$MODULES_FILE"; then
    sed -i 's/"format-disconnected": "󰖪 "/"format-disconnected": " "/' "$MODULES_FILE"
    echo "  ✓ Disconnected: 󰖪 → "
else
    echo "  ℹ Disconnected format already modified or not found"
fi

# ============================================================================
# BLUETOOTH - Electrical Connection Icons
# ============================================================================
echo ""
echo "→ Bluetooth Module:"

if grep -q '"bluetooth":' "$MODULES_FILE"; then
    # Bluetooth normal format
    if grep -q '"format": "󰂯 "' "$MODULES_FILE"; then
        sed -i 's/"format": "󰂯 "/"format": " "/' "$MODULES_FILE"
        echo "  ✓ Bluetooth: 󰂯 → "
    else
        echo "  ℹ Bluetooth format already modified or not found"
    fi
    
    # Bluetooth disabled
    if grep -q '"format-disabled": "󰂲 "' "$MODULES_FILE"; then
        sed -i 's/"format-disabled": "󰂲 "/"format-disabled": " "/' "$MODULES_FILE"
        echo "  ✓ Bluetooth disabled: 󰂲 → "
    else
        echo "  ℹ Bluetooth disabled already modified or not found"
    fi
    
    # Bluetooth connected
    if grep -q '"format-connected": "󰂱  {num_connections}"' "$MODULES_FILE"; then
        sed -i 's/"format-connected": "󰂱  {num_connections}"/"format-connected": "  {num_connections}"/' "$MODULES_FILE"
        echo "  ✓ Bluetooth connected: 󰂱 → "
    else
        echo "  ℹ Bluetooth connected already modified or not found"
    fi
else
    echo "  ℹ Bluetooth module not found"
fi

# ============================================================================
# BATTERY - Thunder Charge Icons
# ============================================================================
echo ""
echo "→ Battery Module:"

if grep -q '"battery":' "$MODULES_FILE"; then
    # Battery charging
    if grep -q '"format-charging": "󱐋  {capacity}%"' "$MODULES_FILE"; then
        sed -i 's/"format-charging": "󱐋  {capacity}%"/"format-charging": "  {capacity}%"/' "$MODULES_FILE"
        echo "  ✓ Charging: 󱐋 → "
    else
        echo "  ℹ Charging format already modified or not found"
    fi
    
    # Battery plugged
    if grep -q '"format-plugged": "󰚥  {capacity}%"' "$MODULES_FILE"; then
        sed -i 's/"format-plugged": "󰚥  {capacity}%"/"format-plugged": "  {capacity}%"/' "$MODULES_FILE"
        echo "  ✓ Plugged: 󰚥 → "
    else
        echo "  ℹ Plugged format already modified or not found"
    fi
else
    echo "  ℹ Battery module not found (might be desktop)"
fi

# ============================================================================
# PULSEAUDIO - Thunder Sound Icon
# ============================================================================
echo ""
echo "→ Volume/Pulseaudio Module:"

if grep -q '"pulseaudio":' "$MODULES_FILE"; then
    # Muted format
    if grep -q '"format-muted": "󰖁"' "$MODULES_FILE"; then
        sed -i 's/"format-muted": "󰖁"/"format-muted": " "/' "$MODULES_FILE"
        echo "  ✓ Muted: 󰖁 → "
    else
        echo "  ℹ Muted format already modified or not found"
    fi
else
    echo "  ℹ Pulseaudio module not found"
fi

# ============================================================================
# CUSTOM MODULES (if they exist)
# ============================================================================
if [ -f "$CUSTOM_MODULES" ]; then
    echo ""
    echo "→ Custom Modules:"
    
    CUSTOM_BACKUP="${CUSTOM_MODULES}.backup_$(date +%Y%m%d_%H%M%S)"
    cp "$CUSTOM_MODULES" "$CUSTOM_BACKUP"
    
    # Menu icon
    if grep -q '"format": " "' "$CUSTOM_MODULES"; then
        sed -i 's/"format": " "/"format": "  "/' "$CUSTOM_MODULES"
        echo "  ✓ Menu: Enhanced with lightning"
    fi
    
    # Power icon  
    if grep -q '"format": "  ⏻ "' "$CUSTOM_MODULES"; then
        sed -i 's/"format": "  ⏻ "/"format": "   ⏻ "/' "$CUSTOM_MODULES"
        echo "  ✓ Power: Enhanced with lightning"
    fi
    
    echo "  ✓ Custom modules backup created"
fi

# ============================================================================
# SUMMARY
# ============================================================================
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "✨ ELECTRICAL ICONS APPLIED!"
echo ""
echo "⚡ New Icons:"
echo "  • WiFi:         (lightning signal)"
echo "  • Ethernet:     (lightning connector)"
echo "  • Disconnected:  (no connection)"
echo "  • Bluetooth:    (electrical bluetooth)"
echo "  • Battery:      (thunder charging)"
echo "  • Volume:       (thunder sound muted)"
echo ""
echo "🔧 To See Changes:"
echo "  Option 1: Reload Waybar"
echo "    $ pkill waybar && waybar &"
echo ""
echo "  Option 2: Use Hyprland Keybind"
echo "    SUPER + ALT + R (if configured)"
echo ""
echo "📖 Backup Location:"
echo "  $BACKUP_FILE"
echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║      ⚡⚡⚡ THUNDER BREATHING ICONS READY! ⚡⚡⚡          ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
