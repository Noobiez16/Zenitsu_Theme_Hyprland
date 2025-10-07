# ⚡ Zenitsu Theme - Bottom-Up Notification System

## 🎯 Implementation Summary

Successfully configured **SwayNC** notification daemon with bottom-up sliding animations and complete Zenitsu theme styling.

---

## 📋 Daemon Selection & Justification

### **Chosen: SwayNC (Sway Notification Center) v0.12.2**

#### Why SwayNC?
✅ **Wayland-Native**: Full Hyprland compatibility  
✅ **Animation Support**: CSS-based transitions with configurable timing  
✅ **Precise Positioning**: Independent X/Y position control  
✅ **Full CSS Styling**: Complete control over appearance  
✅ **Control Center**: Notification history with persistent panel  
✅ **GTK-Based**: Modern, performant, reliable  
✅ **Already Installed**: No additional dependencies needed  

#### Comparison with Alternatives:

| Feature | SwayNC | Dunst | Mako |
|---------|--------|-------|------|
| Wayland Support | ✓ Excellent | ~ Limited | ✓ Good |
| CSS Styling | ✓ Full | ~ Basic | ~ Basic |
| Animations | ✓ CSS Transitions | ~ Fade only | ~ Minimal |
| Position Control | ✓ XY Independent | ✓ Basic | ✓ Basic |
| History Panel | ✓ Built-in | ✗ None | ✗ None |
| **Best for Zenitsu** | **✓ YES** | ✗ No | ~ Partial |

---

## 🔧 Installation

SwayNC was already installed. For reference:

```bash
# Installation command (if needed):
sudo pacman -S swaync

# Verify installation:
pacman -Q swaync
# Output: swaync 0.12.2-1
```

---

## ⚙️ Configuration Changes

### 1. **config.json** - Position & Behavior

**File**: `~/.config/swaync/config.json`

#### Key Changes:
```json
{
  "positionX": "center",              // ← Changed from "right"
  "positionY": "bottom",              // ← Changed from "top"
  "transition-time": 300,             // ← Increased from 200ms
  "control-center-positionX": "right",
  "control-center-positionY": "top"
}
```

#### Animation Settings:
- **transition-time**: `300ms` - Smooth slide animation
- **Position**: `bottom-center` - Rises above Waybar
- **Control Center**: Remains top-right (separate from popups)

---

### 2. **style.css** - Zenitsu Theme & Animations

**File**: `~/.config/swaync/style.css`

#### New Features:

**🎬 Slide-Up Animation:**
```css
@keyframes slide-up {
  from {
    transform: translateY(100px);
    opacity: 0;
  }
  to {
    transform: translateY(0);
    opacity: 1;
  }
}

.notification-window {
  animation: slide-up 0.3s cubic-bezier(0.25, 0.46, 0.45, 0.94);
}
```

**⚡ Thunder Effects:**
- `electric-pulse`: Continuous subtle glow (2s cycle)
- `thunder-flash`: Critical notification rapid pulse (0.6s)
- `slide-up`: Bottom-to-top entry animation (0.3s)

**🎨 Zenitsu Color Scheme:**
- Background: `#0d0d0d` (zenitsu-dark)
- Borders: `#FFA237` (haori orange)
- Text: `#FFE66D` (thunder yellow)
- Highlights: `#f9ff5e` (lightning)
- Glow: Electric yellow shadows

**🔲 Sharp Borders:**
- All `border-radius: 0` (lightning aesthetic)
- 2-3px solid borders
- Angular, sharp-edged design

---

## 🎨 Visual Design

### Notification Popup (Bottom-Center):
```
                    ┌─────────────────────────────────┐
                    │  ⚡ Thunder Test                │
                    │  ───────────────────────────────│
                    │  Notification sliding up from   │
                    │  bottom!                        │
                    │                            [✕]  │
                    └─────────────────────────────────┘
                              ↑ Slides up
                    ═══════════════════════════════════
                    Bottom of screen (above Waybar)
```

### Control Center (Top-Right):
```
┌────────────────────────────────────┐
│ ⚡ Thunder Notifications  [Clear]  │
├────────────────────────────────────┤
│ Do Not Disturb            [○]      │
├────────────────────────────────────┤
│ ┌────────────────────────────────┐ │
│ │ App Name                       │ │
│ │ Notification Title             │ │
│ │ Notification body text...      │ │
│ └────────────────────────────────┘ │
│ ┌────────────────────────────────┐ │
│ │ Another notification...        │ │
│ └────────────────────────────────┘ │
└────────────────────────────────────┘
```

---

## ✨ Notification Urgency Levels

### Low Priority:
- Left border: Shadow orange
- Subtle glow
- Standard timeout (5s)

### Normal Priority:
- Left border: Haori orange
- Moderate glow
- Standard timeout (10s)

