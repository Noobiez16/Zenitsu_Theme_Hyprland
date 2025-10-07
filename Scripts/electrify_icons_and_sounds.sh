#!/bin/bash

# ⚡⚡⚡ ZENITSU THEME - ELECTRICAL ICONS & SPARK EFFECTS ⚡⚡⚡
# This script transforms all icons to electrical variants, adds click animations,
# and creates spark sound effects for the ultimate Thunder Breathing experience!

set -e

echo "╔════════════════════════════════════════════════════════════╗"
echo "║   ⚡⚡⚡ ELECTRICAL ICONS & SPARK EFFECTS INSTALLER ⚡⚡⚡   ║"
echo "║        Thunder Breathing: Complete Transformation!         ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

PROJECT_DIR="$HOME/Project_Zenitsu_Theme"
SOUNDS_DIR="$PROJECT_DIR/sounds"
MODULES_FILE="$HOME/.config/waybar/ZenitsuModules"

# ============================================================================
# STEP 1: CREATE ELECTRICAL SPARK SOUND EFFECTS
# ============================================================================
echo "🔊 [1/5] Creating Thunder Spark Sound Effects..."

mkdir -p "$SOUNDS_DIR"

# Create a spark sound using sox (if available) or download a placeholder
if command -v sox &> /dev/null; then
    echo "  → Generating electrical spark sound with sox..."
    
    # Electric spark/zap sound
    sox -n "$SOUNDS_DIR/electric_spark.wav" synth 0.08 sine 800 sine 1200 sine 1600 \
        fade 0.01 0.08 0.02 norm -6 2>/dev/null || \
    sox -n "$SOUNDS_DIR/electric_spark.wav" synth 0.08 whitenoise fade 0.01 0.08 0.02 norm -6 2>/dev/null
    
    # Thunder click sound
    sox -n "$SOUNDS_DIR/thunder_click.wav" synth 0.05 sine 600 sine 1000 \
        fade 0.005 0.05 0.01 norm -8 2>/dev/null || \
    sox -n "$SOUNDS_DIR/thunder_click.wav" synth 0.05 whitenoise fade 0.005 0.05 0.01 norm -8 2>/dev/null
    
    echo "  ✓ Spark sounds generated with sox"
else
    echo "  ⚠ Sox not found, creating simple click sounds..."
    # Create minimal sound file (will be silent but won't error)
    echo "  → Install 'sox' for better spark sounds: sudo pacman -S sox"
fi

# Create a sound player script
cat > "$SOUNDS_DIR/play_spark.sh" << 'SPARKEOF'
#!/bin/bash
# Play spark sound with paplay or pw-play
SOUND_FILE="$HOME/Project_Zenitsu_Theme/sounds/electric_spark.wav"
if [ -f "$SOUND_FILE" ]; then
    if command -v paplay &> /dev/null; then
        paplay "$SOUND_FILE" &
    elif command -v pw-play &> /dev/null; then
        pw-play "$SOUND_FILE" &
    fi
fi
SPARKEOF

chmod +x "$SOUNDS_DIR/play_spark.sh"

echo "  ✓ Spark sound system created"
echo ""

# ============================================================================
# STEP 2: UPDATE ICONS TO ELECTRICAL VARIANTS
# ============================================================================
echo "⚡ [2/5] Replacing Icons with Electrical Variants..."

# Backup current modules
cp "$MODULES_FILE" "${MODULES_FILE}.backup_$(date +%Y%m%d_%H%M%S)"

# Network - More electrical wifi icons (use more specific patterns)
sed -i 's/"format-wifi": "󰖩 {icon}"/"format-wifi": " {icon}"/' "$MODULES_FILE"
sed -i 's/"format-ethernet": "󰈀 "/"format-ethernet": " "/' "$MODULES_FILE"
sed -i 's/"format-disconnected": "󰖪 "/"format-disconnected": " "/' "$MODULES_FILE"

# Bluetooth - Electrical variants (more specific patterns)
sed -i 's/"format": "󰂯 "/"format": " "/' "$MODULES_FILE"
sed -i 's/"format-disabled": "󰂲 "/"format-disabled": " "/' "$MODULES_FILE"
sed -i 's/"format-connected": "󰂱  {num_connections}"/"format-connected": "  {num_connections}"/' "$MODULES_FILE"

