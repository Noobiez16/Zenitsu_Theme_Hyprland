Assignment to-do or modify:

Primero, crea un script simple para ejecutar wofi.
Bash

# ~/.config/waybar/scripts/launch-wofi.sh
#!/bin/bash
wofi --show drun

Asegúrate de que el script sea ejecutable: chmod +x ~/.config/waybar/scripts/launch-wofi.sh.

Paso 2: Añadir el Módulo a config.jsonc

Ahora, define el módulo custom/launcher y añádelo a la sección modules-left. Este módulo mostrará un ícono de rayo (acorde con la temática de Zenitsu) y ejecutará el script al hacer clic.  

Fragmento de código

{
    //... otras configuraciones...
    "modules-left": ["custom/launcher", "hyprland/workspaces"],
    //...

    "custom/launcher": {
        "format": "",
        "on-click": "~/.config/waybar/scripts/launch-wofi.sh",
        "tooltip": false
    },
    //... resto de los módulos...
}

1.2. Un Reloj Profesional con Fecha Detallada

Mejoraremos el reloj para que muestre la hora de forma concisa y, al pasar el ratón por encima, revele la fecha completa y un calendario. Esto se consigue utilizando las propiedades format y tooltip-format.  

Fragmento de código

"clock": {
    "format": " {:%H:%M}",
    "format-alt": " {:%A, %d de %B de %Y}",
    "tooltip-format": "<big>{:%A, %d de %B de %Y}</big>\n<tt><small>{calendar}</small></tt>",
    "locale": "es_ES.UTF-8"
},

    format: Muestra la hora y un icono de reloj.

    format-alt: Un formato alternativo que se puede activar (por ejemplo, al hacer clic).

    tooltip-format: Al pasar el ratón, muestra la fecha completa y un calendario emergente.

    locale: Asegura que el día y el mes se muestren en español.

Parte II: Estilo Profesional y Animaciones

Con la funcionalidad mejorada, nos centraremos en la estética, implementando iconos profesionales, agrupando módulos relacionados y añadiendo la animación de desplazamiento solicitada.

2.1. Iconografía Profesional y Consistente

Para un aspecto pulido, es crucial usar un conjunto de iconos coherente. Recomiendo usar una "Nerd Font" que incluya glifos de Font Awesome. A continuación, se presenta una selección de iconos temáticos y profesionales para los módulos más comunes.  

Módulo	Icono Sugerido	Código
Lanzador		f0e7
Red (WiFi)		f1eb
Red (Ethernet)		f0c1
Bluetooth		f293
Audio		f028
Batería		f240
CPU		f2db
Memoria		f538
Temperatura		f2c9

Estos iconos se implementan en la propiedad format de cada módulo en tu config.jsonc.

2.2. Agrupación de Módulos de Conectividad

Para organizar la barra y darle un aspecto más limpio, agruparemos los módulos de red y Bluetooth en un único contenedor visual. Waybar permite esto a través de los módulos de grupo.  

Paso 1: Definir el Grupo en config.jsonc

Primero, definimos un group/connectivity que contendrá los módulos network y bluetooth, y lo colocamos en modules-right.
Fragmento de código

{
    //...
    "modules-right": ["group/connectivity", "pulseaudio", "cpu", "memory", "battery", "clock", "tray"],

    "group/connectivity": {
        "orientation": "horizontal",
        "modules": [
            "network",
            "bluetooth"
        ]
    },
    //... definiciones de network, bluetooth, etc.
}

Paso 2: Estilizar el Grupo en style.css

Ahora, aplicamos un estilo "píldora" al grupo. Le damos al contenedor del grupo (#group-connectivity) un fondo y bordes redondeados, mientras que a los módulos internos les quitamos sus estilos individuales para que se fusionen visualmente.  

CSS

/* Estilo para el grupo de conectividad */
#group-connectivity {
    background-color: var(--storm-gray);
    border-radius: 10px;
    margin: 2px 0;
}

/* Resetear estilos de los módulos dentro del grupo para que se fusionen */
#group-connectivity #network,
#group-connectivity #bluetooth {
    background-color: transparent;
    padding: 0 10px;
    margin: 0;
}

2.3. Animación de Desplazamiento en Workspaces

Para lograr el efecto de "desplazamiento hacia abajo" al pasar el ratón sobre los botones de los espacios de trabajo, usaremos una transición CSS. Al hacer :hover, aumentaremos ligeramente el margen superior del botón, lo que lo empujará hacia abajo de forma suave.  

CSS

#workspaces button {
    padding: 0 10px;
    color: var(--foreground-alt);
    transition: all 0.3s ease-in-out; /* Transición suave para todos los cambios */
    margin-top: 2px; /* Margen inicial */
}

#workspaces button:hover {
    background: rgba(255, 255, 255, 0.2);
    box-shadow: inherit;
    border-bottom: 3px solid var(--zenitsu-yellow);
    margin-top: 5px; /* Aumenta el margen superior para empujar el botón hacia abajo */
}

