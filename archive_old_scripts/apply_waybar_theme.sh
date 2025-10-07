#!/bin/bash

# ⚡ Zenitsu Theme - Waybar Thunder Breathing Configuration ⚡
# This script creates a custom Waybar layout with electrifying Thunder Breathing themed icons

set -e  # Exit on error

echo "╔════════════════════════════════════════════════════════════╗"
echo "║     ⚡ WAYBAR THUNDER BREATHING THEME INSTALLER ⚡         ║"
echo "║        First Form - Thunderclap and Flash!                ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# ============================================================================
# STEP 1: LOCATE AND DUPLICATE PEONY CONFIGURATION
# ============================================================================
echo "📋 [1/3] Locating Peony Waybar Configuration..."

WAYBAR_CONFIGS="$HOME/.config/waybar/configs"
PEONY_CONFIG="$WAYBAR_CONFIGS/[BOT] Peony"
ZENITSU_CONFIG="$WAYBAR_CONFIGS/⚡ [BOT] Zenitsu-Peony"
MODULES_FILE="$HOME/.config/waybar/Modules"
ZENITSU_MODULES="$HOME/.config/waybar/ZenitsuModules"

if [ ! -f "$PEONY_CONFIG" ]; then
    echo "❌ ERROR: Peony configuration not found at: $PEONY_CONFIG"
    exit 1
fi

echo "  ✓ Found Peony configuration"
echo "  → Creating Thunder Breathing variant: Zenitsu-Peony"

# Create a copy of the Peony config
cp "$PEONY_CONFIG" "$ZENITSU_CONFIG"

echo "  ✓ Configuration duplicated successfully"
echo ""

# ============================================================================
# STEP 2: CREATE THUNDER BREATHING THEMED MODULES
# ============================================================================
echo "⚡ [2/3] Infusing Thunder Breathing Icons..."

# Create a custom Zenitsu modules file with Thunder Breathing themed icons
cat > "$ZENITSU_MODULES" << 'MODULESEOF'
//* ---- ⚡ ZENITSU THEME - THUNDER BREATHING MODULES ⚡ ---- *//
/* Waybar Modules with Electrifying Icons */

