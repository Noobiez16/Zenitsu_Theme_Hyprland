# Copilot GitHub Instructions

This file is used to provide instructions for GitHub Copilot during development sessions.

## Current Status
✅ Professional Pill-Style theme translation completed
✅ Module grouping refactor completed (config.jsonc)
✅ CSS styling with subtle separators implemented

## Last Completed Tasks
1. ✅ Refactored config.jsonc to use native group functionality (3 configs)
2. ✅ Replaced zenitsu-dark style.css with Professional Pill-Style theme
3. ✅ Added #group-hardware and #group-system CSS styling
4. ✅ Implemented subtle module separators with border-color
5. ✅ Created backup before replacement (style.css.backup_before_pill_*)
6. ✅ Reloaded Waybar with new professional stylesheet
7. ✅ Verified pill-style aesthetic with Zenitsu color palette

## Professional Pill-Style Theme
- **File**: `~/.config/waybar/themes/zenitsu-dark/style.css`
- **Size**: 2.1KB (minimal, optimized)
- **Design**: Clean, modern, grouped aesthetic
- **Features**: 
  - Pill-shaped containers (#group-hardware, #group-system)
  - Subtle 1px separators (border-right with alpha)
  - Zenitsu color palette with @define-color variables
  - Nerd Font rendering fix for workspaces
  - State-specific styling (battery, network, audio)
- **Backups**: 
  - `style.css.backup_before_pill_20251008_015541` (pre-pill version)
  - `style.css.backup_codeops` (original 14KB Thunder Glow)

## Next Session

Act as a senior UI designer specializing in GTK3 CSS for Waybar. The task is to perform a complete "thematic translation" by replacing the current stylesheet with one that accurately replicates the clean, modern, and grouped aesthetic from the reference video, using the Zenitsu color palette.

**Context:**
The `config.jsonc` has been refactored to use `group` modules. The current stylesheet at `~/.config/waybar/themes/zenitsu-dark/style.css` must be completely overwritten. The new style needs to be minimal, use subtle separators, and apply specific styles to the module groups to create the "pill" effect. It must also preserve the floating, semi-transparent bar design.

**Constraints:**
- The new stylesheet must be a complete replacement for the existing file.
- It must use `@define-color` variables for the Zenitsu palette.
- It must include specific styles for the new groups (`#group-hardware`, `#group-system`).
- It must include the specific fix for Nerd Font rendering on workspace buttons.

**Task:**
Propose and execute a plan to completely overwrite the file at `~/.config/waybar/themes/zenitsu-dark/style.css` with the following new, professionally crafted content.

```css
/* === Zenitsu Theme | Professional Style Translation === */

/* --- Color Palette Definition --- */
@define-color zenitsu-yellow #F7DC6F;
@define-color haori-orange #F39C12;
@define-color lightning-blue #5DADE2;
@define-color charcoal-dark #212121;
@define-color group-background #1A1A1A;
@define-color text-primary #FDFEFE;
@define-color text-secondary #BDBDBD;
@define-color border-color alpha(#FFFFFF, 0.2); /* Subtle border color */
@define-color transparent rgba(0,0,0,0);

/* --- Global & Bar Styling --- */
* {
    border: none;
    border-radius: 0;
    font-family: "FiraCode Nerd Font", "Font Awesome 6 Free", sans-serif;
    font-size: 16px;
    min-height: 0;
}

window#waybar {
    background: alpha(@charcoal-dark, 0.85);
    color: @text-primary;
    border-radius: 15px;
}

/* --- General Module Styling --- */
#workspaces, #clock, #battery, #cpu, #memory, #temperature, #network, #pulseaudio, #tray, #custom-notification {
    padding: 0 10px;
    margin: 4px 0px; /* Vertical margin for spacing */
    color: @text-secondary;
}

/* --- Visual Grouping for "Pill" Effect --- */
#group-hardware,
#group-system {
    background-color: @group-background;
    border-radius: 12px;
    margin: 5px;
}

/* Add subtle separators between modules */
#cpu, #memory, #pulseaudio, #network, #custom-notification {
    border-right: 1px solid @border-color;
}

/* --- Workspace & Icon Theming --- */
#workspaces button {
    padding: 0 5px;
    margin: 2px;
    background-color: @transparent;
    color: @text-secondary;
    transition: all 0.2s ease-in-out;
    /* Specific rule to force glyph rendering */
    font-family: "FiraCode Nerd Font", "Symbols Nerd Font", sans-serif;
}

#workspaces button:hover {
    background: rgba(100, 100, 100, 0.2);
    border-radius: 10px;
}

#workspaces button.focused {
    color: @zenitsu-yellow;
    background-color: @transparent;
}

/* --- States & Hover Effects --- */
#clock:hover, #battery:hover, #cpu:hover, #memory:hover, #temperature:hover, #network:hover, #pulseaudio:hover, #custom-notification:hover {
    color: @zenitsu-yellow;
}

/* --- State-Specific Styling --- */
#battery.critical:not(.charging) {
    color: #f53c3c;
}

#network.disconnected {
    color: #f53c3c;
}

#pulseaudio.muted {
    color: @haori-orange;
}
```
