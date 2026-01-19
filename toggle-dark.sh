#!/usr/bin/env bash
set -euo pipefail

FILE="$HOME/.config/cosmic/com.system76.CosmicTheme.Mode/v1/is_dark"

# Check if the file exists first
if [ ! -f "$FILE" ]; then
    echo "Error: COSMIC theme file not found. Are you using the COSMIC desktop?"
    exit 1
fi
if [ "$(cat "$FILE")" = "true" ]; then
    echo "false" > "$FILE"
    TITLE="Light Mode"
    MSG="Day mode activated"
    ICON="weather-clear"
else
    echo "true" > "$FILE"
    TITLE="Dark Mode"
    MSG="Night mode activated"
    ICON="weather-clear-night-symbolic"
fi

# The GDBus Notification Call
gdbus call --session \
    --dest org.freedesktop.Notifications \
    --object-path /org/freedesktop/Notifications \
    --method org.freedesktop.Notifications.Notify \
    "Theme Switcher" \
    0 \
    "$ICON" \
    "$TITLE" \
    "$MSG" \
    [] \
    "{'transient': <true>}" \
    3000 >/dev/null 2>&1