Esta técnica crea una sutil pero efectiva respuesta visual a la interacción del usuario.

Parte III: Archivos de Configuración Actualizados

A continuación se presentan los archivos config.jsonc y style.css completos, incorporando todas las mejoras discutidas.

config.jsonc Completo

Fragmento de código

{
    "layer": "top",
    "position": "top",
    "height": 35,
    "spacing": 4,
    "margin-top": 5,
    "margin-left": 10,
    "margin-right": 10,

    "modules-left": ["custom/launcher", "hyprland/workspaces"],
    "modules-center": ["hyprland/window"],
    "modules-right": ["group/connectivity", "pulseaudio", "cpu", "memory", "battery", "clock", "tray"],

    "custom/launcher": {
        "format": "",
        "on-click": "~/.config/waybar/scripts/launch-wofi.sh",
        "tooltip": false
    },

    "hyprland/workspaces": {
        "format": "{icon}",
        "format-icons": {
            "1": "壱", "2": "弐", "3": "参", "4": "肆", "5": "伍",
            "urgent": "!", "default": ""
        },
        "on-click": "activate"
    },

    "hyprland/window": {
        "max-length": 50,
        "separate-outputs": true
    },

    "group/connectivity": {
        "orientation": "horizontal",
        "modules": [
            "network",
            "bluetooth"
        ]
    },

    "network": {
        "format-wifi": " {essid}",
        "format-ethernet": " {ifname}",
        "format-disconnected": "⚠ Desconectado",
        "tooltip-format-wifi": "Señal: {signalStrength}%",
        "on-click": "nm-connection-editor"
    },
    
    "bluetooth": {
        "format": " {status}",
        "format-disabled": "", // Oculta si está deshabilitado
        "format-connected": " {device_alias}",
        "tooltip-format": "{device_alias}",
        "on-click": "blueman-manager"
    },

    "pulseaudio": {
        "format": "{icon} {volume}%",
        "format-muted": " Muted",
        "format-icons": {
            "default": ["", ""]
        },
        "on-click": "pavucontrol"
    },

    "cpu": {
        "format": " {usage}%"
    },

    "memory": {
        "format": " {}%"
    },

    "battery": {
        "states": { "warning": 30, "critical": 15 },
        "format": "{icon} {capacity}%",
        "format-charging": " {capacity}%",
        "format-icons": ["", "", "", "", ""]
    },

    "clock": {
        "format": " {:%H:%M}",
        "format-alt": " {:%A, %d de %B de %Y}",
        "tooltip-format": "<big>{:%A, %d de %B de %Y}</big>\n<tt><small>{calendar}</small></tt>",
        "locale": "es_ES.UTF-8"
    },

    "tray": {
        "icon-size": 18,
        "spacing": 10
    }
}

style.css Completo

CSS

* {
    border: none;
    border-radius: 0;
    font-family: "JetBrainsMono Nerd Font", FontAwesome, sans-serif;
    font-size: 14px;
    min-height: 0;
}

/* Variables de color del tema Zenitsu */
:root {
    --zenitsu-yellow: #F7C873;
    --zenitsu-orange: #FFA500;
    --storm-gray: rgba(50, 50, 50, 0.7);
    --background-trans: rgba(28, 28, 28, 0.8);
    --foreground: #DCDCCC;
    --foreground-alt: #939393;
    --border-color: #F7C873;
}

window#waybar {
    background: var(--background-trans);
    color: var(--foreground);
    border-radius: 12px;
}

#custom-launcher {
    font-size: 18px;
    color: var(--zenitsu-yellow);
    padding: 0 12px;
}

#workspaces button {
    padding: 0 10px;
    color: var(--foreground-alt);
    transition: all 0.3s ease-in-out;
    margin-top: 2px;
    border-bottom: 3px solid transparent;
}

#workspaces button:hover {
    background: rgba(255, 255, 255, 0.1);
    box-shadow: inherit;
    border-bottom: 3px solid var(--zenitsu-yellow);
    margin-top: 5px;
}

#workspaces button.focused {
    color: var(--zenitsu-yellow);
    background-color: var(--storm-gray);
    border-bottom: 3px solid var(--zenitsu-yellow);
    border-radius: 10px;
}

#window {
    padding: 0 15px;
}

#group-connectivity {
    background-color: var(--storm-gray);
    border-radius: 10px;
    margin: 4px 0;
}

#group-connectivity #network,
#group-connectivity #bluetooth {
    background-color: transparent;
    padding: 0 10px;
    margin: 0;
}

#clock, #battery, #cpu, #memory, #network, #pulseaudio, #tray, #bluetooth {
    padding: 0 10px;
    margin: 4px 0;
}

#network.disconnected,
#battery.critical:not(.charging) {
    color: var(--zenitsu-orange);
}
