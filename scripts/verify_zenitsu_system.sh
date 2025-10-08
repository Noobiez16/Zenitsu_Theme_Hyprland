#!/bin/bash

# --- Zenitsu Theme System Verification Script ---

# Color Codes
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print status with color coding
print_status() {
    case "$2" in
        "OK") echo -e "${GREEN}✓${NC} $1" ;;
        "FAIL") echo -e "${RED}✗${NC} $1" ;;
        "WARN") echo -e "${YELLOW}⚠${NC} $1" ;;
        "INFO") echo -e "${BLUE}ℹ${NC} $1" ;;
    esac
}

# --- Check Functions ---

check_environment() {
    print_status "Checking Desktop Environment..." "INFO"
    if [[ "$XDG_CURRENT_DESKTOP" == *"Hyprland"* ]]; then
        print_status "Hyprland session confirmed." "OK"
    else
        print_status "Not running in Hyprland. Current DE: $XDG_CURRENT_DESKTOP" "FAIL"
    fi
}

check_packages() {
    print_status "Checking required packages..." "INFO"
    local packages=("waybar" "swaync" "ttf-firacode-nerd" "nwg-look")
    for pkg in "${packages[@]}"; do
        if pacman -Q "$pkg" &>/dev/null; then
            print_status "$pkg is installed." "OK"
        else
            print_status "$pkg is NOT installed. Please run 'sudo pacman -S $pkg'." "FAIL"
        fi
    done

    # Check for Tela Yellow icon theme - simplified and robust
    if pacman -Q tela-circle-icon-theme-yellow &>/dev/null; then
        print_status "Tela Yellow Icon Theme is installed." "OK"
    elif test -d /usr/share/icons/Tela-circle-yellow-dark; then
        print_status "Tela Yellow Icon Theme found in system icons." "OK"
    elif test -d ~/.local/share/icons/Tela-circle-yellow-dark; then
        print_status "Tela Yellow Icon Theme found in user icons." "OK"
    else
        print_status "Tela Yellow Icon Theme not found. Install with: sudo pacman -S tela-circle-icon-theme-yellow" "FAIL"
    fi
}

check_processes() {
    print_status "Checking running services..." "INFO"
    if pgrep -x "waybar" > /dev/null; then
        print_status "Waybar process is active." "OK"
    else
        print_status "Waybar process is NOT running. Check Hyprland startup config." "FAIL"
    fi
    if pgrep -x "swaync" > /dev/null; then
        print_status "Swaync process is active." "OK"
    else
        print_status "Swaync process is NOT running. Check Hyprland startup config." "FAIL"
    fi
}

check_configs() {
    print_status "Verifying key configuration settings..." "INFO"

    # Hyprland: GTK Icon Theme Persistence
    if grep -q "gsettings set org.gnome.desktop.interface icon-theme 'Tela-circle-yellow-dark'" ~/.config/hypr/hyprland.conf ~/.config/hypr/UserConfigs/*.conf 2>/dev/null; then
        print_status "Hyprland enforces 'Tela-circle-yellow-dark' icon theme on startup." "OK"
    else
        print_status "Hyprland config is missing the gsettings command for yellow icon theme persistence." "WARN"
    fi

    # Waybar: Font & Transparency
    if grep -q 'font-family: "FiraCode Nerd Font"' ~/.config/waybar/style.css 2>/dev/null || grep -q 'font-family: "FiraCode Nerd Font"' ~/.config/waybar/style/*css 2>/dev/null; then
        print_status "Waybar CSS correctly references 'FiraCode Nerd Font'." "OK"
    else
        print_status "Waybar CSS font-family rule for Nerd Fonts is missing." "FAIL"
    fi
    if grep -q "background: alpha" ~/.config/waybar/style.css 2>/dev/null || grep -q "background: alpha" ~/.config/waybar/style/*css 2>/dev/null; then
        print_status "Waybar CSS is configured for transparency." "OK"
    else
        print_status "Waybar CSS is not configured for transparency." "WARN"
    fi

    # Swaync: Positioning & Transparency
    if grep -q '"control-center-margin-bottom": 45' ~/.config/swaync/config.json 2>/dev/null; then
        print_status "Swaync margin is correctly set for floating Waybar." "OK"
    else
        print_status "Swaync 'control-center-margin-bottom' is incorrect. Notifications may be misaligned." "FAIL"
    fi
    if grep -q "background.*alpha" ~/.config/swaync/style.css 2>/dev/null; then
        print_status "Swaync CSS is configured for transparency." "OK"
    else
        print_status "Swaync CSS is not configured for transparency." "WARN"
    fi

    # System: Active GTK Icon Theme
    local current_icon_theme
    current_icon_theme=$(gsettings get org.gnome.desktop.interface icon-theme 2>/dev/null)
    if [[ "$current_icon_theme" == *"Tela-circle-yellow-dark"* ]]; then
        print_status "System GTK Icon Theme is correctly set to 'Tela-circle-yellow-dark'." "OK"
    elif [[ "$current_icon_theme" == *"Tela"* ]]; then
        print_status "System GTK Icon Theme is $current_icon_theme. Expected 'Tela-circle-yellow-dark'. Run: gsettings set org.gnome.desktop.interface icon-theme 'Tela-circle-yellow-dark'" "WARN"
    else
        print_status "System GTK Icon Theme is $current_icon_theme. Install yellow theme with: sudo pacman -S tela-circle-icon-theme-yellow" "FAIL"
    fi
}

# --- Main Execution ---
echo ""
echo "⚡⚡⚡ Zenitsu Theme System Verification ⚡⚡⚡"
echo ""
check_environment
echo ""
check_packages
echo ""
check_processes
echo ""
check_configs
echo ""
echo "--- Verification Complete ---"
echo ""