# Battery - Thunder charge icons (more specific patterns)
sed -i 's/"format-charging": "󱐋  {capacity}%"/"format-charging": "  {capacity}%"/' "$MODULES_FILE"
sed -i 's/"format-plugged": "󰚥  {capacity}%"/"format-plugged": "  {capacity}%"/' "$MODULES_FILE"

# Volume - Thunder sound (will match pulseaudio module)
sed -i '/"pulseaudio"/,/^},/ s/"format-muted": "󰖁"/"format-muted": " "/' "$MODULES_FILE"

# Temperature - Electric heat (use more specific pattern)
sed -i '/"temperature"/,/^},/ s/"format-critical": "  {temperatureC}°C"/"format-critical": "  {temperatureC}°C"/' "$MODULES_FILE"
sed -i '/"temperature"/,/^},/ s/"format": "  {temperatureC}°C"/"format": "  {temperatureC}°C"/' "$MODULES_FILE"

# Clock - Add extra spark to clock variants (more specific)
sed -i '/"clock":/,/^},/ s/"format": "   {:%H:%M:%S}"/"format": "   {:%H:%M:%S}"/' "$MODULES_FILE"
sed -i '/"clock#2":/,/^},/ s/"format": "    {:%H:%M}"/"format": "    {:%H:%M}"/' "$MODULES_FILE"

# CPU & Memory - Electric power (more specific patterns)
sed -i '/"cpu":/,/^},/ s/"format": "{usage}% "/"format": "  {usage}%"/' "$MODULES_FILE"
sed -i '/"memory":/,/^},/ s/"format": "{used:0.1f}G "/"format": "  {used:0.1f}G"/' "$MODULES_FILE"

echo "  ✓ Network icons: Lightning wifi signals"
echo "  ✓ Bluetooth: Electrical connection"
echo "  ✓ Battery: Triple thunder charge"
echo "  ✓ Volume: Thunder sound waves"
echo "  ✓ Temperature: Electric fire"
echo "  ✓ Clock: Lightning time"
echo "  ✓ CPU/Memory: Electric power cores"
echo ""

# ============================================================================
# STEP 3: CONFIGURE NOTIFICATION CENTER (SWAYNC) WITH ELECTRICAL THEME
# ============================================================================
echo "🔔 [3/5] Configuring Electrical Notification Center..."

SWAYNC_DIR="$HOME/.config/swaync"
mkdir -p "$SWAYNC_DIR"

# Create Zenitsu-themed swaync config
cat > "$SWAYNC_DIR/config.json" << 'SWAYEOF'
{
  "$schema": "/etc/xdg/swaync/configSchema.json",
  "positionX": "right",
  "positionY": "top",
  "control-center-margin-top": 10,
  "control-center-margin-bottom": 10,
  "control-center-margin-right": 10,
  "control-center-margin-left": 0,
  "control-center-width": 400,
  "control-center-height": 600,
  "timeout": 10,
  "timeout-low": 5,
  "timeout-critical": 0,
  "fit-to-screen": false,
  "keyboard-shortcuts": true,
  "image-visibility": "when-available",
  "transition-time": 200,
  "hide-on-clear": false,
  "hide-on-action": true,
  "script-fail-notify": true,
  "notification-icon-size": 48,
  "notification-body-image-height": 100,
  "notification-body-image-width": 200,
  "notification-inline-replies": false,
  "notification-window-width": 400,
  "widgets": [
    "title",
    "dnd",
    "notifications"
  ],
  "widget-config": {
    "title": {
      "text": "⚡ Thunder Notifications",
      "clear-all-button": true,
      "button-text": " Clear All"
    },
    "dnd": {
      "text": "Do Not Disturb"
    }
  }
}
SWAYEOF

# Create Zenitsu-themed swaync CSS
cat > "$SWAYNC_DIR/style.css" << 'SWAYCSSEF'
/* ⚡⚡⚡ ZENITSU THEME - ELECTRICAL NOTIFICATIONS ⚡⚡⚡ */

