# Visual Verification Checklist - Zenitsu Thunder Glow

Use this checklist to verify all visual elements are displaying correctly.

## Workspace Buttons (Left Side)

- [ ] Can you see 5 lightning bolt icons (⚡)?
- [ ] Do the buttons have visible dark backgrounds?
- [ ] Do the buttons have subtle yellow borders?
- [ ] When you click a workspace, does it glow bright yellow?
- [ ] Can you clearly distinguish active vs inactive workspaces?

**Expected**: Five lightning bolts, clearly visible with backgrounds and borders

## Clock (Center)

- [ ] Is the date and time displayed in the center?
- [ ] Is it in yellow/orange color?
- [ ] Does it glow when you hover over it?

**Expected**: "{Month} | {Day}, {Year} | {Hour}:{Minute}" in Zenitsu yellow

## System Modules (Right Side)

### Hardware Group (CPU, Memory, Temperature)
- [ ] Can you see three modules grouped together?
- [ ] Are the percentages visible?
- [ ] Are the icons visible (if showing)?
- [ ] Does the group have a visible background?
- [ ] Do they glow when you hover?

**Expected**: Visible pill-shaped group with CPU%, Memory%, Temp°C

### Audio/Volume
- [ ] Is the speaker icon visible?
- [ ] Is the volume percentage visible?
- [ ] Does it show correct audio state?
- [ ] Does it glow yellow on hover?

**Expected**: " 60%" or similar, clearly visible

### Network
- [ ] Is the WiFi/Ethernet icon visible?
- [ ] Does it show signal strength (for WiFi)?
- [ ] Is the icon bright enough to see?
- [ ] Does it glow yellow on hover?

**Expected**: " " for WiFi or " " for Ethernet

### Battery (if on laptop)
- [ ] Is the battery icon visible?
- [ ] Is the percentage visible?
- [ ] Does it show charging state if plugged in?
- [ ] Is the color appropriate (green/blue for charging)?

**Expected**: "󰂂 85%" or similar with appropriate icon

### System Tray
- [ ] Are system tray icons visible?
- [ ] Can you see app icons if running?

## Overall Appearance

- [ ] Does the Waybar have a semi-transparent dark background?
- [ ] Is there a glowing border at the top that changes color?
- [ ] Are the colors electric yellow/orange/blue (Zenitsu theme)?
- [ ] Is everything readable and not too dim?
- [ ] Do hover effects work (yellow glow appears)?

## Border Animation

- [ ] Look at the top edge of Waybar
- [ ] Do you see the border color changing?
- [ ] Does it cycle: Yellow → Orange → Blue → Yellow?
- [ ] Does it create an electric pulse effect?
- [ ] Is the animation smooth (no stuttering)?

**Expected**: Continuous 4-second color cycle with glow

## Hyprland Window Borders

- [ ] Focus a window
- [ ] Does the active window border show colors?
- [ ] Does the gradient rotate around the window?
- [ ] Are the colors Yellow/White/Blue/Orange?

**Expected**: Rotating rainbow-like gradient on active windows

## Font Rendering

- [ ] Are all icons properly rendered (no boxes/squares)?
- [ ] Is text crisp and readable?
- [ ] Are the lightning bolt icons showing correctly?
- [ ] Are Nerd Font icons displaying?

## Color Accuracy

The theme should use these colors:
- **Zenitsu Yellow**: #F7DC6F (bright electric yellow)
- **Haori Orange**: #F39C12 (warm orange)
- **Lightning Blue**: #5DADE2 (electric blue)
- **Text Primary**: #FDFEFE (bright white)
- **Background**: Dark charcoal with transparency

## Troubleshooting

If any items are NOT checked:

1. **Icons not showing**: 
   ```bash
   fc-list | grep -i nerd
   ```
   Verify Nerd Fonts are installed

2. **Colors wrong**:
   ```bash
   pkill waybar && waybar &
   ```
   Restart Waybar

3. **Workspaces invisible**:
   Check if Thunder Glow CSS is loaded:
   ```bash
   readlink -f ~/.config/waybar/style.css
   ```

4. **Animation not working**:
   Check CSS for errors:
   ```bash
   waybar 2>&1 | grep -i error
   ```

5. **General issues**:
   Run full verification:
   ```bash
   ~/Project_Zenitsu_Theme/scripts/verify_zenitsu_system.sh
   ```

## Expected Result

If all items are checked:
✓ Zenitsu Thunder Glow theme is fully operational
✓ All visual elements are displaying correctly
✓ Animations are working smoothly
✓ Theme aesthetic is properly applied

---

**Last Updated**: 2025-10-08
**Theme Version**: Thunder Glow with Peony Layout
**Status**: All fixes applied
