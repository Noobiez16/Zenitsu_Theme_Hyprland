# ⚡ Zenitsu Theme - Icon Theme Installation Guide

## Objective

Extend the Zenitsu aesthetic beyond Waybar by installing and applying the Tela-yellow-dark icon theme system-wide for all GTK applications.

---

## Overview

This guide provides two installation methods for applying a thematically appropriate icon theme that matches the Zenitsu project's yellow/orange color palette.

### Why Tela Icon Theme?

- **Color Match:** Yellow variant perfectly matches Zenitsu palette
- **Modern Design:** Clean, professional icon set
- **Comprehensive:** Covers all application categories
- **Active Development:** Regular updates and maintenance
- **Easy Installation:** Automated installer script provided

---

## Prerequisites

### System Requirements
- **OS:** Arch Linux
- **Compositor:** Hyprland (Wayland)
- **Dependencies:** git, nwg-look

### Zenitsu Theme Status
Ensure your Zenitsu Waybar theme is already installed and working.

---

## Installation Methods

### Method 1: Automated Installation (Recommended)

The automated script handles everything for you.

#### Run the Installation Script

```bash
~/Project_Zenitsu_Theme/Scripts/install_zenitsu_icons.sh
```

**What the script does:**
1. Installs nwg-look if not present
2. Clones Tela-icon-theme repository
3. Installs yellow variant to `~/.local/share/icons/`
4. Configures Hyprland for persistence
5. Applies theme immediately via gsettings
6. Cleans up temporary files

**Expected output:**
```
⚡⚡⚡ ZENITSU ICON THEME INSTALLER ⚡⚡⚡

Step 1: Installing Dependencies
✓ nwg-look installed

Step 2: Installing Tela Icon Theme (Yellow Variant)
✓ Tela-yellow-dark icons installed

Step 3: Configuring Hyprland for Icon Theme Persistence
✓ Added icon theme persistence to hyprland.conf

Step 4: Applying Icon Theme
✓ Icon theme applied via gsettings

⚡ INSTALLATION COMPLETE! ⚡
```

---

### Method 2: Manual Installation

If you prefer manual control or need to troubleshoot.

#### Step 1: Install Dependencies

```bash
sudo pacman -S git nwg-look --noconfirm
```

**Packages:**
- `git` - Version control system (for cloning repository)
- `nwg-look` - GTK theme switcher for Wayland

#### Step 2: Clone and Install Icon Theme

```bash
cd /tmp
git clone https://github.com/vinceliuice/Tela-icon-theme.git
cd Tela-icon-theme
./install.sh -c yellow
cd ..
```

**Installation details:**
- **Repository:** vinceliuice/Tela-icon-theme
- **Variant:** Yellow (`-c yellow` flag)
- **Install location:** `~/.local/share/icons/Tela-yellow-dark`
- **Scope:** Local user (no sudo required)

**Available variants:**
- `-c standard` (default blue)
- `-c yellow` ← **We use this**
- `-c orange`
- `-c red`
- `-c green`
- `-c grey`
- `-c purple`
- `-c pink`

#### Step 3: Apply Icon Theme with nwg-look

```bash
nwg-look
```

**In nwg-look GUI:**
1. Navigate to **"Icons"** tab
2. Find and select **"Tela-yellow-dark"** from the list
3. Click **"Apply"** button
4. Close nwg-look

**What this does:**
- Generates GTK2 config: `~/.gtkrc-2.0`
- Generates GTK3 config: `~/.config/gtk-3.0/settings.ini`
- Generates GTK4 config: `~/.config/gtk-4.0/settings.ini`

#### Step 4: Configure Hyprland Persistence

Add this line to `~/.config/hypr/hyprland.conf`:

```bash
# ⚡ Zenitsu Theme - Icon Theme Persistence
exec-once = gsettings set org.gnome.desktop.interface icon-theme 'Tela-yellow-dark'
```

**Why this is needed:**
- Ensures theme persists across reboots
- Provides fallback mechanism for maximum compatibility
- Works with all GTK applications

**How to add:**

**Option A: Append to file**
```bash
echo "" >> ~/.config/hypr/hyprland.conf
echo "# ⚡ Zenitsu Theme - Icon Theme Persistence" >> ~/.config/hypr/hyprland.conf
echo "exec-once = gsettings set org.gnome.desktop.interface icon-theme 'Tela-yellow-dark'" >> ~/.config/hypr/hyprland.conf
```

**Option B: Edit manually**
```bash
nano ~/.config/hypr/hyprland.conf
# Add the exec-once line in your theming section
```

