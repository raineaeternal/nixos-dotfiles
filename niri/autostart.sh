#!/usr/bin/env bash
# Give Niri a moment to be up
sleep 0.3

# Reset and make the split
niri msg close-all-splits
niri msg split right
niri msg resize-set width 2560

# Launch apps
alacritty &
discord &
brave &

# Wait for windows to map
sleep 1

# Raw JSON from niri (all windows)
windows=$(niri msg list-windows)

# Extract "id" and "app_id" pairs without jq
# format: id:app_id
pairs=$(echo "$windows" | \
    sed -n 's/.*"id": \([0-9]\+\).*"app_id": "\([^"]*\)".*/\1:\2/p')

# Iterate over each id:app pair
while IFS=: read -r win_id app; do
    case "$app" in
        Alacritty|alacritty|discord)
            # Push into the LEFT split
            niri msg move-window --id="$win_id" --direction=left
            ;;
        brave-browser)
            # Push into the RIGHT split
            niri msg move-window --id="$win_id" --direction=right
            ;;
    esac
done <<< "$pairs"
