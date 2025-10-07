# ⚡ Zenitsu Agatsuma Complete Theming Plan ⚡
## Demon Slayer: Kimetsu no Yaiba - Hyprland Theme

---

## 📋 Phase 1: Asset Acquisition and Analysis

### 🎨 Character Analysis: Zenitsu Agatsuma

Zenitsu Agatsuma is a prominent character from Demon Slayer (Kimetsu no Yaiba) and a member of the Demon Slayer Corps who specializes in Thunder Breathing. His visual identity is one of the most distinctive in the series, characterized by several key aesthetic elements:

**Primary Visual Elements:**
- **Hair**: Bright yellow-to-orange gradient, reminiscent of lightning bolts and electric energy
- **Haori Pattern**: Iconic triangular white and pale yellow patterns on a deep golden-yellow background
- **Color Psychology**: Yellow represents his Thunder Breathing style, lightning speed, and the duality of his fearful/powerful personality
- **Theme**: Thunder, lightning, electricity, and raw speed

**Core Color Identity:**
The Zenitsu aesthetic is built on a foundation of warm, energetic colors that evoke lightning striking through darkness. His yellow-orange palette creates high contrast against blacks and whites, symbolizing the electric nature of his fighting style and the stark contrast between his cowardly and heroic personalities.

---

### 🎨 Official Zenitsu Color Palette

The following HEX color codes form the foundation of the entire theme. These colors are directly derived from Zenitsu's character design and will be hard-coded into the wallust configuration:

#### Primary Colors
```
#FFD700  - Gold (Primary Yellow - Hair/Thunder)
#FFEB3B  - Bright Yellow (Lightning Accent)
#FF9800  - Orange (Hair Tips/Warm Accent)
#FF6F00  - Deep Orange (Shadow Orange)
```

#### Secondary Colors
```
#FFF9C4  - Cream/Pale Yellow (Haori Light Pattern)
#FFC107  - Amber (Mid-tone Yellow)
#FFA726  - Light Orange (Soft Accent)
#FFB74D  - Bright Orange (Highlights)
```

#### Base Colors
```
#1A1A1A  - Near Black (Background/Haori Base)
#424242  - Dark Gray (Shadows/Secondary Background)
#FFFFFF  - Pure White (Haori Pattern/Text)
#FFF9C4  - Off-White (Soft Text)
```

#### Extended Palette (16 Colors for Terminal)
```
color0:  #1A1A1A  (Black - Background)
color1:  #FF6F00  (Deep Orange - Red)
color2:  #FFD700  (Gold - Green)
color3:  #FFEB3B  (Bright Yellow - Yellow)
color4:  #FF9800  (Orange - Blue)
color5:  #FFA726  (Light Orange - Magenta)
color6:  #FFC107  (Amber - Cyan)
color7:  #FFF9C4  (Light Yellow - White)
color8:  #424242  (Dark Gray - Bright Black)
color9:  #FF8A50  (Bright Orange)
color10: #FFED4E  (Bright Gold)
color11: #FFFF72  (Very Bright Yellow)
color12: #FFB74D  (Bright Orange)
color13: #FFCC80  (Peach Orange)
color14: #FFD54F  (Golden Yellow)
color15: #FFFFFF  (Pure White)
```

---

### 🖼️ Wallpaper Collection Guide

High-resolution (1920x1080 or higher) Zenitsu wallpapers are essential for the theme. Here are the recommended types and where to find them:

#### Recommended Wallpaper Sources:

1. **Wallhaven.cc**
   - Search: "Zenitsu Agatsuma"
   - Filter: 1920x1080 minimum, SFW
   - Look for images with strong yellow/orange color presence

2. **WallpaperAccess.com**
   - Search: "Zenitsu demon slayer"
   - Categories: Anime > Demon Slayer
   - Choose images featuring his thunder breathing form

3. **Zerochan.net**
   - Search: "Agatsuma Zenitsu"
   - High-quality anime artwork repository
   - Filter by resolution

4. **Reddit Communities**
   - r/KimetsuNoYaiba
   - r/Animewallpaper
   - Search for "Zenitsu wallpaper"

#### Ideal Wallpaper Characteristics:
- **Color Dominance**: Strong yellow/orange presence
- **Resolution**: 1920x1080 (1080p) minimum, 4K preferred
- **Subject Focus**: Zenitsu in Thunder Breathing form or showing his haori
- **Contrast**: Good contrast between light and dark elements
- **Composition**: Central or rule-of-thirds composition works best