#### Step 5: Apply Theme Immediately

```bash
gsettings set org.gnome.desktop.interface icon-theme 'Tela-yellow-dark'
```

This applies the theme without waiting for reboot.

---

## Verification

### Check Icon Theme is Installed

```bash
ls ~/.local/share/icons/ | grep -i tela
```

**Expected output:**
```
Tela-yellow
Tela-yellow-dark
```

### Check Theme is Active

```bash
gsettings get org.gnome.desktop.interface icon-theme
```

**Expected output:**
```
'Tela-yellow-dark'
```

### Check GTK Configs

```bash
cat ~/.config/gtk-3.0/settings.ini | grep icon-theme
```

**Expected output:**
```
gtk-icon-theme-name=Tela-yellow-dark
```

### Check Hyprland Config

```bash
grep "icon-theme" ~/.config/hypr/hyprland.conf
```

**Expected output:**
```
exec-once = gsettings set org.gnome.desktop.interface icon-theme 'Tela-yellow-dark'
```

### Visual Verification

1. Open any GTK application (e.g., `nautilus`, `gedit`)
2. Icons should appear in yellow/orange tones
3. Check file manager folder icons - should be yellow
4. Check application menu icons - should match theme

---

## Architecture Details

### Icon Theme Structure

```
~/.local/share/icons/Tela-yellow-dark/
├── actions/        # Action icons (copy, paste, etc.)
├── apps/           # Application icons
├── categories/     # Category icons
├── devices/        # Device icons
├── emblems/        # Badge/emblem icons
├── mimetypes/      # File type icons
├── places/         # Folder and location icons
├── status/         # Status indicator icons
└── index.theme     # Theme metadata
```

### GTK Configuration Hierarchy

**Priority order (highest to lowest):**
1. **gsettings** (GNOME desktop settings)
2. **GTK4** (`~/.config/gtk-4.0/settings.ini`)
3. **GTK3** (`~/.config/gtk-3.0/settings.ini`)
4. **GTK2** (`~/.gtkrc-2.0`)

### Persistence Strategy

**Multi-layer approach for maximum reliability:**

1. **gsettings via exec-once**
   - Applied on Hyprland startup
   - Ensures consistency across sessions
   - Works with GNOME-based apps

2. **nwg-look generated configs**
   - Creates proper GTK config files
   - Respected by all GTK versions
   - No manual editing required

3. **Icon theme files**
   - Locally installed in user directory
   - Survives system updates
   - No root permissions needed

---

## Theme Matching

### Zenitsu Color Palette Integration

| Zenitsu Color | Hex Code | Tela Yellow Equivalent |
|---------------|----------|------------------------|
| Zenitsu Yellow | #F7DC6F | Primary folder color |
| Haori Orange | #F39C12 | Accent color |
| Lightning Blue | #5DADE2 | Selection highlights |

### Visual Consistency

**Waybar modules:**
- Clock, CPU, Memory, etc. → Yellow glow effects

**System icons:**
- Folders → Yellow/orange tones
- Applications → Complementary colors
- Status indicators → Matching palette

**Result:** Seamless visual experience from status bar to applications

---

## Troubleshooting

### Icons Not Changing

**Issue:** GTK apps still showing old icons

**Solutions:**

1. **Restart GTK applications**
   ```bash
   # Close and reopen the application
   ```

2. **Verify theme is installed**
   ```bash
   ls ~/.local/share/icons/Tela-yellow-dark
   ```

3. **Re-apply with nwg-look**
   ```bash
   nwg-look
   # Select Tela-yellow-dark and click Apply
   ```

4. **Check gsettings**
   ```bash
   gsettings set org.gnome.desktop.interface icon-theme 'Tela-yellow-dark'
   ```

### nwg-look Not Found

**Issue:** Command not found after installation

**Solution:**
```bash
# Verify installation
pacman -Q nwg-look

# If not installed
sudo pacman -S nwg-look --noconfirm

# Refresh shell
hash -r
```

### Theme Not Persisting After Reboot

**Issue:** Icons revert to default after restart

**Solution:**

1. **Check Hyprland config**
   ```bash
   grep "icon-theme" ~/.config/hypr/hyprland.conf
   ```

2. **If missing, add the exec-once line**
   ```bash
   echo "exec-once = gsettings set org.gnome.desktop.interface icon-theme 'Tela-yellow-dark'" >> ~/.config/hypr/hyprland.conf
   ```

3. **Verify GTK configs exist**
   ```bash
   cat ~/.config/gtk-3.0/settings.ini | grep icon-theme
   ```