{

"temperature": {
	"interval": 10,
	"tooltip": true,
	"hwmon-path": [
		"/sys/class/hwmon/hwmon1/temp1_input",
		"/sys/class/thermal/thermal_zone0/temp"
	],
	"critical-threshold": 82,
	"format-critical": "{temperatureC}°C ",
	"format": "{temperatureC}°C ",
	"format-icons": [
		""
	],
	"on-click-right": "$HOME/.config/hypr/scripts/WaybarScripts.sh --nvtop"
},

"backlight": {
	"interval": 2,
	"align": 0,
	"rotate": 0,
	"format-icons": [
		" ",
		" ",
		" ",
		" ",
		" ",
		" ",
		" "
	],
	"format": "{icon}",
	"tooltip-format": "⚡ Brightness {percent}%",
	"icon-size": 10,
	"on-click": "",
	"on-click-middle": "",
	"on-click-right": "",
	"on-update": "",
	"on-scroll-up": "$HOME/.config/hypr/scripts/Brightness.sh --inc",
	"on-scroll-down": "$HOME/.config/hypr/scripts/Brightness.sh --dec",
	"smooth-scrolling-threshold": 1,
},

"battery": {
	"align": 0,
	"rotate": 0,
	"full-at": 100,
	"design-capacity": false,
	"states": {
		"good": 95,
		"warning": 30,
		"critical": 15
	},
	"format": "{icon} {capacity}%",
	"format-charging": "  {capacity}%",
	"format-plugged": "  {capacity}%",
	"format-alt-click": "click",
	"format-full": "  Full",
	"format-alt": "{icon} {time}",
	"format-icons": [
		"󰂎", "󰁺", "󰁻", "󰁼", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁", "󰂂", "󰁹"
	],
	"format-time": "{H}h {M}min",
	"tooltip": true,
	"tooltip-format": "⚡ {timeTo} {power}w",
	"on-click-middle": "$HOME/.config/hypr/scripts/ChangeBlur.sh",
	"on-click-right": "$HOME/.config/hypr/scripts/Wlogout.sh",
},

"bluetooth": {
	"format": " ",
	"format-disabled": "󰂳",
	"format-connected": "󰂱 {num_connections}",
	"tooltip-format": " {device_alias}",
	"tooltip-format-connected": "{device_enumerate}",
	"tooltip-format-enumerate-connected": " {device_alias} 󰂄{device_battery_percentage}%",
	"tooltip": true,
	"on-click": "blueman-manager",
},

"clock": {
	"interval": 1,
    "format": "  {:%H:%M:%S}",
	"format-alt": "  {:%H:%M   %Y, %d %B, %A}",
	"tooltip-format": "<tt><small>{calendar}</small></tt>",
	"calendar": {
		"mode": "month",
		"format": {
			"today": "<span color='#a6e3a1'><b>{}</b></span>"
		}
	}
},

"clock#2": {
    "format": "   {:%H:%M}",
    "format-alt": "{:%A  |  %H:%M  |  %e %B}",
    "tooltip-format": "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>"
},

"clock#3": {
    "format": "{:%H:%M - %d/%b}",
    "tooltip-format": "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>"
},

"clock#4": {
    "format": "{:%B | %a %d, %Y | %H:%M}",
	"format-alt": "{:%a %b %d, %G}",
	"tooltip-format": "<big>{:%B %Y}</big>\n<tt><small>{calendar}</small></tt>",
},

"clock#5": {
    "format": "{:%a %d | %H:%M}",
	"format-alt": "{:%A, %d %B, %Y (%R)}",
	"tooltip-format": "<big>{:%B %Y}</big>\n<tt><small>{calendar}</small></tt>",
},

"cpu": {
	"format": "{usage}% ",
	"interval": 1,
	"min-length": 6,
	"format-alt-click": "click",
	"format-alt": "{icon0}{icon1}{icon2}{icon3} {usage:>2}% ",
	"format-icons": [
		"▁", "▂", "▃", "▄", "▅", "▆", "▇", "█"
	],
	"on-click-right": "$HOME/.config/hypr/scripts/WaybarScripts.sh --btop"
},

"disk": {
	"interval": 30,
	"format": "󰋊",
	"path": "/",
	"tooltip": true,
	"unit": "GB",
	"tooltip-format": "⚡ {path}\n{used} / {total} used\n{percentage_used}% Used\n{free} Free"
},

"hyprland/language": {
	"format": "  {}",
	"min-length": 5,
	"tooltip": false,
	"on-click": "$scriptsDir/SwitchKeyboardLayout.sh"
},

"hyprland/submap": {
	"format": "<span style=\"italic\">  {}</span>",
	"tooltip": false
},

"hyprland/window": {
	"format": "{}",
	"max-length": 360,
	"separate-outputs": true,
	"offscreen-css": true,
	"offscreen-css-text": "(inactive)",
	"rewrite": {
		"(.*) — Mozilla Firefox": " $1",
		"(.*) - fish": " [$1]",
		"(.*) - zsh": " [$1]",
		"(.*) - kitty": " [$1]"
	}
},

"memory": {
	"interval": 10,
	"format": "{used:0.1f}G ",
	"format-alt": "{percentage}% ",
	"format-alt-click": "click",
	"tooltip": true,
	"tooltip-format": "⚡ RAM: {used:0.1f}GB / {total:0.1f}GB\n{percentage}% Used",
	"on-click-right": "$HOME/.config/hypr/scripts/WaybarScripts.sh --btop"
},

"mpris": {
	"interval": 10,
	"format": "{player_icon} ",
	"format-paused": "{status_icon} <i>{dynamic}</i>",
	"on-click-middle": "playerctl play-pause",
	"on-click": "playerctl previous",
	"on-click-right": "playerctl next",
	"scroll-step": 5.0,
	"on-scroll-up": "$HOME/.config/hypr/scripts/Volume.sh --inc",
	"on-scroll-down": "$HOME/.config/hypr/scripts/Volume.sh --dec",
	"smooth-scrolling-threshold": 1,
	"player-icons": {
		"chromium": "",
		"default": "",
		"firefox": "",
		"kdeconnect": "",
		"mopidy": "",
		"mpv": "󰐹",
		"spotify": "",
		"vlc": "󰕼",
	},
	"status-icons": {
		"paused": "󰐎",
		"playing": "",
		"stopped": ""
	},
	"max-length": 30
},

"network": {
	"format": "{ifname}",
	"format-wifi": "{icon}",
	"format-ethernet": " ",
	"format-disconnected": " ",
	"tooltip-format": "⚡ {ipaddr}  {bandwidthUpBits}  {bandwidthDownBits}",
	"format-linked": "󰈁 {ifname} (No IP)",
	"tooltip-format-wifi": "⚡ {essid} {icon} {signalStrength}%",
	"tooltip-format-ethernet": "⚡ {ifname} ",
	"tooltip-format-disconnected": " Disconnected",
	"max-length": 30,
	"format-icons": [
		" ", " ", " ", " ", " "
	],
	"on-click-right": "$HOME/.config/hypr/scripts/WaybarScripts.sh --nmtui"
},

"privacy": {
	"icon-spacing": 4,
	"icon-size": 18,
	"transition-duration": 250,
	"modules": [
		{
			"type": "screenshare",
			"tooltip": true,
			"tooltip-icon-size": 24
		},
		{
			"type": "audio-out",
			"tooltip": true,
			"tooltip-icon-size": 24
		},
		{
			"type": "audio-in",
			"tooltip": true,
			"tooltip-icon-size": 24
		}
	]
},

"pulseaudio": {
	"format": "{icon} {volume}%",
	"format-bluetooth": "{icon}  {volume}%",
	"format-muted": "󰖁",
	"format-icons": {
		"headphone": "",
		"hands-free": "",
		"headset": "",
		"phone": "",
		"portable": "",
		"car": "",
		"default": [
			"", " ", " ",  " "
		],
		"ignored-sinks": [
			"Easy Effects Sink"
		],
	},
	"scroll-step": 5.0,
	"on-click": "$HOME/.config/hypr/scripts/Volume.sh --toggle",
	"on-click-right": "pavucontrol -t 3",
	"on-scroll-up": "$HOME/.config/hypr/scripts/Volume.sh --inc",
	"on-scroll-down": "$HOME/.config/hypr/scripts/Volume.sh --dec",
	"tooltip-format": "⚡ {icon} {volume}% {desc}",
	"smooth-scrolling-threshold": 1
},

"pulseaudio#2": {
	"format": "{icon}",
	"format-bluetooth": "{icon}",
	"format-muted": "󰖁",
	"format-icons": {
		"headphone": "",
		"hands-free": "",
		"headset": "",
		"phone": "",
		"portable": "",
		"car": "",
		"default": [
			"", " ", " ",  " "
		],
		"ignored-sinks": [
			"Easy Effects Sink"
		],
	},
	"scroll-step": 5.0,
	"on-click": "$HOME/.config/hypr/scripts/Volume.sh --toggle",
	"on-click-right": "pavucontrol -t 3",
	"on-scroll-up": "$HOME/.config/hypr/scripts/Volume.sh --inc",
	"on-scroll-down": "$HOME/.config/hypr/scripts/Volume.sh --dec",
	"tooltip-format": "⚡ {icon} {volume}% {desc}",
	"smooth-scrolling-threshold": 1
},

"tray": {
	"icon-size": 18,
	"spacing": 4
},

"wireplumber": {
	"format": "{icon} {volume} %",
	"format-muted": " Mute",
	"on-click": "$HOME/.config/hypr/scripts/Volume.sh --toggle",
	"on-click-right": "pavucontrol -t 3",
	"on-scroll-up": "$HOME/.config/hypr/scripts/Volume.sh --inc",
	"on-scroll-down": "$HOME/.config/hypr/scripts/Volume.sh --dec",
	"format-icons": [" ", " ", " "]
},

}
MODULESEOF

