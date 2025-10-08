# ⚡ Zenitsu Theme - Notification Module Fix

## Issue Resolved

Waybar was displaying the error:
```
[error] Item '': No icon name or pixmap given.
```

This was caused by the custom notification module using empty strings or HTML spans for icons instead of proper Nerd Font glyphs.

## Root Cause

The notification module configuration in `ZenitsuModulesCustom` had:
- Empty strings for icon states
- HTML `<span>` tags which don't work in Waybar's format-icons
- Missing proper Nerd Font glyph mappings

## Solution Applied

### 1. Updated Notification Module Configuration

Modified `~/.config/waybar/ZenitsuModulesCustom`:

```jsonc
"custom/notification": {
    "tooltip": false,
    "format": "{icon} {text}",
    "format-icons": {
        "notification": "󱅫",      // Bell with badge (active notifications)
        "none": "󰂚",              // Bell (no notifications)
        "dnd-notification": "󰂛",  // Bell with slash (DND with notifications)
        "dnd-none": "󰂜"          // Bell muted (DND, no notifications)
    },
    "return-type": "json",
    "exec-if": "which swaync-client",
    "exec": "swaync-client -swb",
    "on-click": "swaync-client -t -sw",
    "on-click-right": "swaync-client -d -sw",
    "escape": true
}
```

**Changes:**
- ✓ Replaced empty strings with proper Nerd Font bell glyphs
- ✓ Removed HTML span tags
- ✓ Added `{text}` to format to display notification count
- ✓ Added right-click action to toggle Do Not Disturb
- ✓ Updated on-click to include `-sw` flag for better UX

### 2. Enhanced Notification Styling

Modified `~/.config/waybar/style.css`:

```css
#custom-notification {
  padding: 4px 12px;
  margin: 0 4px;
  background: @zenitsu-bg;
  color: @zenitsu-yellow;
  border-radius: 0;
  border: 2px solid @zenitsu-shadow;
  box-shadow: 0 0 8px rgba(255, 162, 55, 0.3);
  transition: all 0.25s ease;
}

#custom-notification:hover {
  background: rgba(255, 162, 55, 0.2);
  color: @zenitsu-orange;
  border-color: @zenitsu-orange;
  box-shadow: 0 0 15px rgba(249, 255, 94, 0.5);
}

#custom-notification.notification {
  color: @zenitsu-lightning;
  border-color: @zenitsu-orange;
  animation: lightning-flash 2s ease-in-out infinite alternate;
}

#custom-notification.dnd-notification {
  color: @zenitsu-dimmed;
  background: rgba(100, 100, 100, 0.2);
}
```

**Styling Features:**
- ✓ Consistent with other Waybar modules (matching padding, margins, borders)
- ✓ Uses Zenitsu theme colors (yellow, orange, lightning)
- ✓ Lightning flash animation when notifications are present
- ✓ Distinct DND state styling with dimmed appearance
- ✓ Hover effects with glow

## Icon Glyph Reference

| State | Icon | Hex Code | Description |
|-------|------|----------|-------------|
| notification | 󱅫 | U+F156B | Bell with notification badge |
| none | 󰂚 | U+F009A | Bell (no notifications) |
| dnd-notification | 󰂛 | U+F009B | Bell with slash (DND active, has notifications) |
| dnd-none | 󰂜 | U+F009C | Bell muted (DND active, no notifications) |

All icons are from the Nerd Font Material Design Icons set.

## How It Works

1. **swaync-client** outputs JSON with notification state:
   ```json
   {"text": "2", "alt": "notification", "tooltip": "2 Notifications", "class": "notification"}
   ```

2. **Waybar** reads the `alt` field to determine which icon to display

3. **Format string** `"{icon} {text}"` displays the icon + count

4. **CSS class** from `class` field applies state-specific styling

## User Interactions

- **Left Click**: Toggle notification center (`swaync-client -t -sw`)
- **Right Click**: Toggle Do Not Disturb mode (`swaync-client -d -sw`)
- **Hover**: Shows glow effect and color change

## Visual States

### Normal States:
- **No notifications**: 󰂚 (yellow bell)
- **Has notifications**: 󱅫 2 (lightning yellow, animated glow)

### DND States:
- **DND, no notifications**: 󰂜 (dimmed, grayed out)
- **DND, has notifications**: 󰂛 2 (dimmed, grayed out)

## Integration with SwayNC

The module integrates seamlessly with SwayNC (Sway Notification Center):

- Displays real-time notification count
- Shows DND status
- Syncs with SwayNC's state
- Matches the Zenitsu theme aesthetic already applied to SwayNC config

## Verification

To verify the fix is working:

```bash
# Check if module is configured correctly
grep -A 12 "custom/notification" ~/.config/waybar/ZenitsuModulesCustom

# Test notification system
notify-send "⚡ Zenitsu Test" "Thunder Breathing notification!"

# Check if Waybar is running without errors
ps aux | grep waybar

# Test clicks
# Left-click the notification icon to open control center
# Right-click the notification icon to toggle DND
```

## Files Modified

1. `~/.config/waybar/ZenitsuModulesCustom` - Notification module config
2. `~/.config/waybar/style.css` - Notification module styling

## Troubleshooting

### If icons don't render:
The Nerd Font fix must be completed first. See `FONT_FIX_DOCUMENTATION.md`.

### If module doesn't appear:
Check that it's added to modules-right in the main config:
```bash
grep -A 10 "modules-right" ~/.config/waybar/configs/*Zenitsu*
```

### If swaync-client errors occur:
Ensure SwayNC is running:
```bash
pgrep -a swaync
# If not running:
swaync &
```

### If styling doesn't apply:
Restart Waybar:
```bash
killall waybar && waybar &
```

## Theme Consistency

This fix maintains 100% consistency with the Zenitsu Theme:
- ✓ Uses defined color variables (@zenitsu-*)
- ✓ Matches other module styling (borders, padding, shadows)
- ✓ Includes lightning flash animation for active state
- ✓ Follows the theatrical, dramatic aesthetic
- ✓ Integrates with existing SwayNC theme

## Related Files

- `~/.config/swaync/config.json` - SwayNC notification settings
- `~/.config/swaync/style.css` - SwayNC visual theme
- `NOTIFICATION_SYSTEM_ZENITSU.md` - Full notification system documentation

---

⚡ **Thunder Breathing: Notification Form - Lightning Bell Strike!** ⚡

Error resolved. Module functional. Notifications electrified.
