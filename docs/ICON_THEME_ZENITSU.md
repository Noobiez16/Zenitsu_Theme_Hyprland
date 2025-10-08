# ⚡ Zenitsu Icon Theme Implementation Guide

## 🎯 Objective
Replace default system icons with a cohesive GTK icon theme matching the Zenitsu color palette (yellow, orange, black) for all applications across the Hyprland environment.

---

## 📋 Icon Theme Selection

### **Chosen: Tela-circle-icon-theme-orange**

#### Justification:
✅ **Perfect Color Match**: Orange variant (#FFA237) matches Zenitsu's haori orange  
✅ **Official Repository**: Available in Arch Linux `extra` repository  
✅ **Modern Design**: Flat, circular icons with excellent visibility  
✅ **Comprehensive Coverage**: Complete icon set for all applications  
✅ **Active Maintenance**: Recently updated (2025_02_10-1)  
✅ **Dark Variant**: Includes dark version for consistency  
✅ **No Dependencies**: Standard installation, no AUR needed  

#### Alternative Option:
- **tela-circle-icon-theme-yellow**: Thunder yellow emphasis variant
- **papirus-icon-theme**: Customizable with folder colors

#### Comparison with Alternatives:

| Theme | Color Match | Availability | Completeness | Maintenance |
|-------|-------------|--------------|--------------|-------------|
| **Tela-circle-orange** | ⭐⭐⭐⭐⭐ | ✅ Official | ⭐⭐⭐⭐⭐ | ✅ Active |
| Tela-circle-yellow | ⭐⭐⭐⭐ | ✅ Official | ⭐⭐⭐⭐⭐ | ✅ Active |
| Papirus | ⭐⭐⭐ | ✅ Official | ⭐⭐⭐⭐⭐ | ✅ Active |
| Nordzy | ⭐⭐ | ❌ AUR | ⭐⭐⭐⭐ | ~ Moderate |
| Flatery | ⭐⭐ | ❌ Manual | ⭐⭐⭐ | ~ Slow |

---

## 🔧 Installation Steps

### **Method 1: Automated Script (Recommended)**

#### Step 1: Install Icon Theme
```bash
cd ~/Project_Zenitsu_Theme
./install_zenitsu_icons.sh
```

This script will:
- Install `tela-circle-icon-theme-orange` from Arch repos
- Verify installation
- Update icon cache

#### Step 2: Configure Theme
```bash
./configure_zenitsu_icons.sh
```

This script will:
- Backup existing configurations
- Configure GTK-2.0, GTK-3.0, GTK-4.0
- Apply gsettings system-wide
- Configure Qt applications
- Add Hyprland startup commands
- Ensure persistence across reboots

---

### **Method 2: Manual Installation (Step-by-Step)**

#### Step 1: Install from Repository
```bash
# Install the icon theme
sudo pacman -S tela-circle-icon-theme-orange

# Verify installation
pacman -Q tela-circle-icon-theme-orange

# Check installed icons
ls -la /usr/share/icons/Tela-circle-orange*
```

**Expected Output:**
```
tela-circle-icon-theme-orange 2025_02_10-1
/usr/share/icons/Tela-circle-orange
/usr/share/icons/Tela-circle-orange-dark
```

#### Step 2: Update Icon Cache
```bash
# Update icon cache for both variants
sudo gtk-update-icon-cache -f /usr/share/icons/Tela-circle-orange
sudo gtk-update-icon-cache -f /usr/share/icons/Tela-circle-orange-dark
```

#### Step 3: Configure GTK-3.0
```bash
# Backup existing config
cp ~/.config/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini.backup

# Create/edit GTK-3.0 settings
mkdir -p ~/.config/gtk-3.0
nano ~/.config/gtk-3.0/settings.ini
```

**Content:**
```ini
[Settings]
gtk-theme-name=Breeze-Dark
gtk-icon-theme-name=Tela-circle-orange-dark
gtk-font-name=JetBrainsMono Nerd Font 11
gtk-cursor-theme-name=breeze_cursors
gtk-cursor-theme-size=24
gtk-toolbar-style=GTK_TOOLBAR_BOTH_HORIZ
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-button-images=0
gtk-menu-images=0
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=0
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle=hintslight
gtk-xft-rgba=rgb
```

#### Step 4: Configure GTK-4.0
```bash
# Create GTK-4.0 directory and config
mkdir -p ~/.config/gtk-4.0
nano ~/.config/gtk-4.0/settings.ini
```

**Content:**
```ini
[Settings]
gtk-theme-name=Breeze-Dark
gtk-icon-theme-name=Tela-circle-orange-dark
gtk-font-name=JetBrainsMono Nerd Font 11
gtk-cursor-theme-name=breeze_cursors
gtk-cursor-theme-size=24
```

#### Step 5: Configure GTK-2.0
```bash
# Backup and create GTK-2.0 config
cp ~/.gtkrc-2.0 ~/.gtkrc-2.0.backup
nano ~/.gtkrc-2.0
```

**Content:**
```
gtk-theme-name="Breeze-Dark"
gtk-icon-theme-name="Tela-circle-orange-dark"
gtk-font-name="JetBrainsMono Nerd Font 11"
gtk-cursor-theme-name="breeze_cursors"
gtk-cursor-theme-size=24
```

#### Step 6: Apply with gsettings (Immediate Effect)
```bash
# Apply icon theme
gsettings set org.gnome.desktop.interface icon-theme "Tela-circle-orange-dark"

# Apply GTK theme
gsettings set org.gnome.desktop.interface gtk-theme "Breeze-Dark"

# Apply cursor theme
gsettings set org.gnome.desktop.interface cursor-theme "breeze_cursors"

# Apply font
gsettings set org.gnome.desktop.interface font-name "JetBrainsMono Nerd Font 11"

# Verify settings
gsettings get org.gnome.desktop.interface icon-theme
```

#### Step 7: Add to Hyprland Startup (Persistence)
```bash
# Edit Hyprland startup configuration
nano ~/.config/hypr/UserConfigs/Startup_Apps.conf
```

**Add these lines at the end:**
```bash
# ⚡ Zenitsu Icon Theme - Apply on startup
exec-once = gsettings set org.gnome.desktop.interface icon-theme 'Tela-circle-orange-dark'
exec-once = gsettings set org.gnome.desktop.interface gtk-theme 'Breeze-Dark'
exec-once = gsettings set org.gnome.desktop.interface cursor-theme 'breeze_cursors'
```

#### Step 8: Configure Qt Applications (Optional)
```bash
# Create Qt5ct config directory
mkdir -p ~/.config/qt5ct

# Create Qt5ct configuration
nano ~/.config/qt5ct/qt5ct.conf
```

**Content:**
```ini
[Appearance]
icon_theme=Tela-circle-orange-dark
style=Breeze
```

---

## 🔄 Application & Persistence Strategy

### **Multi-Layer Approach for Maximum Compatibility**

This implementation uses a comprehensive, redundant approach to ensure the icon theme persists across all scenarios:

#### Layer 1: Configuration Files
- **GTK-2.0**: `~/.gtkrc-2.0`
- **GTK-3.0**: `~/.config/gtk-3.0/settings.ini`
- **GTK-4.0**: `~/.config/gtk-4.0/settings.ini`
- **Qt5**: `~/.config/qt5ct/qt5ct.conf`

**Purpose**: Provides default settings for new application instances

#### Layer 2: gsettings (GSettings/DConf)
```bash
gsettings set org.gnome.desktop.interface icon-theme "Tela-circle-orange-dark"
```

**Purpose**: Applies to currently running applications and provides system-wide defaults

#### Layer 3: Hyprland Startup Commands
```bash
exec-once = gsettings set org.gnome.desktop.interface icon-theme 'Tela-circle-orange-dark'
```

**Purpose**: Ensures settings are reapplied after every login/reboot

### **Why This Multi-Layer Approach?**

Different applications read settings from different sources:
- **GTK-3/4 apps**: Check gsettings first, then fall back to config files
- **GTK-2 apps**: Only read `~/.gtkrc-2.0`
- **Qt apps**: Use Qt configuration or fall back to GTK theme
- **Electron apps**: May use any of the above

By configuring all layers, we ensure 100% coverage and persistence.

---

## 🎨 Icon Theme Variants

The Tela-circle-orange theme includes two variants:

### **Tela-circle-orange-dark** (Recommended)
- Dark themed icons
- Better contrast with Zenitsu dark backgrounds
- Matches Waybar dark theme
- Location: `/usr/share/icons/Tela-circle-orange-dark`

### **Tela-circle-orange** (Light variant)
- Light themed icons
- For light backgrounds (if needed)
- Location: `/usr/share/icons/Tela-circle-orange`

---

## ✅ Verification

### Check Installed Theme:
```bash
# Verify package installation
pacman -Q tela-circle-icon-theme-orange

# Check icon directories
ls -la /usr/share/icons/Tela-circle-orange*

# Verify current icon theme
gsettings get org.gnome.desktop.interface icon-theme
```

### Check Configuration Files:
```bash
# GTK-3.0
cat ~/.config/gtk-3.0/settings.ini | grep icon

# GTK-2.0
cat ~/.gtkrc-2.0 | grep icon

# Hyprland startup
grep "icon-theme" ~/.config/hypr/UserConfigs/Startup_Apps.conf
```

### Test with Applications:
```bash
# Open file manager
thunar &

# Open system settings
xfce4-settings-manager &

# Check icons in running applications
```

---

## 🐛 Troubleshooting

### Icons not appearing?
```bash
# Rebuild icon cache
sudo gtk-update-icon-cache -f /usr/share/icons/Tela-circle-orange-dark

# Restart GTK applications
pkill thunar && thunar &
```

### Some apps still show old icons?
```bash
# Re-apply gsettings
gsettings set org.gnome.desktop.interface icon-theme "Tela-circle-orange-dark"

# Restart the specific application
```

### Icons not persisting after reboot?
```bash
# Verify Hyprland startup config
grep "gsettings.*icon-theme" ~/.config/hypr/UserConfigs/Startup_Apps.conf

# If missing, add manually:
echo 'exec-once = gsettings set org.gnome.desktop.interface icon-theme "Tela-circle-orange-dark"' >> ~/.config/hypr/UserConfigs/Startup_Apps.conf
```

### Qt applications not using icons?
```bash
# Set Qt to use GTK icons
export QT_QPA_PLATFORMTHEME=gtk2

# Add to Hyprland config:
echo 'env = QT_QPA_PLATFORMTHEME,gtk2' >> ~/.config/hypr/hyprland.conf
```

---

## 📁 File Locations

```
Configuration Files:
├── ~/.gtkrc-2.0                               (GTK-2.0 settings)
├── ~/.config/gtk-3.0/settings.ini             (GTK-3.0 settings)
├── ~/.config/gtk-4.0/settings.ini             (GTK-4.0 settings)
├── ~/.config/qt5ct/qt5ct.conf                 (Qt5 settings)
└── ~/.config/hypr/UserConfigs/Startup_Apps.conf (Persistence)

Icon Theme Files:
├── /usr/share/icons/Tela-circle-orange/       (Light variant)
└── /usr/share/icons/Tela-circle-orange-dark/  (Dark variant)

Installation Scripts:
├── ~/Project_Zenitsu_Theme/install_zenitsu_icons.sh
└── ~/Project_Zenitsu_Theme/configure_zenitsu_icons.sh

Backups:
├── ~/.config/gtk-3.0/settings.ini.backup_*
├── ~/.gtkrc-2.0.backup_*
└── ~/.config/hypr/UserConfigs/Startup_Apps.conf.backup_*
```

---

## 🎨 Color Palette Match

| Element | Color | Hex | Match |
|---------|-------|-----|-------|
| Folder Icons | Orange | #FFA237 | ⚡ Perfect |
| File Icons | Orange/Yellow | #FFE66D | ⚡ Perfect |
| App Icons | Orange Accent | #FFA237 | ⚡ Perfect |
| System Icons | Orange/White | Various | ⚡ Good |

---

## 📝 Notes

- **Icon theme name**: `Tela-circle-orange-dark` (note: lowercase with hyphens)
- **Package name**: `tela-circle-icon-theme-orange` (note: lowercase)
- **Both variants installed**: Installing the package provides both dark and light versions
- **No additional dependencies**: Theme is self-contained
- **Automatic updates**: Will update with system updates via pacman
- **Fallback icons**: Uses Adwaita as fallback for missing icons

---

## 🔄 Alternative Installation (GitHub Method)

If you prefer the latest version directly from GitHub:

```bash
# Clone the repository
git clone https://github.com/vinceliuice/Tela-circle-icon-theme.git
cd Tela-circle-icon-theme

# Install orange variant
./install.sh -a -c orange

# Verify installation
ls ~/.local/share/icons/ | grep Tela-circle-orange
```

**Note**: The pacman method is recommended for easier updates and system integration.

---

## ✅ Completion Checklist

- [ ] Icon theme installed from repository
- [ ] GTK-2.0 configured (`~/.gtkrc-2.0`)
- [ ] GTK-3.0 configured (`~/.config/gtk-3.0/settings.ini`)
- [ ] GTK-4.0 configured (`~/.config/gtk-4.0/settings.ini`)
- [ ] gsettings applied (immediate effect)
- [ ] Hyprland startup commands added (persistence)
- [ ] Qt applications configured (optional)
- [ ] Icon cache updated
- [ ] GTK applications restarted
- [ ] Icons visible in file manager
- [ ] Icons persist after reboot

---

**Implementation Date**: October 7, 2025  
**Icon Theme**: Tela-circle-orange-dark  
**Version**: 2025_02_10-1  
**Status**: Ready for Installation

⚡ **THUNDER ICONS INCOMING!** ⚡