echo "  ✓ Thunder Breathing icons infused:"
echo "    • Network:  (Lightning Wifi)"
echo "    • Battery:  (Thunder Charge)"
echo "    • Brightness:  (Flash Control)"
echo "    • Temperature:  (Electric Heat)"
echo "    • Volume:  (Thunder Sound)"
echo "    • Clock:  (Time Flash)"
echo "    • CPU:  (Electric Power)"
echo "    • Memory:  (Energy Core)"
echo ""

# ============================================================================
# STEP 3: UPDATE ZENITSU CONFIG TO USE CUSTOM MODULES
# ============================================================================
echo "🔧 [3/3] Configuring Zenitsu-Peony Layout..."

# Update the Zenitsu config to include the new Thunder Breathing modules
sed -i 's|"$HOME/.config/waybar/Modules"|"$HOME/.config/waybar/ZenitsuModules"|g' "$ZENITSU_CONFIG"

# Add a Thunder Breathing header comment
sed -i '1i//* ⚡⚡⚡ ZENITSU THEME - THUNDER BREATHING ⚡⚡⚡ *//\n//* Thunder Breathing: First Form - Thunderclap and Flash! *//\n' "$ZENITSU_CONFIG"

echo "  ✓ Zenitsu-Peony configuration updated"
echo "  ✓ Custom Thunder Breathing modules linked"
echo ""