### Some Apps Don't Use Theme

**Issue:** Specific applications ignore icon theme

**Possible causes:**
- App uses hardcoded icons
- App uses custom icon theme
- App is Flatpak with different config

**Solutions:**

**For Flatpak apps:**
```bash
flatpak override --user --env=GTK_THEME=Tela-yellow-dark
```

**For Qt apps:**
Install qt5ct/qt6ct for Qt theme matching:
```bash
sudo pacman -S qt5ct qt6ct
```

---

## Customization

### Using Different Tela Variant

If you prefer another color:

```bash
cd /tmp/Tela-icon-theme
./install.sh -c [color]
```

**Available colors:**
- `standard` (blue)
- `orange`
- `red`
- `green`
- `grey`
- `purple`
- `pink`

Then update Hyprland config and apply with nwg-look.

### Installing Additional Icon Sizes

Tela supports various icon sizes:

```bash
./install.sh -c yellow -s [size]
```

**Sizes:**
- `16` - Extra small
- `22` - Small
- `24` - Standard (default)
- `32` - Large

### Installing for All Users

System-wide installation (requires root):

```bash
cd /tmp/Tela-icon-theme
sudo ./install.sh -c yellow -d /usr/share/icons
```

---

## Uninstallation

### Remove Icon Theme

```bash
rm -rf ~/.local/share/icons/Tela-yellow*
```

### Reset to Default

```bash
gsettings set org.gnome.desktop.interface icon-theme 'Adwaita'
```

### Remove from Hyprland Config

```bash
sed -i '/Tela-yellow-dark/d' ~/.config/hypr/hyprland.conf
```

### Reset with nwg-look

```bash
nwg-look
# Select default theme (e.g., Adwaita)
# Click Apply
```

---

## Advanced Configuration

### Creating GTK Config Manually

If nwg-look isn't available, create configs manually:

**GTK3 config** (`~/.config/gtk-3.0/settings.ini`):
```ini
[Settings]
gtk-icon-theme-name=Tela-yellow-dark
gtk-theme-name=Adwaita-dark
gtk-font-name=Sans 10
```

**GTK2 config** (`~/.gtkrc-2.0`):
```
gtk-icon-theme-name="Tela-yellow-dark"
gtk-theme-name="Adwaita-dark"
gtk-font-name="Sans 10"
```

### Using dconf-editor

For GUI-based gsettings management:

```bash
sudo pacman -S dconf-editor
dconf-editor
# Navigate to: org.gnome.desktop.interface.icon-theme
```

---

## Related Documentation

- **ELECTRIC_THEME_DOCUMENTATION.md** - Waybar electric theme
- **HARDWARE_GROUP_REFACTOR.md** - Module grouping
- **COMPLETE_FIX_SUMMARY.md** - Overall project status

---

## Success Metrics

✓ **Icon Theme Installed:** Tela-yellow-dark in ~/.local/share/icons/  
✓ **Theme Applied:** gsettings reports Tela-yellow-dark  
✓ **Configs Generated:** GTK2/3/4 configs created by nwg-look  
✓ **Persistence Configured:** exec-once in hyprland.conf  
✓ **Visual Consistency:** Icons match Zenitsu palette  
✓ **No Manual Editing:** All configs generated automatically  

---

## Backup Information

### Backup Created
- **Backup002** in `~/.config/waybar/Backup_emergency_files/`
- Includes all current Waybar configs
- **Backup001** preserved for reference

### Files in Backup002
- `config_Backup002` - Main Waybar config
- `ZenitsuModules_Backup002` - Module definitions
- `ZenitsuModulesCustom_Backup002` - Custom modules
- `ModulesGroups_Backup002` - Group definitions
- `style_Backup002.css` - Electric theme stylesheet

---

## Conclusion

The Tela-yellow-dark icon theme extends the Zenitsu aesthetic beyond Waybar to create a cohesive, system-wide visual experience. The installation is straightforward, the theme persists reliably, and the yellow/orange color palette perfectly complements the electric Waybar theme.

This multi-layer persistence approach ensures the theme survives reboots, Hyprland restarts, and system updates, providing a consistent Zenitsu-themed desktop environment.

---

⚡ **Thunder Breathing: Icon Form - System-Wide Aesthetic Unity!** ⚡

From Waybar to applications, the Zenitsu theme now electrifies your entire desktop.

---

**Date:** 2025-10-07  
**Version:** 1.0  
**Expert:** Desktop Environment Theming (Wayland)  
**Status:** Ready for Installation  
**Method:** Automated + Manual Options