### Critical Priority:
- Full border: Electric yellow (#ffff00)
- Red tint background
- Rapid thunder flash animation
- No auto-timeout (stays until dismissed)
- Intense 30px glow

---

## 🎯 Features & Behaviors

### Notification Popup:
✓ Slides up from bottom (0.3s smooth animation)  
✓ Appears bottom-center (above Waybar)  
✓ Sharp angular borders (no rounded corners)  
✓ Electrical glow effects  
✓ Thunder yellow text  
✓ Orange borders with lightning highlights  
✓ Auto-dismiss after timeout  
✓ Click to dismiss  
✓ Hover for enhanced glow  

### Control Center:
✓ Persistent notification history  
✓ Opens from top-right  
✓ Do Not Disturb toggle  
✓ Clear All button  
✓ Scrollable list  
✓ Same Zenitsu styling  
✓ Hover effects on notifications  

---

## 🧪 Testing Notifications

### Test Normal Notification:
```bash
notify-send "⚡ Thunder Test" "Notification sliding up from bottom!" -u normal -t 5000
```

### Test Critical Notification:
```bash
notify-send "⚡ CRITICAL THUNDER STRIKE ⚡" "This is a critical notification!" -u critical -t 0
```

### Test Low Priority:
```bash
notify-send "Info" "Low priority notification" -u low -t 3000
```

### Open Control Center:
```bash
swaync-client -t
```

---

## 🔄 Restart SwayNC

If you need to restart the notification daemon:

```bash
pkill swaync && swaync &
```

Or use the Hyprland keybind if configured.

---

## 📁 File Locations

```
~/.config/swaync/
├── config.json                        ← Position & behavior settings
├── config.json.backup_YYYYMMDD_HHMMSS ← Backup of old config
├── style.css                          ← Zenitsu theme & animations
├── style.css.backup_YYYYMMDD_HHMMSS   ← Backup of old style
├── icons/                             ← Notification icons
└── images/                            ← Notification images
```

---

## 🎨 Color Reference

```css
/* Zenitsu Notification Colors */
@define-color zenitsu-dark #0d0d0d;        /* Deep dark background */
@define-color zenitsu-bg #1a1a1a;          /* Module backgrounds */
@define-color zenitsu-yellow #FFE66D;      /* Thunder yellow (text) */
@define-color zenitsu-orange #FFA237;      /* Haori orange (borders) */
@define-color zenitsu-lightning #f9ff5e;   /* Lightning highlights */
@define-color zenitsu-white #FFFFFF;       /* Primary text */
@define-color zenitsu-dimmed #E0E0E0;      /* Secondary text */
@define-color zenitsu-shadow #B57436;      /* Shadow orange */
@define-color zenitsu-electric #ffff00;    /* Critical warnings */
```

---

## ⚙️ Configuration Parameters

### Position:
- `positionX`: "center" (left/center/right)
- `positionY`: "bottom" (top/bottom)
- `margin-bottom`: Space above Waybar (default: auto)

### Timing:
- `transition-time`: 300ms (slide animation duration)
- `timeout`: 10s (normal notifications)
- `timeout-low`: 5s (low priority)
- `timeout-critical`: 0 (never auto-dismiss)

### Appearance:
- `notification-window-width`: 400px
- `notification-icon-size`: 48px
- Sharp borders: `border-radius: 0`
- Border width: 2-3px solid

---

## 🐛 Troubleshooting

### Notifications not appearing?
```bash
# Check if swaync is running:
pgrep swaync

# Restart if needed:
pkill swaync && swaync &

# Test notification:
notify-send "Test" "Testing notifications"
```

### Animations not smooth?
- Increase `transition-time` in config.json
- Check compositor performance
- Verify CSS animations are enabled

### Wrong position?
- Verify `positionX` and `positionY` in config.json
- Restart swaync after config changes

### Styling issues?
- Check CSS syntax in style.css
- Verify GTK theme compatibility
- Restart swaync to reload CSS

---

## 📝 Notes

- Notifications now slide up from bottom-center
- Positioned above Waybar for consistency
- Control center remains top-right for easy access
- All styling matches Waybar Zenitsu theme
- Sharp borders throughout (lightning aesthetic)
- Critical notifications have intense effects
- Backups created automatically with timestamps

---

## ✅ Verification Checklist

- ✓ SwayNC daemon running (PID 7347)
- ✓ Position set to bottom-center
- ✓ Transition time set to 300ms
- ✓ Style.css using Zenitsu colors
- ✓ Sharp borders (no rounded corners)
- ✓ Slide-up animation working
- ✓ Electric pulse glow effects
- ✓ Critical notifications flash properly
- ✓ Backups created successfully
- ✓ Matches Waybar theme aesthetics

---

**Implementation Date**: October 7, 2025  
**Daemon**: SwayNC 0.12.2  
**Theme**: Zenitsu Thunder (Bottom-Up)  
**Status**: ✅ Complete and Operational

⚡ **THUNDER NOTIFICATIONS RISE FROM BELOW!** ⚡