# ============================================================================
# CREATE CUSTOM MODULES FOR ADDITIONAL THEMING
# ============================================================================
echo "⚡ Creating Additional Thunder Breathing Custom Modules..."

CUSTOM_MODULES="$HOME/.config/waybar/ZenitsuModulesCustom"

cat > "$CUSTOM_MODULES" << 'CUSTOMEOF'
//* ---- ⚡ ZENITSU THEME - THUNDER BREATHING CUSTOM MODULES ⚡ ---- *//

{

"custom/menu": {
	"format": " ",
	"tooltip": false,
	"on-click": "$HOME/.config/hypr/scripts/Menu.sh",
	"on-click-right": "$HOME/.config/hypr/scripts/ChangeLayout.sh"
},

"custom/power": {
	"format": "  ⏻ ",
	"tooltip": true,
	"on-click": "$HOME/.config/hypr/scripts/Wlogout.sh",
	"tooltip-format": "⚡ Power Menu"
},

"custom/lock": {
	"format": " ",
	"tooltip": true,
	"on-click": "$HOME/.config/hypr/scripts/LockScreen.sh",
	"tooltip-format": "⚡ Lock Screen"
},

"custom/updater": {
	"format": "  ",
	"exec": "$HOME/.config/hypr/scripts/systemupdate.sh",
	"on-click": "$HOME/.config/hypr/scripts/systemupdate.sh up",
	"interval": 300,
	"tooltip": true,
	"tooltip-format": "⚡ System Updates",
	"return-type": "json"
},

"custom/cycle_wall": {
	"format": " ",
	"on-click": "$HOME/.config/hypr/UserScripts/WallpaperRandom.sh",
	"on-click-right": "$HOME/.config/hypr/UserScripts/WallpaperSelect.sh",
	"on-click-middle": "$HOME/.config/hypr/scripts/WaybarStyles.sh",
	"tooltip": true,
	"tooltip-format": "⚡ Wallpaper Cycling"
},

"custom/light_dark": {
	"format": " ",
	"on-click": "$HOME/.config/hypr/scripts/DarkLight.sh",
	"on-click-right": "$HOME/.config/hypr/scripts/Refresh.sh",
	"tooltip": true,
	"tooltip-format": "⚡ Theme Toggle"
},

"custom/keybindhint": {
	"format": "󰺁 ",
	"tooltip": true,
	"on-click": "$HOME/.config/hypr/scripts/KeyHints.sh",
	"tooltip-format": "⚡ Keybind Hints"
},

"custom/separator#dot": {
	"format": "",
	"interval": "once",
	"tooltip": false
},

"custom/separator#line": {
	"format": "|",
	"interval": "once",
	"tooltip": false
},

"custom/separator#blank": {
	"format": "",
	"interval": "once",
	"tooltip": false
},

"custom/separator#blank_2": {
	"format": "  ",
	"interval": "once",
	"tooltip": false
},

"custom/separator#blank_3": {
	"format": "   ",
	"interval": "once",
	"tooltip": false
}

}
CUSTOMEOF

# Update Zenitsu config to use custom modules too
sed -i 's|"$HOME/.config/waybar/ModulesCustom"|"$HOME/.config/waybar/ZenitsuModulesCustom"|g' "$ZENITSU_CONFIG"

echo "  ✓ Custom Thunder Breathing modules created"
echo ""

# ============================================================================
# STEP 4: CREATE THUNDER BREATHING WAYBAR STYLE (CSS)
# ============================================================================
echo "🎨 [4/4] Creating Thunder Breathing Visual Style..."

