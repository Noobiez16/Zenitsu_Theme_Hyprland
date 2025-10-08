#!/bin/bash

# ⚡⚡⚡ Zenitsu Theme - Yellow Icon Installation Script ⚡⚡⚡

# Color Codes
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${YELLOW}⚡⚡⚡ Installing Tela Yellow Icon Theme ⚡⚡⚡${NC}"
echo ""

# Check if already installed
if pacman -Q tela-circle-icon-theme-yellow &>/dev/null; then
    echo -e "${GREEN}✓${NC} Tela Yellow Icon Theme is already installed!"
else
    echo -e "${BLUE}ℹ${NC} Installing Tela Yellow Icon Theme..."
    sudo pacman -S --needed tela-circle-icon-theme-yellow
    
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓${NC} Installation successful!"
    else
        echo -e "${YELLOW}⚠${NC} Installation failed or was cancelled."
        exit 1
    fi
fi

echo ""
echo -e "${BLUE}ℹ${NC} Applying icon theme..."
gsettings set org.gnome.desktop.interface icon-theme 'Tela-circle-yellow-dark'

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓${NC} Icon theme applied successfully!"
    echo ""
    echo -e "${YELLOW}⚡${NC} The yellow icon theme is now active and will persist on restart."
    echo -e "${BLUE}ℹ${NC} Run the verification script to confirm: ~/Project_Zenitsu_Theme/Scripts/verify_zenitsu_system.sh"
else
    echo -e "${YELLOW}⚠${NC} Could not apply icon theme via gsettings."
fi

echo ""
