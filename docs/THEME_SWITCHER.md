# ⚡ Waybar Theme Switcher - Zenitsu Theme

## Overview
The Waybar Theme Switcher provides a user-friendly way to switch between different Waybar themes using `rofi`.

## Script Location
`~/Project_Zenitsu_Theme/Scripts/waybar-themer.sh`

## Features

- 🎨 **Dynamic Theme Detection** - Automatically finds all themes in `~/.config/waybar/themes/`
- 🖱️ **Interactive Selection** - Uses rofi for beautiful theme selection interface
- ⚡ **Atomic Updates** - Safely updates symlinks without breaking Waybar
- 🔄 **Automatic Reload** - Reloads Waybar after theme change
- 📢 **Notifications** - Desktop notifications confirm theme changes
- 🛡️ **Error Handling** - Graceful error messages for missing files or directories

## Usage

### Basic Usage
Run the script from terminal:
```bash
~/Project_Zenitsu_Theme/Scripts/waybar-themer.sh
```

### Keyboard Shortcut (Recommended)
Add to your Hyprland keybinds (`~/.config/hypr/UserConfigs/UserKeybinds.conf`):
```conf
bind = $mainMod SHIFT, T, exec, ~/Project_Zenitsu_Theme/Scripts/waybar-themer.sh
```

Then press `Super+Shift+T` to open the theme switcher.

### Rofi Launcher
Add to your application launcher or rofi menu configuration.

## Available Themes

### zenitsu-dark (Default)
**Style**: Dark theme with Thunder Glow effects
**Features**:
- Semi-transparent dark background (85% opacity)
- Electric yellow and orange accents
- Animated lightning effects on hover
- Nerd Font icon rendering
- Floating design (1800px wide)

**Best for**: Evening/night use, reducing eye strain

### zenitsu-light
**Style**: Light theme for daytime use
**Features**:
- Bright white background (90% opacity)
- Same Zenitsu color accents
- Optimized for daylight visibility
- Reduced glow effects
- Same floating design

**Best for**: Daytime use, bright environments

## How It Works

1. **Theme Detection**: Script scans `~/.config/waybar/themes/` for subdirectories
2. **Selection**: Presents theme list in rofi menu
3. **Validation**: Checks if selected theme has required files (`config.jsonc`, `style.css`)
4. **Symlink Update**: 
   - Removes old symlinks: `~/.config/waybar/config.jsonc` and `style.css`
   - Creates new symlinks pointing to selected theme
5. **Reload**: Sends SIGUSR2 to Waybar process to reload configuration
6. **Notification**: Shows desktop notification confirming theme change

## Theme Structure

Each theme is a directory under `~/.config/waybar/themes/` containing:
```
theme-name/
├── config.jsonc    (Waybar configuration)
└── style.css       (Waybar styling)
```

## Creating New Themes

### Method 1: Manual Creation
1. Create theme directory:
   ```bash
   mkdir -p ~/.config/waybar/themes/my-theme
   ```

2. Add required files:
   ```bash
   # Copy from existing theme as template
   cp ~/.config/waybar/themes/zenitsu-dark/config.jsonc \
      ~/.config/waybar/themes/my-theme/
   cp ~/.config/waybar/themes/zenitsu-dark/style.css \
      ~/.config/waybar/themes/my-theme/
   ```

3. Edit files to customize your theme

4. Theme will automatically appear in switcher

### Method 2: Copy Existing Theme
```bash
# Duplicate an existing theme
cp -r ~/.config/waybar/themes/zenitsu-dark \
      ~/.config/waybar/themes/my-custom-theme

# Edit the copied files
nano ~/.config/waybar/themes/my-custom-theme/style.css
```

## Troubleshooting

### Theme Switcher Doesn't Open
**Problem**: Nothing happens when running the script

**Solutions**:
1. Check if rofi is installed:
   ```bash
   which rofi
   # If not found: sudo pacman -S rofi
   ```

2. Verify script is executable:
   ```bash
   chmod +x ~/Project_Zenitsu_Theme/Scripts/waybar-themer.sh
   ```

3. Run from terminal to see errors:
   ```bash
   ~/Project_Zenitsu_Theme/Scripts/waybar-themer.sh
   ```

### Theme Change Doesn't Apply
**Problem**: Selected theme but Waybar looks the same

**Solutions**:
1. Check if Waybar reloaded:
   ```bash
   pgrep waybar
   # If not running, start it:
   waybar &
   ```

2. Verify symlinks:
   ```bash
   ls -la ~/.config/waybar/*.{jsonc,css}
   ```

3. Manually reload Waybar:
   ```bash
   pkill waybar && waybar &
   ```

### "Theme Error: Missing Required Files"
**Problem**: Theme selected but files missing

**Solution**: Ensure theme directory has both files:
```bash
ls ~/.config/waybar/themes/theme-name/
# Should show: config.jsonc  style.css
```

### No Themes Found
**Problem**: Rofi shows empty list

**Solution**: Check themes directory:
```bash
ls ~/.config/waybar/themes/
# Should show at least one theme directory
```

## Script Details

### Dependencies
- `bash` - Shell interpreter
- `rofi` - Menu/launcher application
- `find` - File search utility (standard)
- `notify-send` - Desktop notifications (libnotify)

### Exit Codes
- `0` - Success (theme changed or user cancelled)
- `1` - Error (theme directory missing, files missing, etc.)

### Signals
- `SIGUSR2` - Sent to Waybar for reload without restart

## Integration Examples

### Waybar Module (Custom Button)
Add to your Waybar config:
```json
"custom/theme-switcher": {
    "format": " ",
    "tooltip": true,
    "tooltip-format": "Change Waybar Theme",
    "on-click": "~/Project_Zenitsu_Theme/Scripts/waybar-themer.sh"
}
```

### i3/Sway Config
```conf
bindsym $mod+Shift+t exec ~/Project_Zenitsu_Theme/Scripts/waybar-themer.sh
```

### Application Menu
Create desktop entry at `~/.local/share/applications/waybar-themer.desktop`:
```ini
[Desktop Entry]
Name=Waybar Theme Switcher
Comment=Change Waybar theme
Exec=/home/USERNAME/Project_Zenitsu_Theme/Scripts/waybar-themer.sh
Icon=preferences-desktop-theme
Terminal=false
Type=Application
Categories=Settings;DesktopSettings;
```

## Theme Development Tips

### Color Schemes
- Use `@define-color` for consistent theming
- Keep accent colors consistent across themes
- Test with different wallpapers

### Transparency
- Dark themes: 80-90% opacity
- Light themes: 85-95% opacity
- Consider visibility on different backgrounds

### Testing
```bash
# Quick test of theme
ln -sf ~/.config/waybar/themes/test-theme/config.jsonc ~/.config/waybar/config.jsonc
ln -sf ~/.config/waybar/themes/test-theme/style.css ~/.config/waybar/style.css
pkill -SIGUSR2 waybar
```

## Future Enhancements

Potential features for future versions:
- [ ] Theme preview before applying
- [ ] Save last used theme preference
- [ ] Theme import/export functionality
- [ ] Theme repository/sharing
- [ ] Automatic theme switching based on time of day
- [ ] Integration with system color schemes

## Credits

- **Zenitsu Theme**: Inspired by Zenitsu Agatsuma (Demon Slayer)
- **Theme Switcher**: Custom implementation for modular theme management
- **Rofi**: Application launcher by Dave Davenport

---

⚡⚡⚡ **Thunder Breathing: Theme Mastery Form!** ⚡⚡⚡
