#!/bin/bash
# ============================================================================
# Zenitsu Agatsuma (Demon Slayer) - Complete Hyprland Theme Application
# ============================================================================
# This script applies a comprehensive Zenitsu-themed customization to your
# Hyprland environment, including color scheme, wallpaper, and terminal logo.
#
# Author: GitHub Copilot CLI
# Version: 1.0
# ============================================================================

set -e  # Exit on error

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# ============================================================================
# Configuration Variables
# ============================================================================

THEME_DIR="$HOME/Pictures/zenitsu_theme"
WALLUST_CONFIG="$HOME/.config/wallust/wallust.toml"
FASTFETCH_SOURCE="$HOME/Hyprland-Dots/config/fastfetch/config.jsonc"
FASTFETCH_CONFIG="$HOME/.config/fastfetch/config.jsonc"

# Zenitsu Color Palette (HEX)
ZENITSU_COLORS=(
    "#1A1A1A"  # color0  - Black (background)
    "#FF6F00"  # color1  - Deep Orange (red)
    "#FFD700"  # color2  - Gold (green) 
    "#FFEB3B"  # color3  - Bright Yellow (yellow)
    "#FF9800"  # color4  - Orange (blue)
    "#FFA726"  # color5  - Light Orange (magenta)
    "#FFC107"  # color6  - Amber (cyan)
    "#FFF9C4"  # color7  - Light Yellow (white)
    "#424242"  # color8  - Dark Gray (bright black)
    "#FF8A50"  # color9  - Bright Orange
    "#FFED4E"  # color10 - Bright Gold
    "#FFFF72"  # color11 - Very Bright Yellow
    "#FFB74D"  # color12 - Bright Orange
    "#FFCC80"  # color13 - Peach Orange
    "#FFD54F"  # color14 - Golden Yellow
    "#FFFFFF"  # color15 - Pure White
)

# ============================================================================
# Helper Functions
# ============================================================================