ZENITSU_STYLE="$HOME/.config/waybar/style/⚡ [Zenitsu] Thunder Breathing.css"

cat > "$ZENITSU_STYLE" << 'CSSEOF'
/* ---- ⚡ ZENITSU THEME - THUNDER BREATHING STYLE ⚡ ---- */
/* Thunder Breathing: First Form - Thunderclap and Flash! */

* {
font-family: "FantasqueSansM Nerd Font";
font-weight: bold;
min-height: 0;
font-size: 98%;
font-feature-settings: '"zero", "ss01", "ss02", "ss03", "ss04", "ss05", "cv31"';
}

/* Zenitsu Theme Colors */
@define-color haori_orange #FFA237;
@define-color haori_shadow #B57436;
@define-color thunder_yellow #FFE66D;
@define-color lightning_white #FFFFFF;
@define-color thunder_gold #F4D03F;
@define-color electric_blue #3498DB;
@define-color dark_bg #1a1a1a;
@define-color darker_bg #0d0d0d;
@define-color text_bright #FFFFFF;
@define-color text_dimmed #E0E0E0;

window#waybar {
  transition-property: background-color;
  transition-duration: 0.5s;
  border-top: 2px solid @haori_orange;
  border-bottom: 3px solid @thunder_yellow;
  background: alpha(@darker_bg, 0.85);
  border-radius: 10px;
  color: @text_bright;
}

window#waybar.hidden {
  opacity: 0.3;
}

/* ========== WORKSPACES - THUNDER BREATHING ========== */
#taskbar button,
#workspaces button {
    box-shadow: rgba(255, 162, 55, 0.3) 0px 2px 8px;
	text-shadow: 0 0 5px rgba(255, 230, 109, 0.5);
    padding: 4px 8px;
    margin: 2px;
    border-radius: 10px;
    color: @text_bright;
    background: alpha(@dark_bg, 0.6);
    border: 1px solid @haori_shadow;
    transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
    font-weight: bold;
}

#taskbar button:hover,
#workspaces button:hover {
	border-radius: 10px;
	color: @thunder_yellow;
	background: alpha(@haori_shadow, 0.8);
 	padding-left: 10px;
    padding-right: 10px;
    border: 2px solid @haori_orange;
    box-shadow: 0 0 15px rgba(255, 162, 55, 0.6);
    text-shadow: 0 0 8px rgba(255, 230, 109, 0.8);
    transition: all 0.2s ease;
}

#workspaces button.persistent {
	color: @text_dimmed;
	border-radius: 10px;
	background: alpha(@dark_bg, 0.4);
}

#taskbar button.active,
#workspaces button.active {
	color: @darker_bg;
  	background: linear-gradient(135deg, @haori_orange 0%, @thunder_yellow 100%);
    border-radius: 10px;
    padding-left: 12px;
    padding-right: 12px;
    border: 2px solid @thunder_yellow;
    box-shadow: 0 0 20px rgba(255, 230, 109, 0.8), inset 0 0 10px rgba(255, 255, 255, 0.2);
    text-shadow: 0 0 5px rgba(13, 13, 13, 0.8);
    font-weight: bolder;
    transition: all 0.3s ease;
}

#workspaces button.urgent {
	color: @thunder_yellow;
 	background: #E74C3C;
    border: 2px solid @thunder_yellow;
    animation: urgent_flash 1s ease infinite;
}

@keyframes urgent_flash {
    0%, 100% { box-shadow: 0 0 10px rgba(231, 76, 60, 0.8); }
    50% { box-shadow: 0 0 25px rgba(255, 230, 109, 1); }
}

/* ========== MODULE STYLING ========== */
#backlight,
#battery,
#bluetooth,
#clock,
#cpu,
#disk,
#memory,
#mpris,
#network,
#pulseaudio,
#temperature,
#tray,
#custom-menu,
#custom-power,
#custom-lock,
#custom-updater,
#custom-cycle_wall,
#custom-light_dark,
#custom-keybindhint {
    padding: 4px 12px;
    margin: 2px 3px;
    border-radius: 8px;
    background: alpha(@dark_bg, 0.7);
    color: @text_bright;
    border: 1px solid @haori_shadow;
    font-weight: bold;
    text-shadow: 0 0 3px rgba(0, 0, 0, 0.8);
}

