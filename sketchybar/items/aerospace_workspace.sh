#!/usr/bin/env bash

# Workspace names
get_workspace_name() {
    case "$1" in
    "1") echo "Web" ;;
    "2") echo "Misc" ;;
    "3") echo "Code" ;;
    "4") echo "Media" ;;
    *) echo "$1" ;; # Default to SID
    esac
}

# Workspace icons
get_workspace_icon() {
    case "$1" in
    "1") echo "󰖟 " ;;
    "2") echo "󰯉 " ;;
    "3") echo " " ;;
    "4") echo "󰝚" ;;
    *) echo " " ;; # Default icon
    esac
}

sketchybar --add event aerospace_workspace_change

# Styling
spaces=(
    label.padding_left=0
    label.padding_right=6
)

# Retrieve the current focused workspace
FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)

for SID in $(aerospace list-workspaces --all); do
    # Get the name and icon for the workspace
    WORKSPACE_NAME=$(get_workspace_name "$SID")
    WORKSPACE_ICON=$(get_workspace_icon "$SID")

    sketchybar --add item space."$SID" left \
        --subscribe space."$SID" aerospace_workspace_change \
        --set space."$SID" "${spaces[@]}" \
        label="$WORKSPACE_NAME" \
        icon="$WORKSPACE_ICON" \
        click_script="aerospace workspace $SID; sketchybar --trigger aerospace_workspace_change" \
        script="FOCUSED_WORKSPACE=$FOCUSED_WORKSPACE $CONFIG_DIR/plugins/aerospace_workspace.sh $SID"
done