#### Specific Wallpaper Themes to Look For:
1. **Thunder Breathing Zenitsu** - Action shots with lightning effects
2. **Sleeping Zenitsu** - Peaceful shots showcasing his yellow hair
3. **Zenitsu Haori Close-up** - Detailed shots of his iconic jacket pattern
4. **Godspeed/Seventh Form** - His ultimate technique visualization
5. **Dual Personality** - Split-screen showing both sides of his character

---

### 🎯 Iconography and PNG Assets

#### 1. Zenitsu Character PNGs

**Primary Zenitsu Render (Full Body)**
- **Source**: pngwing.com, deviantart.com, pnghut.com
- **Search Terms**: 
  - "Zenitsu Agatsuma render transparent PNG"
  - "Zenitsu PNG transparent background"
  - "Kimetsu no Yaiba Zenitsu render"
- **Requirements**: 
  - Transparent background (PNG)
  - High resolution (1000px height minimum)
  - Clear, official anime art style
  - Full body or upper body shot

**Chibi Zenitsu (For Logo)**
- **Source**: deviantart.com, pinterest.com, seekpng.com
- **Search Terms**:
  - "Zenitsu chibi PNG transparent"
  - "Zenitsu cute PNG"
  - "Demon Slayer Zenitsu SD character"
- **Requirements**:
  - Transparent background
  - Small, simplified style (chibi/SD)
  - 500x500px or similar square format
  - Recognizable Zenitsu features (yellow hair, haori)

**Thunder Breathing Symbol (Optional)**
- **Source**: Kimetsu no Yaiba wiki, fandom pages
- **Search Terms**:
  - "Thunder Breathing symbol Demon Slayer"
  - "Kimetsu no Yaiba thunder kanji"
- **Requirements**:
  - Clean vector or high-res PNG
  - Transparent background
  - Traditional Japanese aesthetic

#### 2. Arch Linux Logo

**Official Arch Logo**
- **Primary Source**: https://archlinux.org/art/
- **Alternative Sources**:
  - Wikimedia Commons: "Arch Linux logo"
  - GitHub: archlinux/artwork
  - Simple Wikipedia: Arch Linux page
- **Formats Needed**:
  - PNG with transparency (preferred)
  - SVG vector format (convertible to PNG)