print_banner() {
    echo -e "${YELLOW}"
    echo "╔════════════════════════════════════════════════════════════════╗"
    echo "║                                                                ║"
    echo "║           ⚡ ZENITSU AGATSUMA THEME INSTALLER ⚡              ║"
    echo "║                  Demon Slayer: Kimetsu no Yaiba                ║"
    echo "║                                                                ║"
    echo "╚════════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

print_step() {
    echo -e "${CYAN}[STEP]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

print_info() {
    echo -e "${BLUE}[i]${NC} $1"
}

# ============================================================================
# Phase 1: Pre-flight Checks
# ============================================================================

check_dependencies() {
    print_step "Checking required dependencies..."
    
    local missing_deps=()
    
    if ! command -v swww &> /dev/null; then
        missing_deps+=("swww")
    fi
    
    if ! command -v wallust &> /dev/null; then
        missing_deps+=("wallust")
    fi
    
    if [ ${#missing_deps[@]} -ne 0 ]; then
        print_error "Missing dependencies: ${missing_deps[*]}"
        print_info "Please install them using: yay -S ${missing_deps[*]}"
        exit 1
    fi
    
    print_success "All dependencies are installed"
}

# ============================================================================
# Phase 2: Directory Setup
# ============================================================================

setup_directories() {
    print_step "Setting up theme directory structure..."
    
    if [ ! -d "$THEME_DIR" ]; then
        mkdir -p "$THEME_DIR"
        print_success "Created theme directory: $THEME_DIR"
    else
        print_info "Theme directory already exists"
    fi
    
    # Create subdirectories for organization
    mkdir -p "$THEME_DIR/wallpapers"
    mkdir -p "$THEME_DIR/logos"
    mkdir -p "$THEME_DIR/assets"
    
    print_success "Directory structure ready"
}

# ============================================================================
# Phase 3: Asset Verification
# ============================================================================

check_assets() {
    print_step "Checking for required assets..."
    
    local assets_missing=false
    
    # Check for wallpaper
    if [ -z "$(ls -A $THEME_DIR/wallpapers/*.{jpg,jpeg,png,webp} 2>/dev/null)" ]; then
        print_warning "No wallpaper found in $THEME_DIR/wallpapers/"
        assets_missing=true
    fi
    
    # Check for custom logo
    if [ ! -f "$THEME_DIR/logos/zenitsu_arch_logo.png" ]; then
        print_warning "Custom logo not found at $THEME_DIR/logos/zenitsu_arch_logo.png"
        assets_missing=true
    fi
    
    if [ "$assets_missing" = true ]; then
        echo ""
        print_error "Required assets are missing!"
        echo ""
        print_info "Please complete the following steps:"
        echo ""
        echo -e "${WHITE}1. Download Zenitsu Wallpaper:${NC}"
        echo "   - Visit: wallhaven.cc or wallpaperaccess.com"
        echo "   - Search: 'Zenitsu Agatsuma demon slayer'"
        echo "   - Download high-resolution wallpaper (1920x1080 or higher)"
        echo "   - Save to: $THEME_DIR/wallpapers/"
        echo ""
        echo -e "${WHITE}2. Download Zenitsu PNG (transparent):${NC}"
        echo "   - Search: 'Zenitsu chibi PNG transparent'"
        echo "   - Download from: pngwing.com or deviantart.com"
        echo "   - Save to: $THEME_DIR/assets/"
        echo ""
        echo -e "${WHITE}3. Download Arch Linux Logo:${NC}"
        echo "   - Visit: archlinux.org or wikimedia commons"
        echo "   - Download transparent PNG or SVG"
        echo "   - Save to: $THEME_DIR/assets/"
        echo ""
        echo -e "${WHITE}4. Create Custom Logo:${NC}"
        echo "   - Open an image editor (GIMP, Photoshop, Photopea, etc.)"
        echo "   - Create new image: 512x512 pixels, transparent background"
        echo "   - Place Arch Linux logo on left side"
        echo "   - Place Zenitsu PNG on right side"
        echo "   - Save as: $THEME_DIR/logos/zenitsu_arch_logo.png"
        echo ""
        echo -e "${YELLOW}After completing these steps, run this script again.${NC}"
        echo ""
        exit 1
    fi
    
    print_success "All required assets are present"
}

# ============================================================================
# Phase 4: Wallust Color Configuration
# ============================================================================

configure_wallust() {
    print_step "Configuring wallust with Zenitsu color palette..."
    
    # Backup existing configuration
    if [ -f "$WALLUST_CONFIG" ]; then
        cp "$WALLUST_CONFIG" "${WALLUST_CONFIG}.backup.$(date +%Y%m%d_%H%M%S)"
        print_info "Backed up existing wallust configuration"
    fi
    
    # Create custom wallust configuration with Zenitsu colors
    cat > "$WALLUST_CONFIG" << 'EOF'
# ============================================================================
# Zenitsu Agatsuma Theme - Wallust Configuration
# ============================================================================

backend = "full"
color_space = "lch"
palette = "dark"

# Custom color palette - Zenitsu Agatsuma
# These colors override the automatic palette generation
[custom_colors]
color0 = "#1A1A1A"   # Black (background)
color1 = "#FF6F00"   # Deep Orange
color2 = "#FFD700"   # Gold
color3 = "#FFEB3B"   # Bright Yellow
color4 = "#FF9800"   # Orange
color5 = "#FFA726"   # Light Orange
color6 = "#FFC107"   # Amber
color7 = "#FFF9C4"   # Light Yellow
color8 = "#424242"   # Dark Gray
color9 = "#FF8A50"   # Bright Orange
color10 = "#FFED4E"  # Bright Gold
color11 = "#FFFF72"  # Very Bright Yellow
color12 = "#FFB74D"  # Bright Orange
color13 = "#FFCC80"  # Peach Orange
color14 = "#FFD54F"  # Golden Yellow
color15 = "#FFFFFF"  # Pure White

[templates]
# Link templates to apply colors system-wide
# These will be filled in based on your existing setup
EOF
    
    print_success "Wallust configured with Zenitsu color palette"
}

# ============================================================================
# Phase 5: Wallpaper Application
# ============================================================================

apply_wallpaper() {
    print_step "Setting Zenitsu wallpaper..."
    
    # Find the wallpaper file
    local wallpaper=$(ls -1 "$THEME_DIR/wallpapers/"*.{jpg,jpeg,png,webp} 2>/dev/null | head -1)
    
    if [ -z "$wallpaper" ]; then
        print_error "No wallpaper found"
        return 1
    fi
    
    print_info "Using wallpaper: $(basename "$wallpaper")"
    
    # Check if swww daemon is running
    if ! pgrep -x swww-daemon > /dev/null; then
        print_info "Starting swww daemon..."
        swww-daemon &
        sleep 2
    fi
    
    # Apply wallpaper with fade transition
    swww img "$wallpaper" --transition-type fade --transition-duration 2
    
    print_success "Wallpaper applied successfully"
    
    # Generate colors using wallust (even though we have custom colors, this creates the template files)
    print_info "Generating color schemes..."
    wallust run "$wallpaper"
    
    print_success "Color schemes generated"
}

# ============================================================================
# Phase 6: Fastfetch Logo Configuration
# ============================================================================

configure_fastfetch() {
    print_step "Configuring fastfetch with custom Zenitsu logo..."
    
    # Check if fastfetch is installed
    if ! command -v fastfetch &> /dev/null; then
        print_warning "fastfetch is not installed. Installing..."
        yay -S --noconfirm fastfetch
    fi
    
    # Create fastfetch config directory if it doesn't exist
    mkdir -p "$(dirname "$FASTFETCH_CONFIG")"
    
    # Copy base configuration from Hyprland-Dots if it exists
    if [ -f "$FASTFETCH_SOURCE" ] && [ ! -f "$FASTFETCH_CONFIG" ]; then
        cp "$FASTFETCH_SOURCE" "$FASTFETCH_CONFIG"
        print_info "Copied base fastfetch configuration"
    elif [ ! -f "$FASTFETCH_CONFIG" ]; then
        # Create a basic configuration if none exists
        cat > "$FASTFETCH_CONFIG" << 'EOF'
{
"$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
"logo": {
"type": "kitty-direct",
"source": "$HOME/Pictures/zenitsu_theme/logos/zenitsu_arch_logo.png",
"width": 30,
"height": 15,
"padding": {
"top": 1,
"left": 2
}
},
"display": {
"separator": " 󰑃  "
},
"modules": [
"break",
{"type": "os", "key": " DISTRO", "keyColor": "yellow"},
{"type": "kernel", "key": "│ ├", "keyColor": "yellow"},
{"type": "packages", "key": "│ ├󰏖", "keyColor": "yellow"},
{"type": "shell", "key": "│ └", "keyColor": "yellow"},
{"type": "wm", "key": " DE/WM", "keyColor": "yellow"},
{"type": "terminal", "key": "│ └", "keyColor": "yellow"},
{"type": "cpu", "key": "󰻠 CPU", "keyColor": "yellow"},
{"type": "memory", "key": "󰾆 RAM", "keyColor": "yellow"},
{"type": "uptime", "key": "󰅐 UPTIME", "keyColor": "yellow"},
"break"
]
}
EOF
        print_info "Created basic fastfetch configuration"
    fi
    
    # Backup existing configuration
    if [ -f "$FASTFETCH_CONFIG" ]; then
        cp "$FASTFETCH_CONFIG" "${FASTFETCH_CONFIG}.backup.$(date +%Y%m%d_%H%M%S)"
    fi
    
    # Modify the logo configuration using sed (more robust for JSONC with unicode)
    local logo_path="$THEME_DIR/logos/zenitsu_arch_logo.png"
    
    # Check if logo section exists
    if grep -q '"logo"' "$FASTFETCH_CONFIG"; then
        # Logo section exists, modify it
        # First, check if it already has type/source/width/height or just padding
        if grep -A5 '"logo"' "$FASTFETCH_CONFIG" | grep -q '"type"'; then
            # Already has logo config, update the source
            sed -i "s|\"source\":.*|\"source\": \"$logo_path\",|g" "$FASTFETCH_CONFIG"
        else
            # Only has padding, add the full logo config
            # Replace the logo section with complete config
            sed -i '/"logo": {/,/},/c\
"logo": {\
"type": "kitty-direct",\
"source": "'"$logo_path"'",\
"width": 30,\
"height": 15,\
"padding": {\
"top": 1,\
"left": 2\
}\
},' "$FASTFETCH_CONFIG"
        fi
    else
        # No logo section, add it after the schema line
        sed -i '/"$schema":/a\
"logo": {\
"type": "kitty-direct",\
"source": "'"$logo_path"'",\
"width": 30,\
"height": 15,\
"padding": {\
"top": 1,\
"left": 2\
}\
},' "$FASTFETCH_CONFIG"
    fi
    
    # Change all keyColor to yellow using sed
    sed -i 's/"keyColor": "blue"/"keyColor": "yellow"/g' "$FASTFETCH_CONFIG"
    sed -i 's/"keyColor": "green"/"keyColor": "yellow"/g' "$FASTFETCH_CONFIG"
    sed -i 's/"keyColor": "magenta"/"keyColor": "yellow"/g' "$FASTFETCH_CONFIG"
    sed -i 's/"keyColor": "red"/"keyColor": "yellow"/g' "$FASTFETCH_CONFIG"
    sed -i 's/"keyColor": "cyan"/"keyColor": "yellow"/g' "$FASTFETCH_CONFIG"
    
    print_success "Fastfetch configured with Zenitsu logo"
    
    # Add fastfetch to bashrc if not already present
    if ! grep -q "fastfetch" "$HOME/.bashrc"; then
        echo "" >> "$HOME/.bashrc"
        echo "# Zenitsu Theme - Display system info on terminal launch" >> "$HOME/.bashrc"
        echo "if command -v fastfetch &> /dev/null; then" >> "$HOME/.bashrc"
        echo "    fastfetch" >> "$HOME/.bashrc"
        echo "fi" >> "$HOME/.bashrc"
        print_success "Added fastfetch to bashrc for automatic launch"
    else
        print_info "fastfetch already configured in bashrc"
    fi
}

# ============================================================================
# Phase 7: Additional Theme Touches
# ============================================================================

apply_additional_theming() {
    print_step "Applying additional Zenitsu theme touches..."
    
    # Reload GTK theme cache
    if command -v gtk-update-icon-cache &> /dev/null; then
        gtk-update-icon-cache -f -t ~/.icons/* 2>/dev/null
    fi
    
    # Reload Waybar if running
    if pgrep -x waybar > /dev/null; then
        killall waybar
        waybar &
        disown
        print_info "Reloaded Waybar"
    fi
    
    print_success "Additional theming applied"
}

# ============================================================================
# Phase 8: Completion and Instructions
# ============================================================================

show_completion_message() {
    echo ""
    echo -e "${GREEN}"
    echo "╔════════════════════════════════════════════════════════════════╗"
    echo "║                                                                ║"
    echo "║          ⚡ ZENITSU THEME INSTALLATION COMPLETE! ⚡           ║"
    echo "║                                                                ║"
    echo "╚════════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
    echo ""
    print_success "Theme installation completed successfully!"
    echo ""
    print_info "What was done:"
    echo "  • Created theme directory: $THEME_DIR"
    echo "  • Configured wallust with Zenitsu color palette"
    echo "  • Applied Zenitsu wallpaper with swww"
    echo "  • Configured fastfetch with custom Zenitsu logo"
    echo "  • Updated color schemes system-wide"
    echo ""
    print_warning "IMPORTANT - Final Steps:"
    echo ""
    echo -e "${WHITE}To ensure all components reload with the new theme:${NC}"
    echo ""
    echo -e "  ${YELLOW}sudo reboot${NC}"
    echo ""
    echo "This will ensure Waybar, Rofi, Kitty, Hyprland, and all other"
    echo "components fully load with the Zenitsu color scheme."
    echo ""
    print_info "After reboot:"
    echo "  • Open a new terminal to see your custom Zenitsu logo"
    echo "  • All UI elements will use Zenitsu's yellow/orange palette"
    echo "  • Your wallpaper will be the chosen Zenitsu image"
    echo ""
    echo -e "${CYAN}Enjoy your Thunder Breathing themed desktop! ⚡${NC}"
    echo ""
}

# ============================================================================
# Main Execution Flow
# ============================================================================

main() {
    print_banner
    
    echo ""
    print_info "This script will apply a complete Zenitsu Agatsuma theme"
    print_info "to your Hyprland environment."
    echo ""
    
    # Execute phases
    check_dependencies
    setup_directories
    check_assets
    configure_wallust
    apply_wallpaper
    configure_fastfetch
    apply_additional_theming
    show_completion_message
}

# Run the main function
main "$@"