/* ========== BATTERY - THUNDER CHARGE ========== */
#battery {
    color: @thunder_yellow;
    border-color: @haori_orange;
}

#battery.charging {
    color: @darker_bg;
    background: linear-gradient(90deg, @haori_orange 0%, @thunder_yellow 100%);
    border: 2px solid @thunder_yellow;
    box-shadow: 0 0 15px rgba(255, 230, 109, 0.7);
    animation: thunder_pulse 2s ease infinite;
}

@keyframes thunder_pulse {
    0%, 100% { box-shadow: 0 0 10px rgba(255, 230, 109, 0.5); }
    50% { box-shadow: 0 0 20px rgba(255, 230, 109, 1); }
}

#battery.warning:not(.charging) {
    color: @thunder_yellow;
    background: #E67E22;
    border-color: @thunder_yellow;
}

#battery.critical:not(.charging) {
    color: @lightning_white;
    background: #E74C3C;
    border-color: @thunder_yellow;
    animation: critical_flash 0.5s ease infinite;
}

@keyframes critical_flash {
    0%, 100% { opacity: 1; }
    50% { opacity: 0.6; }
}

/* ========== NETWORK - LIGHTNING WIFI ========== */
#network {
    color: @thunder_yellow;
    border-color: @electric_blue;
}

#network.disconnected {
    color: #95A5A6;
    background: alpha(@dark_bg, 0.5);
}

#network.wifi {
    background: linear-gradient(135deg, alpha(@electric_blue, 0.3) 0%, alpha(@haori_orange, 0.3) 100%);
}

/* ========== PULSEAUDIO - THUNDER SOUND ========== */
#pulseaudio {
    color: @thunder_yellow;
    border-color: @haori_orange;
}

#pulseaudio.muted {
    color: #95A5A6;
    background: alpha(@dark_bg, 0.5);
    text-decoration: line-through;
}

/* ========== BACKLIGHT - FLASH BRIGHTNESS ========== */
#backlight {
    color: @thunder_yellow;
    border-color: @thunder_gold;
}

/* ========== TEMPERATURE - ELECTRIC HEAT ========== */
#temperature {
    color: @haori_orange;
    border-color: @haori_shadow;
}

#temperature.critical {
    color: @lightning_white;
    background: #E74C3C;
    border: 2px solid @thunder_yellow;
    animation: temp_warning 1s ease infinite;
}

@keyframes temp_warning {
    0%, 100% { box-shadow: 0 0 5px rgba(231, 76, 60, 0.5); }
    50% { box-shadow: 0 0 15px rgba(255, 230, 109, 0.8); }
}

/* ========== CLOCK - TIME LIGHTNING ========== */
#clock {
    color: @thunder_yellow;
    background: alpha(@haori_orange, 0.3);
    border: 2px solid @haori_orange;
    font-weight: bolder;
    padding: 4px 16px;
    box-shadow: 0 0 10px rgba(255, 162, 55, 0.4);
}

/* ========== CPU & MEMORY - ELECTRIC POWER ========== */
#cpu,
#memory {
    color: @electric_blue;
    border-color: @haori_orange;
}

#cpu.warning,
#memory.warning {
    color: @thunder_yellow;
    background: alpha(@haori_orange, 0.5);
}

#cpu.critical,
#memory.critical {
    color: @lightning_white;
    background: #E74C3C;
}

/* ========== MPRIS - MEDIA PLAYER ========== */
#mpris {
    color: @thunder_yellow;
    border-color: @haori_orange;
    padding: 4px 14px;
}

#mpris.paused {
    color: @text_dimmed;
    background: alpha(@dark_bg, 0.5);
}

/* ========== TRAY ========== */
#tray {
    background: alpha(@dark_bg, 0.6);
    border-color: @haori_shadow;
}

#tray > .passive {
    -gtk-icon-effect: dim;
}

#tray > .needs-attention {
    -gtk-icon-effect: highlight;
    border: 2px solid @thunder_yellow;
    box-shadow: 0 0 10px @thunder_yellow;
}

