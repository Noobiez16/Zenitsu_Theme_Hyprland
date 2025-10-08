# ⚡ Zenitsu Theme for Hyprland/Waybar

![Theme Status](https://img.shields.io/badge/Status-Complete-success)
![Version](https://img.shields.io/badge/Version-3.0-blue)
![Style](https://img.shields.io/badge/Style-Floating-yellow)

Thunder Breathing themed desktop environment with animated lightning effects and floating transparent design, inspired by Zenitsu Agatsuma from Demon Slayer.

## ✨ Features

- 🌊 **Floating Waybar** - Centered, semi-transparent bar with rounded corners
- ⚡ **Animated Lightning Borders** - Crackling 4-color gradient on active windows
- 🎨 **Thunder Color Scheme** - Yellow, White, Blue, Orange electrical palette
- 💎 **Transparent Windows** - 85% active, 75% inactive opacity with blur
- 🔔 **Integrated Notifications** - Swaync positioned perfectly above Waybar
- 🔧 **System Verification** - Automated health check script
- 🎯 **Icon Theme** - Tela Yellow theme matching Zenitsu's haori

## 🚀 Quick Start

```bash
# Verify system health
~/Project_Zenitsu_Theme/Scripts/verify_zenitsu_system.sh

# Install yellow icons (if needed)
~/Project_Zenitsu_Theme/Scripts/install_yellow_icons.sh
```

## 📋 Requirements

- Hyprland (Wayland compositor)
- Waybar (Status bar)
- Swaync (Notification center)
- FiraCode Nerd Font (For icons)
- Tela Yellow Icon Theme
  ```bash
  sudo pacman -S ttf-firacode-nerd tela-circle-icon-theme-yellow
  fc-cache -fv
  ```

## 📖 Documentation

- **[SYSTEM_STATUS.md](SYSTEM_STATUS.md)** - Current system configuration status
- **[GENERAL_UPDATE.md](GENERAL_UPDATE.md)** - Complete project documentation
- **Scripts/verify_zenitsu_system.sh** - Automated system verification

## 🎨 Design Overview

### Floating Waybar Layout
```
┌────────────────────────────────────────────────────────────┐
│                                                            │
│   ╔═══════════════════════════════════════════════════╗   │
│   ║ ⚡ Workspaces  |  Clock  |  🖥️ 💾 🌡️ 🔊 📶 🔔  ║   │
│   ╚═══════════════════════════════════════════════════╝   │
│                         ↑                                  │
│                   (floating, 1800px wide)                  │
└────────────────────────────────────────────────────────────┘
```

### Window Border Animation
Active windows feature a continuously rotating 4-color gradient:
- **Zenitsu Yellow** (`#F7DC6F`) → **Bright White** (`#FFFFFF`) → 
- **Lightning Blue** (`#5DADE2`) → **Haori Orange** (`#F39C12`)

### Transparency & Blur
- **Waybar**: 85% opacity, 15px rounded corners
- **Active Windows**: 85% opacity, 15px rounded corners
- **Inactive Windows**: 75% opacity
- **Blur**: Enabled with 3-pixel radius

### Colors
- Zenitsu Yellow: `#F7DC6F`
- Haori Orange: `#F39C12`
- Lightning Blue: `#5DADE2`
- Charcoal Dark: `#212121`

## 🛠️ Essential Scripts

| Script | Purpose |
|--------|---------|
| `verify_zenitsu_system.sh` | Complete system health check |
| `install_yellow_icons.sh` | Install and apply Tela Yellow icons |
| `launch_zenitsu_gnome_style.sh` | Launch theme (legacy) |
| `test_zenitsu_notifications.sh` | Test notification styling |

## 🔧 Configuration Files

### Waybar
- **Config**: `~/.config/waybar/configs/⚡ [BOT] Zenitsu-Peony`
  - Width: 1800px
  - Margins: 60px left/right, 4px bottom
  - Height: 36px
  
- **Style**: `~/.config/waybar/style/⚡ [Zenitsu] Thunder Glow.css`
  - Border-radius: 15px
  - Background: alpha(@charcoal-dark, 0.85)

### Hyprland
- **Decorations**: `~/.config/hypr/UserConfigs/UserDecorations.conf`
  - Active border: 4-color gradient (animated)
  - Rounding: 15px
  - Opacity: 85% active, 75% inactive
  
- **Animations**: `~/.config/hypr/UserConfigs/UserAnimations.conf`
  - Borderangle: loop animation (speed 8)
  
- **Startup**: `~/.config/hypr/UserConfigs/Startup_Apps.conf`
  - Icon theme: Tela-circle-yellow-dark

### Swaync
- **Config**: `~/.config/swaync/config.json`
  - Bottom margin: 45px (clears Waybar)
  - Right margin: 65px (aligned with Waybar)
  
- **Style**: `~/.config/swaync/style.css`
  - Transparency: alpha(@charcoal-dark, 0.85)
  - Border-radius: 15px

## 🐛 Troubleshooting

**Run system verification first:**
```bash
~/Project_Zenitsu_Theme/Scripts/verify_zenitsu_system.sh
```

**Icons show as boxes:**
```bash
sudo pacman -S ttf-firacode-nerd
fc-cache -fv
pkill waybar && waybar &
```

**Wrong icon theme:**
```bash
~/Project_Zenitsu_Theme/Scripts/install_yellow_icons.sh
```

**Waybar not floating:**
```bash
hyprctl reload  # Reload Hyprland config
```

**Notifications overlap Waybar:**
```bash
# Verify swaync margins in ~/.config/swaync/config.json
# Should be: "control-center-margin-bottom": 45
killall swaync && swaync &
```

## 📁 Project Structure

```
Project_Zenitsu_Theme/
├── README.md                           ← This file
├── SYSTEM_STATUS.md                    ← Current configuration status
├── GENERAL_UPDATE.md                   ← Complete documentation
├── copilot_github.md                   ← Development instructions
├── Scripts/
│   ├── verify_zenitsu_system.sh        ← System health check
│   ├── install_yellow_icons.sh         ← Icon installer
│   ├── test_zenitsu_notifications.sh   ← Test notifications
│   └── launch_zenitsu_gnome_style.sh   ← Legacy launcher
├── sounds/                             ← Sound effects
└── archive_*/                          ← Old files

Config Files (in ~/.config/):
├── waybar/
│   ├── configs/⚡ [BOT] Zenitsu-Peony
│   └── style/⚡ [Zenitsu] Thunder Glow.css
├── hypr/UserConfigs/
│   ├── UserDecorations.conf            ← Window styling
│   ├── UserAnimations.conf             ← Border animation
│   └── Startup_Apps.conf               ← Icon theme
└── swaync/
    ├── config.json                     ← Notification positioning
    └── style.css                       ← Notification styling
```

## 📜 Changelog

### v3.0 - Floating Lightning Edition (Oct 8, 2024)
- ✅ **Floating Waybar** - Centered 1800px bar with 60px margins
- ✅ **Animated Lightning Borders** - 4-color crackling gradient
- ✅ **Transparent Windows** - 85%/75% opacity with 15px rounding
- ✅ **Integrated Swaync** - Positioned above Waybar with matching style
- ✅ **Font Fixes** - Proper Nerd Font rendering for all icons
- ✅ **Icon Theme** - Tela Yellow matching Zenitsu's color scheme
- ✅ **System Verification** - Automated health check script
- ✅ **Comprehensive Docs** - Updated all documentation

### v2.0 - GNOME Style Edition (Oct 6, 2024)
- ✅ GNOME Shell style layout (top bar, clock left)
- ✅ More compact horizontally (-20% padding)
- ✅ Fixed click spark visibility
- ✅ Cleaned project structure
- ✅ Comprehensive documentation

### v1.0 - Initial Release
- ⚡ Electrical effects system
- ⚡ Thunder Glow CSS
- ⚡ Icon system
- ⚡ Sound effects

## 🎯 Credits

- **Inspiration**: Zenitsu Agatsuma (Demon Slayer)
- **Base**: JaKooLit's Hyprland dotfiles
- **Design**: Krautt's Peony waybar
- **Fonts**: JetBrainsMono Nerd Font

## 📝 License

Personal customization project. Free to use and modify.

---

⚡⚡⚡ **Thunder Breathing: First Form - Thunderclap and Flash!** ⚡⚡⚡

*Your desktop now channels the power of Thunder Breathing*
