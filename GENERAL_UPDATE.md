# ⚡⚡⚡ ZENITSU THEME - PROJECT DOCUMENTATION ⚡⚡⚡

**Thunder Breathing: First Form - Complete System Overview**

---

## 📋 Table of Contents

1. [Project Overview](#project-overview)
2. [What is Zenitsu Theme](#what-is-zenitsu-theme)
3. [Features](#features)
4. [Installation & Setup](#installation--setup)
5. [Current Configuration](#current-configuration)
6. [File Structure](#file-structure)
7. [Usage Guide](#usage-guide)
8. [Customization](#customization)
9. [Troubleshooting](#troubleshooting)
10. [Changelog](#changelog)
11. [Credits](#credits)

---

## 🎯 Project Overview

**Zenitsu Theme** is a complete Hyprland/Waybar theme inspired by Zenitsu Agatsuma from Demon Slayer (Kimetsu no Yaiba). The theme features intense electrical effects, thunder-yellow color scheme, and smooth animations that channel the power of Thunder Breathing.

**Theme Status**: ✅ Complete and Optimized  
**Last Updated**: October 6, 2024  
**Version**: 2.0 - GNOME Style Edition

---

## ⚡ What is Zenitsu Theme

The Zenitsu Theme transforms your Hyprland desktop with:

- **Electrical Visual Effects**: Intense glowing effects around the waybar with pulsing thunder-yellow aura
- **Thunder Breathing Color Palette**: Orange (#FFA237), Thunder Yellow (#FFE66D), Vibrant Yellow (#f9ff5e)
- **Animated Interactions**: Lightning crackle on hover, spark flash on click, thunder strike on active elements
- **Electrical Icons**: Custom iconography with lightning bolts, sparks, and electrical symbols
- **GNOME-Style Layout**: Clean, minimalist top bar with clock left, system indicators right
- **Compact Design**: Optimized horizontal spacing for maximum efficiency

---

## ✨ Features

### Visual Effects

1. **Mega Electric Pulse**
   - Intense glowing aura (20-60px) around the entire waybar
   - Pulsing animation with inner and outer shadows
   - Colors: Thunder yellow and haori orange
   - Animation: 2 seconds continuous

2. **Electric Border Pulse**
   - Borders that change colors dynamically
   - Pulses between orange (#FFA237) and yellow (#f9ff5e)
   - 15-35px glow intensity
   - Animation: 1.5 seconds continuous

3. **Lightning Crackle** (Hover)
   - Intense 30px glow on mouse hover
   - Text shadow with electrical glow
   - Quick animation (0.5s)
   - Applies to all modules

4. **Thunder Strike** (Active State)
   - 30-50px super intense glow
   - Gradient effect (orange → yellow)
   - Inner and outer shadows
   - Constant animation on active workspace

5. **Spark Flash** (Click)
   - Background changes to pure yellow (#ffff00)
   - 60px brilliant glow + inner shadow
   - Text changes to dark color
   - Duration: 200ms (very visible)

### Icon System

All icons use electrical variants from Nerd Fonts:
- **WiFi**: ⚡ (lightning signal)
- **Ethernet**: ⚡ (lightning connector)
- **Bluetooth**: ⚡ (electrical bluetooth)
- **Battery Charging**: ⚡⚡⚡ (triple thunder)
- **Volume Muted**: ⚡ (thunder sound)
- **And more...**

### Layout (GNOME Style)

```
┌─────────────────────────────────────────────────────────────┐
│ ⚡ Clock                                      🔊 📶 🔋 📱 │
└─────────────────────────────────────────────────────────────┘
```

- **Position**: Top bar (like GNOME Shell)
- **Left**: Clock/Date
- **Center**: Empty (clean design)
- **Right**: System indicators (tray, volume, network, battery)
- **Height**: 36px
- **Width**: Dynamic (fits content)

### Sound Effects (Optional)

- Electric spark sounds on interactions
- Thunder click sounds
- Requires sox package
- Located in `sounds/` directory

---

## 🚀 Installation & Setup

### Prerequisites

1. **Hyprland** (Wayland compositor)
2. **Waybar** (Status bar)
3. **Nerd Fonts** (For electrical icons)
   ```bash
   sudo pacman -S ttf-jetbrains-mono-nerd
   fc-cache -fv
   ```
4. **Optional**: sox (for sound effects)
   ```bash
   sudo pacman -S sox
   ```

### Quick Start

```bash
# Navigate to project
cd ~/Project_Zenitsu_Theme

# Launch the theme (GNOME style - current)
./launch_zenitsu_gnome_style.sh
```

### Manual Setup

```bash
# Ensure correct symlinks
cd ~/.config/waybar
ln -sf "style/⚡ [Zenitsu] Thunder Glow.css" style.css
ln -sf "configs/⚡ [BOT] Zenitsu-Peony" config

# Restart waybar
pkill waybar && waybar &
```

---

## ⚙️ Current Configuration

### Waybar Config
- **File**: `~/.config/waybar/configs/⚡ [BOT] Zenitsu-Peony`
- **Position**: Top
- **Height**: 36px
- **Spacing**: 3px between modules
- **Modules Left**: Clock
- **Modules Right**: Tray, Volume, Network, Battery

### CSS Style
- **File**: `~/.config/waybar/style/⚡ [Zenitsu] Thunder Glow.css`
- **Font**: JetBrainsMono Nerd Font, 12px bold
- **Padding**: 2px 8px (compact)
- **Margin**: 2px 1px (minimal)
- **Border Radius**: 8-14px
- **Animations**: 5 different types

### Color Scheme
```css
Haori Orange:    #FFA237  /* Primary accent */
Thunder Yellow:  #FFE66D  /* Highlights */
Vibrant Yellow:  #f9ff5e  /* Electric glow */
Intense Yellow:  #ffff00  /* Click spark */
Dark Background: #0d0d0d  /* Base */
```

---

## 📁 File Structure

### Essential Files

```
Project_Zenitsu_Theme/
├── GENERAL_UPDATE.md              ← This file (main documentation)
├── EMPEZAR_AQUI.txt               ← Quick start guide (Spanish)
├── TROUBLESHOOTING_GUIDE.txt      ← Problem solving guide
├── ZENITSU_GNOME_STYLE.txt        ← GNOME layout documentation
├── RESUMEN_ESPAÑOL.txt            ← Spanish summary
├── launch_zenitsu_gnome_style.sh  ← Main launcher
├── apply_electrical_icons.sh      ← Icon applicator
├── clean_css_duplicates.sh        ← CSS cleanup utility
├── electrify_icons_and_sounds.sh  ← Full setup script
├── fix_zenitsu_icons.sh           ← Fix utility
├── sounds/
│   ├── electric_spark.wav         ← Spark sound effect
│   ├── thunder_click.wav          ← Click sound effect
│   └── play_spark.sh              ← Sound player script
└── zenitsu_theme/                 ← Theme assets
```

### Configuration Files

```
~/.config/waybar/
├── config → configs/⚡ [BOT] Zenitsu-Peony
├── style.css → style/⚡ [Zenitsu] Thunder Glow.css
├── configs/
│   └── ⚡ [BOT] Zenitsu-Peony
├── style/
│   └── ⚡ [Zenitsu] Thunder Glow.css
├── ZenitsuModules                 ← Module definitions
├── ZenitsuModulesCustom           ← Custom modules
├── ModulesWorkspaces              ← Workspace config
└── ModulesGroups                  ← Module groups
```

### Archived Files

Old/redundant files have been moved to:
- `archive_old_docs/` - Old documentation
- `archive_old_scripts/` - Old scripts

---

## 📖 Usage Guide

### Launching the Theme

**Option 1: Use the launcher (Recommended)**
```bash
cd ~/Project_Zenitsu_Theme
./launch_zenitsu_gnome_style.sh
```

**Option 2: Manual launch**
```bash
pkill waybar && waybar &
```

### Reloading Changes

After editing configuration or CSS:
```bash
pkill waybar && waybar &
```

Or use Hyprland keybind (if configured):
```
SUPER + ALT + R
```

### Testing Click Effects

Click any module to see the spark flash:
- Click the **clock** → Yellow flash ⚡
- Click **volume** icon → Yellow flash ⚡
- Click **network** icon → Yellow flash ⚡
- Click **any module** → Yellow flash ⚡

### Applying Icons

If icons appear as boxes (missing Nerd Fonts):
```bash
cd ~/Project_Zenitsu_Theme
./apply_electrical_icons.sh
```

### Cleaning CSS

If CSS has issues or duplicates:
```bash
cd ~/Project_Zenitsu_Theme
./clean_css_duplicates.sh
```

### Complete Fix

If multiple issues exist:
```bash
cd ~/Project_Zenitsu_Theme
./fix_zenitsu_icons.sh
```

---

## 🎨 Customization

### Making Waybar Even More Compact

Edit the CSS file:
```bash
nano ~/.config/waybar/style/"⚡ [Zenitsu] Thunder Glow.css"
```

Find line ~205 and change padding:
```css
/* Current */
padding: 2px 8px;

/* More compact */
padding: 2px 6px;

/* Super compact */
padding: 2px 5px;
```

Save and reload:
```bash
pkill waybar && waybar &
```

### Adjusting Glow Intensity

In the same CSS file, find `@keyframes mega-electric-pulse` (line ~29):

```css
/* Less intense */
box-shadow: 0 0 15px 3px rgba(249, 255, 94, 0.6);

/* Current (medium) */
box-shadow: 0 0 20px 5px rgba(249, 255, 94, 0.6);

/* More intense */
box-shadow: 0 0 30px 8px rgba(249, 255, 94, 0.8);
```

### Adding Workspaces Back

To show workspaces on the bar:

Edit config:
```bash
nano ~/.config/waybar/configs/"⚡ [BOT] Zenitsu-Peony"
```

Change `modules-left`:
```json
"modules-left": [
    "hyprland/workspaces#roman",  // Add this line
    "clock#4"
],
```

Reload waybar.

### Changing Position

To move bar to bottom:

Edit config, change:
```json
"position": "top",  // Change to "bottom"
```

### Custom Icons

Edit module files:
```bash
nano ~/.config/waybar/ZenitsuModules
```

Find the module and change format icons. Use [Nerd Fonts Cheat Sheet](https://www.nerdfonts.com/cheat-sheet) to find icons.

---

## 🔧 Troubleshooting

### Icons Show as Boxes

**Problem**: Icons display as empty squares  
**Solution**:
```bash
sudo pacman -S ttf-jetbrains-mono-nerd
fc-cache -fv
pkill waybar && waybar &
```

### Waybar Doesn't Appear

**Problem**: Waybar fails to start  
**Solution**:
```bash
# Check for errors
waybar -l debug

# Check config syntax
cat ~/.config/waybar/config

# Restore from backup
cd ~/.config/waybar
ls -lt ZenitsuModules.backup_* | head -1
# Copy the latest backup
```

### Click Spark Not Visible

**Problem**: No visual feedback on click  
**Solution**: Already fixed in current version. If still not visible:
```bash
cd ~/Project_Zenitsu_Theme
./clean_css_duplicates.sh
pkill waybar && waybar &
```

### Glow Effects Too Intense/Not Intense Enough

**Problem**: Effects are too bright or too dim  
**Solution**: See [Customization](#customization) section above

### Waybar Too Wide

**Problem**: Bar takes too much horizontal space  
**Solution**: See [Making Waybar Even More Compact](#making-waybar-even-more-compact)

### Sound Not Playing

**Problem**: Click sounds don't work  
**Solution**:
```bash
# Install sox
sudo pacman -S sox

# Test sound
~/Project_Zenitsu_Theme/sounds/play_spark.sh

# Check audio system
pactl info  # For PulseAudio
pw-cli info # For PipeWire
```

### Complete Reset

If everything is broken:
```bash
cd ~/Project_Zenitsu_Theme
./fix_zenitsu_icons.sh
```

See full troubleshooting guide: `TROUBLESHOOTING_GUIDE.txt`

---

## 📜 Changelog

### Version 2.0 - GNOME Style Edition (October 6, 2024)

**Major Changes:**
- ✅ Reorganized to GNOME Shell style layout
- ✅ Moved bar to TOP position (was bottom)
- ✅ Clock moved to LEFT (was center)
- ✅ System indicators on RIGHT
- ✅ Made waybar more compact horizontally (-20% padding)
- ✅ Fixed click spark visibility (now uses background change)
- ✅ Removed Thunder Breathing CSS (only Thunder Glow active)
- ✅ Cleaned up project structure
- ✅ Archived old documentation

**Visual Improvements:**
- Click effect now changes background to pure yellow
- Increased click visibility with inner shadows
- Font size reduced to 12px for compactness
- Margin reduced by 50% horizontally

**Technical:**
- Padding: 2px 10px → 2px 8px
- Margin: 2px 2px → 2px 1px
- Font: 13px → 12px
- Position: bottom → top
- Layout: workspaces-left, clock-center, system-right → clock-left, system-right

### Version 1.0 - Initial Release

**Features:**
- ⚡ Electrical icon system
- ⚡ Thunder Glow CSS with intense effects
- ⚡ Mega electric pulse animation
- ⚡ Lightning crackle on hover
- ⚡ Thunder strike on active elements
- ⚡ Sound effects system
- ⚡ Complete Hyprland/Waybar integration

---

## 🎨 Design Philosophy

### Thunder Breathing Aesthetic

The theme is inspired by Zenitsu's Thunder Breathing techniques:

1. **First Form - Thunderclap and Flash**: Instant, overwhelming power (click spark)
2. **Constant Form**: Sustained electrical energy (continuous glow)
3. **Electric Speed**: Swift, efficient design (compact layout)
4. **Thunder Yellow**: Zenitsu's signature color (primary palette)
5. **Haori Orange**: His iconic outfit color (accent color)

### Visual Hierarchy

- **Most Important**: Active elements (thunder strike animation)
- **Interactive**: Hover states (lightning crackle)
- **Feedback**: Click effects (spark flash)
- **Ambient**: Constant glow (electric pulse)
- **Subtle**: Borders and spacing

### Performance

All animations are CSS-based with GPU acceleration:
- No JavaScript overhead
- Smooth 60fps animations
- Low CPU usage
- Efficient memory footprint

---

## 👥 Credits

### Inspiration
- **Zenitsu Agatsuma** - Character from Demon Slayer (Kimetsu no Yaiba)
- **Koyoharu Gotouge** - Creator of Demon Slayer

### Base Configuration
- **JaKooLit** - Original Hyprland dotfiles base
- **Krautt** - Peony waybar design inspiration

### Fonts & Icons
- **JetBrainsMono Nerd Font** - Main font
- **Nerd Fonts** - Icon collection

### Tools
- **Hyprland** - Wayland compositor
- **Waybar** - Status bar
- **Sox** - Sound effect generation

---

## 📞 Support & Resources

### Documentation Files

- `GENERAL_UPDATE.md` - This file (complete documentation)
- `EMPEZAR_AQUI.txt` - Quick start (Spanish)
- `TROUBLESHOOTING_GUIDE.txt` - Problem solving
- `ZENITSU_GNOME_STYLE.txt` - GNOME layout details
- `RESUMEN_ESPAÑOL.txt` - Spanish summary

### Essential Scripts

- `launch_zenitsu_gnome_style.sh` - Main launcher
- `apply_electrical_icons.sh` - Apply icons
- `clean_css_duplicates.sh` - Clean CSS
- `fix_zenitsu_icons.sh` - Fix issues

### Quick Commands

```bash
# Activate theme
cd ~/Project_Zenitsu_Theme && ./launch_zenitsu_gnome_style.sh

# Reload waybar
pkill waybar && waybar &

# Apply icons
./apply_electrical_icons.sh

# Fix issues
./fix_zenitsu_icons.sh

# Check fonts
fc-list | grep -i nerd

# Test sound
~/Project_Zenitsu_Theme/sounds/play_spark.sh
```

---

## 🔮 Future Ideas

Potential improvements for future versions:

- [ ] Workspace auto-hide on hover at top-left corner
- [ ] Additional color schemes (blue lightning, purple thunder)
- [ ] Hyprland window decorations matching the theme
- [ ] GTK theme integration
- [ ] Rofi/Wofi menu theme
- [ ] Notification center (swaync) theme refinement
- [ ] More sound effects
- [ ] Animation speed controls
- [ ] Light mode variant

---

## 📝 License

This is a personal customization project. Feel free to use, modify, and share.

**Note**: Demon Slayer characters and related content are property of Koyoharu Gotouge and respective copyright holders. This theme is a fan creation and not officially affiliated.

---

## ⚡⚡⚡ Thunder Breathing: Complete! ⚡⚡⚡

**Project Status**: Fully functional and optimized  
**Theme Version**: 2.0 - GNOME Style Edition  
**Last Updated**: October 6, 2024

Your desktop now channels the power of Thunder Breathing!

---

*Created with ⚡ and inspired by Zenitsu Agatsuma*