/* ========== CUSTOM MODULES ========== */
#custom-power {
    color: @thunder_yellow;
    background: alpha(#E74C3C, 0.3);
    border: 2px solid @haori_orange;
    font-size: 105%;
}

#custom-power:hover {
    color: @darker_bg;
    background: linear-gradient(135deg, #E74C3C 0%, @haori_orange 100%);
    box-shadow: 0 0 15px rgba(231, 76, 60, 0.8);
}

#custom-lock {
    color: @thunder_yellow;
    border-color: @haori_orange;
}

#custom-updater {
    color: @electric_blue;
    border-color: @haori_orange;
}

#custom-cycle_wall {
    color: @haori_orange;
    border-color: @thunder_yellow;
}

#custom-menu {
    color: @thunder_yellow;
    background: alpha(@haori_orange, 0.3);
    border: 2px solid @haori_orange;
    padding: 4px 14px;
}

/* ========== TOOLTIP ========== */
tooltip {
    background: alpha(@darker_bg, 0.95);
    border: 2px solid @haori_orange;
    border-radius: 8px;
    color: @thunder_yellow;
    text-shadow: 0 0 3px rgba(0, 0, 0, 0.9);
}

tooltip label {
    color: @text_bright;
    font-weight: bold;
}

/* ========== SEPARATORS ========== */
#custom-separator {
    color: @haori_shadow;
    background: transparent;
    border: none;
}
CSSEOF

echo "  ✓ Thunder Breathing visual style created"
echo "  ✓ Enhanced visibility with strong Zenitsu colors:"
echo "    • Haori Orange: #FFA237 (primary accent)"
echo "    • Thunder Yellow: #FFE66D (highlights & text)"
echo "    • Lightning White: #FFFFFF (maximum visibility)"
echo "    • Electric Blue: #3498DB (electric accents)"
echo "  ✓ Bold, shadowed text for maximum readability"
echo "  ✓ Glowing effects for active elements"
echo ""

# ============================================================================
# FINAL SUMMARY
# ============================================================================
echo "╔════════════════════════════════════════════════════════════╗"
echo "║        ⚡ THUNDER BREATHING THEME INSTALLED! ⚡            ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
echo "✨ WHAT WAS CREATED:"
echo "  ✓ New Waybar Layout: '⚡ [BOT] Zenitsu-Peony'"
echo "  ✓ Thunder Breathing Modules: ZenitsuModules"
echo "  ✓ Custom Thunder Icons: ZenitsuModulesCustom"
echo "  ✓ Thunder Breathing Style: '⚡ [Zenitsu] Thunder Breathing.css'"
echo "  ✓ Original Peony layout preserved"
echo ""
echo "⚡ ELECTRIFYING ICON CHANGES:"
echo "  • Network:  → Lightning Wifi signals"
echo "  • Battery:  → Thunder Charge indicator"
echo "  • Brightness:  → Flash brightness control"
echo "  • Temperature:  → Electric heat sensor"
echo "  • Volume:  → Thunder sound waves"
echo "  • Clock:  → Time lightning flash"
echo "  • Power Menu:  → Thunder power"
echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║              🎯 ACTIVATION INSTRUCTIONS 🎯                 ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
echo "To activate your new electrifying Thunder Breathing theme:"
echo ""
echo "  STEP 1 - Activate the Layout:"
echo "    • Press:  SUPER + ALT + B"
echo "    • Select: '⚡ [BOT] Zenitsu-Peony'"
echo "    • Press Enter to apply"
echo ""
echo "  STEP 2 - Apply the Thunder Breathing Style:"
echo "    • Press:  SUPER + CTRL + B"
echo "    • Select: '⚡ [Zenitsu] Thunder Breathing'"
echo "    • Press Enter to apply"
echo ""
echo "  STEP 3 - Reload Waybar:"
echo "    • Press:  SUPER + ALT + R"
echo "    • Your Thunder Breathing theme is now fully active!"
echo ""
echo "💡 ADDITIONAL COMMANDS:"
echo "  • Reload Waybar anytime:  SUPER + ALT + R"
echo "  • Switch Waybar style:    SUPER + CTRL + B"
echo "  • Toggle Waybar:          SUPER + CTRL + ALT + B"
echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║   ⚡ Thunder Breathing: First Form - Thunderclap! ⚡       ║"
echo "║          Your desktop now channels lightning!             ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