- **Requirements**:
  - Official blue color (#1793D1)
  - High resolution (512px minimum)
  - Transparent background
  - Clean edges

#### 3. Logo Combination Instructions

To create the custom terminal logo (zenitsu_arch_logo.png):

**Method 1: Using GIMP (Linux)**
```bash
# Install GIMP if not already installed
yay -S gimp

# Steps in GIMP:
1. File > New > 512x512 pixels, transparent background
2. File > Open as Layers > Import Arch Linux logo
3. File > Open as Layers > Import Zenitsu chibi PNG
4. Position Arch logo on left side (scale to ~200px height)
5. Position Zenitsu PNG on right side (scale to ~250px height)
6. Adjust positions for balance
7. File > Export As > zenitsu_arch_logo.png
8. Save to ~/Pictures/zenitsu_theme/logos/
```

**Method 2: Using Photopea (Browser-based)**
```
1. Visit: photopea.com
2. Project > New > 512x512px, transparent
3. File > Open & Place > Arch logo
4. File > Open & Place > Zenitsu PNG
5. Arrange with Arch on left, Zenitsu on right
6. File > Export As > PNG
7. Save to ~/Pictures/zenitsu_theme/logos/
```

**Method 3: Using ImageMagick (Command-line)**
```bash
# Install ImageMagick
yay -S imagemagick

# Combine images (adjust sizes and positions as needed)
convert -size 512x512 xc:none \
    arch_logo.png -resize 200x200 -geometry +50+156 -composite \
    zenitsu_chibi.png -resize 250x250 -geometry +262+131 -composite \
    ~/Pictures/zenitsu_theme/logos/zenitsu_arch_logo.png
```

---

## 📋 Phase 2: Theming Implementation Plan

### Overview

The theming implementation is fully automated through the `apply_zenitsu_theme.sh` script. This script handles all configuration file modifications, color scheme application, and system integration.

---

### 🎯 Action Item 1: Master Theming Script

**Script Location**: `~/apply_zenitsu_theme.sh`

**Purpose**: Central automation tool that applies the complete Zenitsu theme to your Hyprland environment.

#### Script Architecture

The script is organized into 8 distinct phases, each handling a specific aspect of the theming process:

1. **Pre-flight Checks**: Verify dependencies (swww, wallust, fastfetch)
2. **Directory Setup**: Create organized theme directory structure
3. **Asset Verification**: Check for required wallpapers and logos
4. **Wallust Configuration**: Apply hard-coded Zenitsu color palette
5. **Wallpaper Application**: Set wallpaper using swww
6. **Fastfetch Configuration**: Configure custom terminal logo
7. **Additional Theming**: Apply finishing touches (Waybar reload, etc.)
8. **Completion**: Display success message and reboot instructions

---

### 📁 Sub-task 1.1: Wallpaper and Color Generation

#### Directory Structure Creation

The script creates the following organized directory structure:

```
~/Pictures/zenitsu_theme/
├── wallpapers/          # Store your chosen Zenitsu wallpaper here
├── logos/               # Store the custom zenitsu_arch_logo.png here
└── assets/              # Store source PNGs (Zenitsu, Arch logo) here
```

#### Wallust Configuration Strategy

**Key Innovation**: Instead of allowing wallust to automatically generate colors from the wallpaper (which may not be accurate to Zenitsu's true colors), the script **hard-codes** the official Zenitsu color palette directly into the wallust configuration file.

**Configuration File**: `~/.config/wallust/wallust.toml`

**What the Script Does**:

1. **Backs up** existing wallust configuration with timestamp
2. **Creates new configuration** with custom color palette
3. **Injects** all 16 Zenitsu colors into the `[custom_colors]` section
4. **Preserves** wallust's template system for system-wide color application
5. **Runs** wallust to generate color files for other applications

**Technical Details**:

```toml
[custom_colors]
color0 = "#1A1A1A"   # Black background
color1 = "#FF6F00"   # Deep Orange
color2 = "#FFD700"   # Gold (Zenitsu's signature color)
color3 = "#FFEB3B"   # Bright Yellow (lightning)
# ... (all 16 colors as specified in Phase 1)
```

This approach ensures **100% color fidelity** to Zenitsu's character design, regardless of the specific wallpaper chosen.

#### Wallpaper Application

**Tool**: swww (Wayland wallpaper daemon)

**Process**:
1. Checks if swww-daemon is running, starts if needed
2. Locates wallpaper in `~/Pictures/zenitsu_theme/wallpapers/`
3. Applies wallpaper with smooth fade transition (2 seconds)
4. Triggers wallust to generate template files
5. Color schemes propagate to Kitty, Rofi, Waybar, etc.

**Command**: `swww img <wallpaper> --transition-type fade --transition-duration 2`

---

### 🖼️ Sub-task 1.2: Custom Terminal Logo (fastfetch)

#### Fastfetch Installation and Configuration

**What is Fastfetch**: A modern, fast system information tool (neofetch alternative) that displays system stats with a custom logo when you open a terminal.

#### Configuration File Locations

- **Source Template**: `~/Hyprland-Dots/config/fastfetch/config.jsonc`
- **Active Config**: `~/.config/fastfetch/config.jsonc`

#### What the Script Does

1. **Checks** if fastfetch is installed, installs if missing
2. **Creates** config directory if it doesn't exist
3. **Copies** base configuration from JaKooLit dotfiles (if available)
4. **Backs up** existing configuration with timestamp
5. **Modifies** JSON configuration using Python for robust parsing
6. **Sets** logo source to `~/Pictures/zenitsu_theme/logos/zenitsu_arch_logo.png`
7. **Configures** logo display parameters:
   - Type: `kitty-direct` (high-quality image rendering)
   - Width: 30 characters
   - Height: 15 lines
   - Padding: Top 1, Left 2
8. **Changes** all key colors to yellow (Zenitsu theme consistency)
9. **Adds** fastfetch to `~/.bashrc` for automatic launch on terminal open

#### Logo Configuration Details

The script uses Python to properly parse and modify the JSON configuration:

```json
{
  "logo": {
    "type": "kitty-direct",
    "source": "/home/user/Pictures/zenitsu_theme/logos/zenitsu_arch_logo.png",
    "width": 30,
    "height": 15,
    "padding": {
      "top": 1,
      "left": 2
    }
  }
}
```

**Why Python?**: The fastfetch config uses JSONC (JSON with comments), which requires comment removal before parsing. Python provides robust error handling and proper JSON manipulation.

#### Terminal Integration

The script adds the following to your `~/.bashrc`:

```bash
# Zenitsu Theme - Display system info on terminal launch
if command -v fastfetch &> /dev/null; then
    fastfetch
fi
```

This ensures your custom Zenitsu + Arch logo appears every time you open a new terminal window.

---

### 🔄 Sub-task 1.3: Final Instructions and System Reload

#### Why Reboot is Necessary

While many Linux configurations can be reloaded without rebooting, a full system restart is recommended for the Zenitsu theme because:

1. **Hyprland Compositor**: Reloading ensures all compositor-level color values are refreshed
2. **Waybar**: Status bar needs full restart to apply new color scheme
3. **Rofi**: Application launcher reads colors on startup
4. **Kitty Terminal**: While colors can be reloaded, a fresh start ensures consistency
5. **GTK/Qt Themes**: System-wide theme caches are fully cleared
6. **D-Bus Services**: Background services that use colors get proper refresh
7. **SWWW Daemon**: Fresh start with the new wallpaper configuration

#### Post-Installation Instructions

The script displays comprehensive completion instructions:

**What Was Done:**
- ✓ Created theme directory structure
- ✓ Configured wallust with hard-coded Zenitsu colors
- ✓ Applied Zenitsu wallpaper with swww
- ✓ Configured fastfetch with custom logo
- ✓ Updated color schemes system-wide
- ✓ Reloaded applicable services (Waybar)

**Required Action:**
```bash
sudo reboot
```

**After Reboot, You'll See:**
- Custom Zenitsu + Arch logo in every new terminal
- All UI elements using Zenitsu's yellow/orange color palette
- Chosen Zenitsu wallpaper on all displays
- Consistent theming across Waybar, Rofi, Kitty, and all applications

---

## 🚀 Usage Instructions

### Step 1: Prepare Assets

Before running the script, gather your assets:

1. **Download a Zenitsu Wallpaper**
   - Visit wallhaven.cc or wallpaperaccess.com
   - Search: "Zenitsu Agatsuma"
   - Download high-resolution image (1920x1080+)
   - Save to: `~/Pictures/zenitsu_theme/wallpapers/`

2. **Download Zenitsu PNG**
   - Visit pngwing.com or deviantart.com
   - Search: "Zenitsu chibi PNG transparent"
   - Download transparent PNG
   - Save to: `~/Pictures/zenitsu_theme/assets/`

3. **Download Arch Linux Logo**
   - Visit archlinux.org/art/
   - Download PNG or SVG
   - Save to: `~/Pictures/zenitsu_theme/assets/`

4. **Create Custom Logo**
   - Use GIMP, Photopea, or ImageMagick
   - Combine Arch logo (left) + Zenitsu PNG (right)
   - Canvas: 512x512px, transparent background
   - Save as: `~/Pictures/zenitsu_theme/logos/zenitsu_arch_logo.png`

### Step 2: Run the Script

```bash
# Navigate to home directory
cd ~

# Make script executable (if not already)
chmod +x apply_zenitsu_theme.sh

# Run the script
./apply_zenitsu_theme.sh
```

### Step 3: Follow On-Screen Instructions

The script will:
- Check for dependencies
- Verify your assets are present
- Guide you if anything is missing
- Apply all configurations automatically

### Step 4: Reboot

```bash
sudo reboot
```

### Step 5: Enjoy Your Zenitsu Theme!

After reboot:
- Open a terminal to see your custom logo
- Observe the yellow/orange color scheme everywhere
- Your wallpaper is now the Zenitsu image you chose

---

## 🎨 Theme Components Affected

The Zenitsu theme will be applied to:

### System-Wide
- **Wallpaper**: Zenitsu image set via swww
- **Color Palette**: All applications using wallust templates

### Hyprland Compositor
- **Window Borders**: Yellow/orange tones
- **Workspace Indicators**: Zenitsu colors
- **Animations**: Themed with color palette

### Applications
- **Waybar**: Status bar with Zenitsu colors
- **Rofi**: Application launcher with themed background
- **Kitty**: Terminal colors matching Zenitsu palette
- **Dunst/Swaync**: Notification styling
- **Cava**: Audio visualizer colors
- **Btop**: System monitor theme

### Terminal
- **Fastfetch Logo**: Custom Zenitsu + Arch logo
- **Prompt Colors**: Yellow/orange theme
- **Text Colors**: All 16 terminal colors themed

---

## 🔧 Troubleshooting

### Issue: "Missing dependencies"
**Solution**: Install required packages
```bash
yay -S swww wallust fastfetch
```

### Issue: "No wallpaper found"
**Solution**: Ensure wallpaper is in correct directory
```bash
ls ~/Pictures/zenitsu_theme/wallpapers/
```

### Issue: "Custom logo not found"
**Solution**: Create the logo using GIMP or Photopea (see instructions above)

### Issue: "Colors not applying"
**Solution**: Reboot the system
```bash
sudo reboot
```

### Issue: "Fastfetch not showing logo"
**Solution**: Check logo path and format
```bash
# Verify logo exists
ls -lh ~/Pictures/zenitsu_theme/logos/zenitsu_arch_logo.png

# Test fastfetch manually
fastfetch

# Check config
cat ~/.config/fastfetch/config.jsonc
```

### Issue: "Waybar still using old colors"
**Solution**: Manually reload Waybar
```bash
killall waybar
waybar &
```

---

## 🎯 Advanced Customization

### Changing Specific Colors

Edit the wallust configuration:
```bash
nano ~/.config/wallust/wallust.toml
```

Modify colors in the `[custom_colors]` section, then run:
```bash
wallust run ~/Pictures/zenitsu_theme/wallpapers/your_wallpaper.jpg
```

### Using Different Wallpapers

Simply place new wallpaper in the wallpapers directory and rerun:
```bash
./apply_zenitsu_theme.sh
```

The script will use the new wallpaper while keeping the color palette consistent.

### Adjusting Logo Size

Edit fastfetch config:
```bash
nano ~/.config/fastfetch/config.jsonc
```

Modify the `width` and `height` values in the logo section.

---

## 📝 File Locations Reference

```
~/apply_zenitsu_theme.sh              # Main theme script
~/Commands_Hyprland_Use.txt           # Hyprland commands reference
~/ZENITSU_THEME_PLAN.md               # This document

~/Pictures/zenitsu_theme/
├── wallpapers/                       # Your Zenitsu wallpapers
├── logos/
│   └── zenitsu_arch_logo.png        # Custom terminal logo
└── assets/                           # Source images

~/.config/wallust/wallust.toml        # Wallust color configuration
~/.config/fastfetch/config.jsonc      # Fastfetch terminal logo config
~/.bashrc                             # Shell configuration (fastfetch launch)

Backups created by script:
~/.config/wallust/wallust.toml.backup.YYYYMMDD_HHMMSS
~/.config/fastfetch/config.jsonc.backup.YYYYMMDD_HHMMSS
```

---

## 🌟 Theme Philosophy

This theme aims to capture the essence of Zenitsu Agatsuma:

**Visual Elements:**
- **Yellow/Orange Dominance**: Represents Thunder Breathing and lightning
- **High Contrast**: Reflects the duality of his personality
- **Clean, Bold Design**: Mirrors his haori's geometric patterns
- **Electric Energy**: Colors evoke speed and power

**User Experience:**
- **Consistent**: Same color palette across all applications
- **Immersive**: Every element reflects the character
- **Performant**: No compromises on system performance
- **Reversible**: All configs backed up, easy to undo

---

## ⚡ Credits and Resources

**Theme Created By**: GitHub Copilot CLI  
**Based On**: Zenitsu Agatsuma from Demon Slayer: Kimetsu no Yaiba  
**Dotfiles**: JaKooLit Hyprland-Dots  

**Key Technologies:**
- Hyprland (Wayland Compositor)
- Wallust (Color Scheme Generator)
- SWWW (Wallpaper Daemon)
- Fastfetch (System Info Display)
- JaKooLit Dotfiles (Base Configuration)

**Useful Links:**
- Demon Slayer Official: https://kimetsu.com/
- Hyprland: https://hyprland.org/
- JaKooLit Dotfiles: https://github.com/JaKooLit/Hyprland-Dots
- Wallhaven: https://wallhaven.cc/
- Arch Linux: https://archlinux.org/

---

## 📄 License

This theme configuration is provided as-is for personal use. Demon Slayer: Kimetsu no Yaiba and all related characters are property of Koyoharu Gotouge and ufotable.

---

**Ready to transform your desktop into a Thunder Breathing masterpiece? Run the script and embrace the power of Zenitsu! ⚡**
