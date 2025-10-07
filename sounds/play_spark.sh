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
