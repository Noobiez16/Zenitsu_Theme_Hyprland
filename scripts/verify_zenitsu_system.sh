#!/bin/bash

# Zenitsu Theme System Verification Script
# Checks all components of the Zenitsu Thunder Glow theme

echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║         ⚡ ZENITSU THEME SYSTEM VERIFICATION ⚡                 ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo ""

# Color codes
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check function
check_item() {
    if [ "$1" -eq 0 ]; then
        echo -e "${GREEN}✓${NC} $2"
    else
        echo -e "${RED}✗${NC} $2"
    fi
}

echo "=== WAYBAR CONFIGURATION ==="
echo ""

# Check Waybar is running
pgrep -x waybar > /dev/null
check_item $? "Waybar process running"

# Check config symlink
if [ -L ~/.config/waybar/config ]; then
    TARGET=$(readlink -f ~/.config/waybar/config)
    echo -e "${GREEN}✓${NC} Config symlink: $TARGET"
    if [[ "$TARGET" == *"Zenitsu-Peony"* ]]; then
        echo -e "${GREEN}  → Using Zenitsu-Peony layout${NC}"
    fi
else
    echo -e "${RED}✗${NC} Config symlink not found"
fi

# Check style symlink
if [ -L ~/.config/waybar/style.css ]; then
    TARGET=$(readlink -f ~/.config/waybar/style.css)
    echo -e "${GREEN}✓${NC} Style symlink: $TARGET"
    if [[ "$TARGET" == *"Thunder Glow"* ]]; then
        echo -e "${GREEN}  → Using Thunder Glow style${NC}"
    fi
else
    echo -e "${RED}✗${NC} Style symlink not found"
fi

echo ""
echo "=== THEME FILES ==="
echo ""

# Check Thunder Glow CSS exists
[ -f "$HOME/Hyprland-Dots/config/waybar/style/⚡ [Zenitsu] Thunder Glow.css" ]
check_item $? "Thunder Glow CSS file exists"

# Check Zenitsu-Peony config exists  
[ -f "$HOME/.config/waybar/configs/⚡ [BOT] Zenitsu-Peony" ]
check_item $? "Zenitsu-Peony config exists"

# Check ZenitsuModules exists
[ -f "$HOME/Hyprland-Dots/config/waybar/ZenitsuModules" ]
check_item $? "ZenitsuModules file exists"

# Check ModulesWorkspaces exists
[ -f "$HOME/Hyprland-Dots/config/waybar/ModulesWorkspaces" ]
check_item $? "ModulesWorkspaces file exists"

echo ""
echo "=== HYPRLAND CONFIGURATION ==="
echo ""

# Check Hyprland is running
pgrep -x Hyprland > /dev/null
check_item $? "Hyprland process running"

# Check UserAnimations.conf
[ -f "$HOME/Hyprland-Dots/config/hypr/UserConfigs/UserAnimations.conf" ]
check_item $? "UserAnimations.conf exists"

# Check for borderangle animation
if grep -q "borderangle" "$HOME/Hyprland-Dots/config/hypr/UserConfigs/UserAnimations.conf" 2>/dev/null; then
    echo -e "${GREEN}✓${NC} Border angle animation configured"
else
    echo -e "${YELLOW}⚠${NC} Border angle animation not found"
fi

# Check UserDecorations.conf
[ -f "$HOME/Hyprland-Dots/config/hypr/UserConfigs/UserDecorations.conf" ]
check_item $? "UserDecorations.conf exists"

# Check for electric border colors
if grep -q "F7DC6F" "$HOME/Hyprland-Dots/config/hypr/UserConfigs/UserDecorations.conf" 2>/dev/null; then
    echo -e "${GREEN}✓${NC} Electric border colors configured"
else
    echo -e "${YELLOW}⚠${NC} Electric border colors not found"
fi

echo ""
echo "=== FONT SUPPORT ==="
echo ""

# Check for Nerd Fonts
fc-list | grep -i "nerd" > /dev/null
check_item $? "Nerd Fonts installed"

# Check specific fonts
fc-list | grep -i "firacode.*nerd" > /dev/null
check_item $? "FiraCode Nerd Font available"

fc-list | grep -i "jetbrains.*nerd" > /dev/null
check_item $? "JetBrainsMono Nerd Font available"

echo ""
echo "=== ANIMATION FEATURES ==="
echo ""

# Check for electric-border-pulse animation in CSS
if grep -q "electric-border-pulse" "$HOME/Hyprland-Dots/config/waybar/style/⚡ [Zenitsu] Thunder Glow.css" 2>/dev/null; then
    echo -e "${GREEN}✓${NC} Waybar border pulse animation configured"
else
    echo -e "${YELLOW}⚠${NC} Waybar border pulse animation not found"
fi

# Check for lightning-flash animation
if grep -q "lightning-flash" "$HOME/Hyprland-Dots/config/waybar/style/⚡ [Zenitsu] Thunder Glow.css" 2>/dev/null; then
    echo -e "${GREEN}✓${NC} Lightning flash animation configured"
else
    echo -e "${YELLOW}⚠${NC} Lightning flash animation not found"
fi

echo ""
echo "=== WORKSPACE ICONS ==="
echo ""

# Check workspace icon configuration
if grep -q '""' "$HOME/Hyprland-Dots/config/waybar/ModulesWorkspaces" 2>/dev/null; then
    echo -e "${GREEN}✓${NC} Lightning bolt workspace icons configured"
else
    echo -e "${YELLOW}⚠${NC} Lightning bolt workspace icons not found"
fi

echo ""
echo "=== MODULE ICONS ==="
echo ""

# Check battery icons
if grep -q "󰂎\|󰁺\|󰁻" "$HOME/Hyprland-Dots/config/waybar/ZenitsuModules" 2>/dev/null; then
    echo -e "${GREEN}✓${NC} Battery icons configured"
else
    echo -e "${YELLOW}⚠${NC} Battery icons not found"
fi

# Check network icons
if grep -q " \| " "$HOME/Hyprland-Dots/config/waybar/ZenitsuModules" 2>/dev/null; then
    echo -e "${GREEN}✓${NC} Network icons configured"
else
    echo -e "${YELLOW}⚠${NC} Network icons not found"
fi

# Check pulseaudio icons
if grep -q " \| " "$HOME/Hyprland-Dots/config/waybar/ZenitsuModules" 2>/dev/null; then
    echo -e "${GREEN}✓${NC} Audio icons configured"
else
    echo -e "${YELLOW}⚠${NC} Audio icons not found"
fi

echo ""
echo "=== SYSTEM STATUS ==="
echo ""

# Waybar status
if pgrep -x waybar > /dev/null; then
    WB_PID=$(pgrep -x waybar)
    echo -e "${GREEN}✓${NC} Waybar running (PID: $WB_PID)"
else
    echo -e "${RED}✗${NC} Waybar not running"
    echo -e "  ${YELLOW}→ Run: pkill waybar && waybar &${NC}"
fi

# Hyprland status
if pgrep -x Hyprland > /dev/null; then
    echo -e "${GREEN}✓${NC} Hyprland running"
else
    echo -e "${RED}✗${NC} Hyprland not running"
fi

echo ""
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                    VERIFICATION COMPLETE                         ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo ""
echo "If Waybar is not displaying correctly, try:"
echo "  1. pkill waybar && waybar &"
echo "  2. Check ~/.config/waybar/ symlinks"
echo "  3. Review Waybar logs: waybar 2>&1 | grep -i error"
echo ""
