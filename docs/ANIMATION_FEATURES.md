# Animation Features - Zenitsu Theme

## Overview

This document describes the performance-optimized animation features implemented in the Zenitsu theme for Hyprland and Waybar.

## Hyprland Window Border Animation

### Configuration Location
`.config/hypr/hyprland.conf`

### Features
- **Electric Border Gradient**: Active windows display a 45-degree gradient transitioning between Zenitsu yellow (`#F7C873`) and storm gray (`#4A4A4A`)
- **Continuous Border Rotation**: The `borderangle` animation creates a continuous 8-second loop that rotates the gradient around the window border
- **Performance**: Uses Hyprland's native animation engine, optimized for minimal CPU/GPU usage

### Settings
```ini
col.active_border = rgba(F7C873ff) rgba(4A4A4Aff) 45deg
animation = borderangle, 1, 8, default, loop
```

## Waybar Animated Border

### Configuration Location
`.config/waybar/style.css`

### Features
- **Conic Gradient Animation**: A rotating conic gradient creates the illusion of electricity flowing around the Waybar
- **CSS-Only Implementation**: Uses pure CSS animations with no JavaScript overhead
- **Hardware Acceleration**: Leverages CSS transforms which are GPU-accelerated
- **Raspberry Pi 5 Optimized**: 4-second animation cycle balances visual impact with performance on ARM hardware

### Technical Implementation
- Uses a `::before` pseudo-element with a conic gradient
- Element is 200% larger than the bar and rotates continuously
- Parent element clips overflow to show only the border effect
- Z-index ensures the animation layer sits behind content

### Performance Considerations
- **CPU Usage**: Minimal, as transform animations are handled by GPU
- **Memory**: Single pseudo-element with no additional DOM overhead
- **Compatibility**: Works on all modern browsers and Wayland compositors

## Color Palette

The animations use the defined Zenitsu color scheme:
- **Zenitsu Yellow**: `#F7C873` (primary accent)
- **Zenitsu Orange**: `#FFA500` (warnings/critical states)
- **Storm Gray**: `#4A4A4A` (gradient complement)
- **Background**: `rgba(28, 28, 28, 0.8)` (translucent dark)

## Customization

### Adjusting Animation Speed

**Hyprland Border**:
```ini
animation = borderangle, 1, [SPEED], default, loop
```
Lower values = faster rotation

**Waybar Border**:
```css
animation: rotate-border [DURATION]s linear infinite;
```
Increase duration for slower rotation

### Changing Colors

Modify the CSS variables in `.config/waybar/style.css`:
```css
:root {
    --zenitsu-yellow: #F7C873;
    --border-color: #F7C873;
}
```

Modify Hyprland colors in `.config/hypr/hyprland.conf`:
```ini
col.active_border = rgba([COLOR1]) rgba([COLOR2]) 45deg
```

## Known Limitations

- Waybar animation requires compositor support for CSS animations
- Border animations are only visible when windows are focused (Hyprland) or Waybar is visible
- Very high refresh rate displays (>144Hz) may show slight animation stuttering on low-power systems

## Testing

To verify animations are working:

1. **Hyprland**: Focus any window and observe the border color rotation
2. **Waybar**: Launch Waybar and observe the rotating border effect
3. **Performance**: Run `htop` to confirm minimal CPU overhead (<1% per animation)

## Future Improvements

- Add configuration options for animation intensity
- Implement dynamic color schemes based on system events
- Add option to disable animations on battery power
