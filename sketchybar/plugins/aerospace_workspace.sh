CURRENT_FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)

# Determine state and update settings
if [ "$1" = "$CURRENT_FOCUSED_WORKSPACE" ]; then
    sketchybar --set "$NAME" \
        # background.drawing=on \
        # icon.color="" \
        # label.color=""
else
    sketchybar --set "$NAME" \
        # background.drawing=off \
        # icon.color="$INA_ICON_COLOR" \
        # label.color=""
fi
