# Waybar Theme Structure - Zenitsu Theme

## Overview
The Waybar configuration has been refactored into a modular, theme-based structure to enable easy theme switching.

## Directory Structure

```
~/.config/waybar/
├── config.jsonc -> themes/zenitsu-dark/config.jsonc  (symlink)
├── style.css -> themes/zenitsu-dark/style.css        (symlink)
├── themes/
│   └── zenitsu-dark/
│       ├── config.jsonc    (Floating Waybar configuration)
│       └── style.css       (Thunder Glow styling)
├── configs/                (Legacy config files - preserved)
│   └── ⚡ [BOT] Zenitsu-Peony
├── style/                  (Legacy style files - preserved)
│   └── ⚡ [Zenitsu] Thunder Glow.css
├── Modules*                (Module definition files)
├── ZenitsuModules*         (Zenitsu-specific modules)
└── ...                     (Other configuration files)
```

## Theme: zenitsu-dark

### Configuration (config.jsonc)
- **Width**: 1800px (floating)
- **Position**: Bottom center
- **Margins**: 60px left/right, 4px bottom
- **Height**: 36px
- **Modules**: Workspaces, Clock, Hardware Info, Audio, Network, Notifications

### Styling (style.css)
- **Theme**: Thunder Glow
- **Transparency**: 85% opacity (alpha)
- **Border-radius**: 15px (rounded corners)
- **Colors**: Zenitsu Yellow (#F7DC6F), Haori Orange (#F39C12)
- **Font**: FiraCode Nerd Font, Symbols Nerd Font Mono
- **Effects**: Electric glow, hover animations, lightning effects

## Active Theme

The active theme is determined by symlinks in the root waybar directory:
- `config.jsonc` -> `themes/zenitsu-dark/config.jsonc`
- `style.css` -> `themes/zenitsu-dark/style.css`

## How It Works

1. **Waybar reads**: `~/.config/waybar/config.jsonc` and `~/.config/waybar/style.css`
2. **Symlinks point to**: Theme files in `themes/zenitsu-dark/`
3. **To switch themes**: Change symlinks to point to different theme directory

## Benefits of This Structure

1. **Modularity**: Each theme is self-contained in its own directory
2. **Easy Switching**: Change symlinks to switch themes instantly
3. **Preservation**: Original files remain in `configs/` and `style/` directories
4. **Theme Switcher Ready**: Structure prepared for automated theme switching script
5. **Clean Organization**: Clear separation between themes and configuration

## Future Themes

To add new themes:
1. Create a new directory in `themes/` (e.g., `themes/zenitsu-light/`)
2. Add `config.jsonc` and `style.css` to the new theme directory
3. Switch themes by updating symlinks

## Theme Switcher Script (Coming Soon)

A theme switcher script will:
- List available themes in `themes/` directory
- Allow interactive theme selection
- Update symlinks automatically
- Reload Waybar with new theme
- Save theme preference

## Backup Strategy

All original files are preserved:
- `configs/⚡ [BOT] Zenitsu-Peony` - Original config
- `style/⚡ [Zenitsu] Thunder Glow.css` - Original style
- `.backup004` files in both directories
- Theme directory contains working copies

## Migration Complete

✅ Waybar refactored to theme-based structure
✅ Active theme: zenitsu-dark
✅ Original files preserved
✅ Symlinks functional
✅ Waybar tested and working

---

Next Step: Create theme switcher script to automate theme changes.