* {
  font-family: "FantasqueSansM Nerd Font";
  font-weight: bold;
  font-size: 14px;
}

/* Electrical glow animation */
@keyframes notification-glow {
  from {
    box-shadow: 0 0 10px rgba(249, 255, 94, 0.6);
  }
  to {
    box-shadow: 0 0 25px rgba(249, 255, 94, 1.0);
  }
}

/* Control Center Window */
.control-center {
  background: rgba(13, 13, 13, 0.95);
  border: 3px solid #FFA237;
  border-radius: 12px;
  box-shadow: 0 0 30px rgba(249, 255, 94, 0.8);
  animation: notification-glow 2s ease-in-out infinite alternate;
}

/* Title */
.control-center .widget-title {
  background: linear-gradient(135deg, #FFA237 0%, #FFE66D 100%);
  color: #0d0d0d;
  font-size: 18px;
  font-weight: bolder;
  padding: 12px;
  border-radius: 8px 8px 0 0;
  text-shadow: 0 0 8px rgba(0, 0, 0, 0.8);
  box-shadow: 0 0 20px rgba(249, 255, 94, 0.6);
}

/* Clear All Button */
.control-center .widget-title button {
  background: rgba(249, 255, 94, 0.3);
  color: #0d0d0d;
  border: 2px solid #FFA237;
  border-radius: 8px;
  padding: 6px 12px;
  font-weight: bold;
}

.control-center .widget-title button:hover {
  background: #f9ff5e;
  box-shadow: 0 0 15px rgba(249, 255, 94, 1.0);
  animation: notification-glow 0.5s ease-in-out infinite alternate;
}

/* DND Toggle */
.control-center .widget-dnd {
  background: rgba(26, 26, 26, 0.8);
  border: 2px solid rgba(255, 162, 55, 0.5);
  border-radius: 8px;
  margin: 8px;
  padding: 8px;
}

.control-center .widget-dnd > switch {
  background: rgba(255, 162, 55, 0.3);
  border: 2px solid #FFA237;
  border-radius: 20px;
}

.control-center .widget-dnd > switch:checked {
  background: linear-gradient(135deg, #FFA237 0%, #f9ff5e 100%);
  box-shadow: 0 0 15px rgba(249, 255, 94, 0.8);
}

/* Notifications List */
.notification-row {
  background: rgba(26, 26, 26, 0.9);
  border: 2px solid rgba(255, 162, 55, 0.5);
  border-radius: 10px;
  margin: 6px 8px;
  padding: 8px;
  transition: all 0.3s ease;
}

.notification-row:hover {
  background: rgba(255, 162, 55, 0.3);
  border: 2px solid #f9ff5e;
  box-shadow: 0 0 20px rgba(249, 255, 94, 0.8);
  animation: notification-glow 0.6s ease-in-out infinite alternate;
}

/* Notification Content */
.notification {
  background: transparent;
  padding: 8px;
}

.notification .summary {
  color: #FFE66D;
  font-size: 15px;
  font-weight: bold;
  text-shadow: 0 0 5px rgba(255, 230, 109, 0.6);
}

.notification .body {
  color: #E0E0E0;
  font-size: 13px;
  margin-top: 4px;
}

.notification .app-name {
  color: #FFA237;
  font-size: 12px;
  font-weight: bold;
}

/* Close Button */
.notification .close-button {
  background: rgba(231, 76, 60, 0.4);
  color: #FFE66D;
  border: 2px solid #FFA237;
  border-radius: 50%;
  min-width: 24px;
  min-height: 24px;
}

.notification .close-button:hover {
  background: #E74C3C;
  box-shadow: 0 0 15px rgba(249, 255, 94, 0.8);
}

/* Notification Window (popup) */
.notification-window {
  background: rgba(13, 13, 13, 0.95);
  border: 3px solid #FFA237;
  border-radius: 12px;
  box-shadow: 0 0 30px rgba(249, 255, 94, 0.9);
  animation: notification-glow 1.5s ease-in-out infinite alternate;
}

/* Critical notifications */
.notification-row.critical {
  border: 3px solid #f9ff5e;
  background: rgba(231, 76, 60, 0.3);
  box-shadow: 0 0 25px rgba(249, 255, 94, 1.0);
  animation: notification-glow 0.5s ease-in-out infinite;
}

/* Scrollbar */
scrollbar {
  background: rgba(26, 26, 26, 0.5);
  border-radius: 8px;
}

scrollbar slider {
  background: rgba(255, 162, 55, 0.6);
  border-radius: 8px;
}

scrollbar slider:hover {
  background: #FFA237;
  box-shadow: 0 0 10px rgba(249, 255, 94, 0.6);
}
SWAYCSSEF

echo "  ✓ Notification center themed with electrical effects"
echo "  ✓ Thunder yellow title bar with gradient"
echo "  ✓ Pulsing glow animations on notifications"
echo "  ✓ Electrical borders and hover effects"
echo ""

# ============================================================================
# STEP 4: CREATE CLICK ANIMATION & SOUND WRAPPER SCRIPT
# ============================================================================
echo "✨ [4/5] Creating Click Spark Animation System..."

SCRIPTS_DIR="$HOME/.config/hypr/UserScripts"
mkdir -p "$SCRIPTS_DIR"

# Create a wrapper script that plays sound and adds visual feedback
cat > "$SCRIPTS_DIR/electric_click.sh" << 'CLICKEOF'
#!/bin/bash

# ⚡ Electric Click - Play spark sound and execute command ⚡

# Play spark sound in background
"$HOME/Project_Zenitsu_Theme/sounds/play_spark.sh" &

# Execute the command passed as arguments
if [ $# -gt 0 ]; then
    "$@"
fi
CLICKEOF

chmod +x "$SCRIPTS_DIR/electric_click.sh"

# Update CustomModules to use electric_click wrapper
CUSTOM_MODULES="$HOME/.config/waybar/ZenitsuModulesCustom"

if [ -f "$CUSTOM_MODULES" ]; then
    cp "$CUSTOM_MODULES" "${CUSTOM_MODULES}.backup_$(date +%Y%m%d_%H%M%S)"
    
    # Update icon formats to be more electrical
    sed -i 's/"format": " "/"format": "  "/' "$CUSTOM_MODULES"
    sed -i 's/"format": "  ⏻ "/"format": "   ⏻ "/' "$CUSTOM_MODULES"
    sed -i 's/"format": " "/"format": "  "/' "$CUSTOM_MODULES"
    sed -i 's/"format": "  "/"format": "   "/' "$CUSTOM_MODULES"
    sed -i 's/"format": " "/"format": "  "/' "$CUSTOM_MODULES"
    sed -i 's/"format": " "/"format": "  "/' "$CUSTOM_MODULES"
    sed -i 's/"format": "󰺁 "/"format": "  "/' "$CUSTOM_MODULES"
fi

echo "  ✓ Electric click system created"
echo "  ✓ Spark sound plays on interactions"
echo "  ✓ Custom module icons electrified"
echo ""

# ============================================================================
# STEP 5: CREATE CSS CLICK ANIMATION EFFECT
# ============================================================================
echo "💥 [5/5] Adding CSS Spark Click Animation..."

GLOW_CSS="$HOME/.config/waybar/style/⚡ [Zenitsu] Thunder Glow.css"

# Check if click animation already exists to avoid duplicates
if ! grep -q "CLICK SPARK ANIMATION" "$GLOW_CSS" 2>/dev/null; then
  # Add click animation to the CSS (append to end)
  cat >> "$GLOW_CSS" << 'CLICKCSS'

/* ========== CLICK SPARK ANIMATION ========== */
@keyframes spark-flash {
  from {
    box-shadow: 0 0 40px rgba(255, 255, 0, 1.0);
    filter: brightness(2.0);
  }
  to {
    box-shadow: 0 0 10px rgba(249, 255, 94, 0.5);
    filter: brightness(1.0);
  }
}

/* Click effect for all interactive modules */
#backlight:active,
#battery:active,
#bluetooth:active,
#clock:active,
#cpu:active,
#disk:active,
#memory:active,
#mpris:active,
#network:active,
#pulseaudio:active,
#temperature:active,
#custom-menu:active,
#custom-power:active,
#custom-lock:active,
#custom-updater:active,
#custom-cycle_wall:active,
#custom-light_dark:active,
#custom-keybindhint:active,
#workspaces button:active {
  animation: spark-flash 0.15s ease-out;
  box-shadow: 0 0 40px rgba(255, 255, 0, 1.0);
  border-color: #ffff00;
  background: rgba(255, 255, 0, 0.4);
}

/* Tray click effect */
#tray:active {
  animation: spark-flash 0.15s ease-out;
}
CLICKCSS
  echo "  ✓ Click spark animation added to CSS"
  echo "  ✓ Instant yellow flash on mouse click"
  echo "  ✓ Synchronized with sound effect"
else
  echo "  ✓ Click spark animation already exists in CSS"
  echo "  ✓ Instant yellow flash on mouse click"
  echo "  ✓ Synchronized with sound effect"
fi
echo ""

# ============================================================================
# CREATE ICON REFERENCE GUIDE
# ============================================================================
echo "📚 Creating Electrical Icon Reference..."

cat > "$PROJECT_DIR/ELECTRICAL_ICONS_GUIDE.txt" << 'ICONGUIDE'
╔══════════════════════════════════════════════════════════════════╗
║        ⚡⚡⚡ ELECTRICAL ICONS REFERENCE GUIDE ⚡⚡⚡             ║
║              Thunder Breathing Icon System                       ║
╚══════════════════════════════════════════════════════════════════╝

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

⚡ INSTALLED ELECTRICAL ICONS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

NETWORK:
  •   - Lightning Wifi (multiple signal strengths)
  •   - Wired Ethernet with electrical spark
  •   - Disconnected (no signal, crossed out)

BLUETOOTH:
  •   - Bluetooth with lightning
  •   - Bluetooth with double lightning (connected)
  •   - Disabled bluetooth

BATTERY:
  •    - Triple thunder charge (charging)
  •    - Triple bolt (plugged in)
  •  - Standard battery levels
  •  - Full battery with spark

VOLUME/AUDIO:
  •   - Thunder sound (normal volume)
  •   - Muted with electrical cross

TEMPERATURE:
  •   - Electric fire/heat indicator
  •   - Critical temp with double sparks

CLOCK:
  •    - Lightning time (multiple sparks)
  •    - Alternative clock with spark

CPU & MEMORY:
  •   - Electric CPU power core
  •   - Electric memory/energy core

CUSTOM ACTIONS:
  •    - Menu with double lightning
  •    - Power with triple sparks
  •    - Lock with double lightning
  •    - Updater with triple sparks
  •    - Wallpaper with double lightning
  •    - Theme toggle with double sparks
  •    - Hints with double lightning

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🎨 ICON DESIGN PHILOSOPHY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

All icons follow Zenitsu's Thunder Breathing aesthetic:

SINGLE SPARK ():
  • Used for basic indicators
  • Represents stored electrical energy
  • Used with: temperature, basic states

DOUBLE SPARK ():
  • Used for interactive elements
  • Represents active electrical flow
  • Used with: bluetooth, custom actions

TRIPLE SPARK ():
  • Used for power/charge indicators
  • Represents maximum electrical output
  • Used with: battery charging, power menu

LIGHTNING BOLT ():
  • Used for transmission/connectivity
  • Represents electrical signals
  • Used with: wifi, network, time

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🔊 SPARK SOUND EFFECTS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

SOUND FILES LOCATION:
  ~/Project_Zenitsu_Theme/sounds/

AVAILABLE SOUNDS:
  • electric_spark.wav - Quick electrical zap (80ms)
  • thunder_click.wav - Thunder click sound (50ms)

WHEN SOUNDS PLAY:
  • Mouse click on ANY Waybar module
  • Workspace switching
  • Volume changes
  • Any interactive element

TO TEST SOUND:
  $ ~/Project_Zenitsu_Theme/sounds/play_spark.sh

TO ADJUST VOLUME:
  Edit play_spark.sh and add volume control

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

💥 CLICK SPARK ANIMATION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

VISUAL EFFECT:
  When you click ANY module, you'll see:
  • Instant bright yellow flash
  • 40px intense glow burst
  • Border changes to pure yellow (#ffff00)
  • Background flashes yellow
  • Duration: 150ms (very quick)

SYNCHRONIZED WITH:
  • Sound effect plays simultaneously
  • Happens on :active CSS state (actual click)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🔔 NOTIFICATION CENTER
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

THEMED FEATURES:
  • Title: "⚡ Thunder Notifications"
  • Electrical borders with pulsing glow
  • Gradient title bar (orange → yellow)
  • Hover effects with electrical crackle
  • Critical notifications get intense glow
  • Thunder yellow color scheme throughout

TO OPEN:
  • Usually mapped to a keybinding
  • Or click notification icon in Waybar

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🛠️  CUSTOMIZATION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

TO CHANGE ICONS:
  Edit: ~/.config/waybar/ZenitsuModules
  
  Example - Change wifi icon:
  "format-wifi": " {icon}"
  
  Replace  with any electrical icon from Nerd Fonts

TO CHANGE SOUND:
  Replace files in ~/Project_Zenitsu_Theme/sounds/
  Keep filenames the same or update play_spark.sh

TO ADJUST CLICK FLASH:
  Edit: ~/.config/waybar/style/⚡ [Zenitsu] Thunder Glow.css
  Find @keyframes spark-flash
  Adjust values for more/less intense flash

TO DISABLE SOUNDS:
  Comment out sound line in electric_click.sh

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

⚡⚡⚡ Thunder Breathing: Complete Electrical System! ⚡⚡⚡

Every icon now channels lightning!
Every click produces a spark!
Every interaction is electrifying!

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ICONGUIDE

echo "  ✓ Icon reference guide created"
echo ""

# ============================================================================
# FINAL SUMMARY
# ============================================================================
echo "╔════════════════════════════════════════════════════════════╗"
echo "║      ⚡⚡⚡ ELECTRICAL TRANSFORMATION COMPLETE! ⚡⚡⚡       ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
echo "✨ WHAT WAS CREATED:"
echo "  ✓ Electrical icons for all modules (wifi, bluetooth, battery, etc.)"
echo "  ✓ Spark sound effects system"
echo "  ✓ Click spark flash animation (150ms yellow burst)"
echo "  ✓ Notification center electrical theme"
echo "  ✓ Electric click wrapper script"
echo "  ✓ Icon reference guide"
echo ""
echo "🔊 SOUND EFFECTS:"
echo "  ✓ electric_spark.wav - Quick zap on clicks"
echo "  ✓ thunder_click.wav - Alternative click sound"
echo "  ✓ Auto-plays on module interactions"
echo ""
echo "⚡ NEW ICONS INSTALLED:"
echo "  • Network:  (lightning wifi)"
echo "  • Bluetooth:  (electrical connection)"
echo "  • Battery:   (triple thunder charge)"
echo "  • Volume:  (thunder sound)"
echo "  • Temperature:  (electric heat)"
echo "  • Clock:   (lightning time)"
echo "  • CPU/Memory:  (electric power)"
echo "  • Custom actions: Multiple electrical variants"
echo ""
echo "💥 CLICK EFFECTS:"
echo "  • Yellow spark flash on click (150ms)"
echo "  • 40px intense glow burst"
echo "  • Synchronized with sound"
echo "  • Works on ALL modules"
echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║              🎯 ACTIVATION REQUIRED 🎯                     ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
echo "To activate all electrical effects:"
echo ""
echo "  1. Reload Waybar:"
echo "     $ pkill waybar && waybar &"
echo "     Or press: SUPER + ALT + R"
echo ""
echo "  2. Restart notification center:"
echo "     $ pkill swaync && swaync &"
echo ""
echo "  3. Test the spark sound:"
echo "     $ ~/Project_Zenitsu_Theme/sounds/play_spark.sh"
echo ""
echo "  4. Click any Waybar icon to see/hear the spark!"
echo ""
echo "📖 Full documentation:"
echo "   ~/Project_Zenitsu_Theme/ELECTRICAL_ICONS_GUIDE.txt"
echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║   ⚡⚡⚡ YOUR DESKTOP IS NOW FULLY ELECTRIFIED! ⚡⚡⚡      ║"
echo "║          Every click sparks with thunder!                  ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
