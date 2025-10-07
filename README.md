# ⚡ Zenitsu Theme for Hyprland/Waybar

![Theme Status](https://img.shields.io/badge/Status-Complete-success)
![Version](https://img.shields.io/badge/Version-2.0-blue)
![Style](https://img.shields.io/badge/Style-GNOME-orange)

Thunder Breathing themed Waybar configuration with intense electrical effects, inspired by Zenitsu Agatsuma from Demon Slayer.

## ✨ Features

- 🌟 **Intense Electrical Glow** - Mega pulse animation around waybar
- ⚡ **Interactive Effects** - Lightning on hover, spark on click
- 🎨 **Thunder Color Scheme** - Orange & Yellow electrical palette
- 🔧 **GNOME Style Layout** - Clean top bar with clock left, system right
- 📦 **Compact Design** - Optimized horizontal spacing
- 🔊 **Sound Effects** - Optional electrical spark sounds

## 🚀 Quick Start

```bash
cd ~/Project_Zenitsu_Theme
./launch_zenitsu_gnome_style.sh
```

## 📋 Requirements

- Hyprland (Wayland compositor)
- Waybar (Status bar)
- Nerd Fonts (For icons)
  ```bash
  sudo pacman -S ttf-jetbrains-mono-nerd
  fc-cache -fv
  ```

## 📖 Documentation

- **[GENERAL_UPDATE.md](GENERAL_UPDATE.md)** - Complete project documentation
- **[TROUBLESHOOTING_GUIDE.txt](TROUBLESHOOTING_GUIDE.txt)** - Problem solving guide
- **[ZENITSU_GNOME_STYLE.txt](ZENITSU_GNOME_STYLE.txt)** - GNOME layout details
- **[EMPEZAR_AQUI.txt](EMPEZAR_AQUI.txt)** - Quick start (Spanish)

## 🎨 Preview

### Layout (GNOME Style)
```
┌─────────────────────────────────────────────────────────┐
│ ⚡ Clock                              🔊 📶 🔋 📱     │
└─────────────────────────────────────────────────────────┘
```

### Effects
- **Mega Electric Pulse**: 20-60px glowing aura (constant)
- **Electric Border Pulse**: Color-changing borders (1.5s animation)
- **Lightning Crackle**: Intense glow on hover (0.5s)
- **Thunder Strike**: Super glow on active workspace (1s)
- **Spark Flash**: Yellow flash on click (200ms)

### Colors
- Haori Orange: `#FFA237`
- Thunder Yellow: `#FFE66D`
- Vibrant Yellow: `#f9ff5e`
- Intense Yellow: `#ffff00`

## 🛠️ Essential Scripts

| Script | Purpose |
|--------|---------|
| `launch_zenitsu_gnome_style.sh` | Launch theme (main) |
| `apply_electrical_icons.sh` | Apply electrical icons |
| `clean_css_duplicates.sh` | Clean CSS issues |
| `fix_zenitsu_icons.sh` | Fix all issues |
| `electrify_icons_and_sounds.sh` | Full setup with sounds |

## 🔧 Configuration

### Files
- Config: `~/.config/waybar/configs/⚡ [BOT] Zenitsu-Peony`
- Style: `~/.config/waybar/style/⚡ [Zenitsu] Thunder Glow.css`

### Customization

**Make more compact:**
```bash
nano ~/.config/waybar/style/"⚡ [Zenitsu] Thunder Glow.css"
# Change: padding: 2px 8px; to padding: 2px 6px;
```

**Adjust glow intensity:**
```css
/* Find @keyframes mega-electric-pulse */
box-shadow: 0 0 30px 8px rgba(249, 255, 94, 0.8); /* More intense */
```

## 🐛 Troubleshooting

**Icons show as boxes:**
```bash
sudo pacman -S ttf-jetbrains-mono-nerd
fc-cache -fv
pkill waybar && waybar &
```

**Waybar won't start:**
```bash
waybar -l debug  # Check errors
```

**Complete fix:**
```bash
./fix_zenitsu_icons.sh
```

See [TROUBLESHOOTING_GUIDE.txt](TROUBLESHOOTING_GUIDE.txt) for more help.

## 📁 Project Structure

```
Project_Zenitsu_Theme/
├── README.md                      ← Quick overview
├── GENERAL_UPDATE.md              ← Complete documentation
├── launch_zenitsu_gnome_style.sh  ← Main launcher
├── apply_electrical_icons.sh      ← Icon setup
├── fix_zenitsu_icons.sh           ← Fix utility
├── sounds/                        ← Sound effects
└── archive_*/                     ← Old files
```

## 📜 Changelog

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
