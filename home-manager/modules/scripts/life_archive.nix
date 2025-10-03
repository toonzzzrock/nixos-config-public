{pkgs}: 
pkgs.writeShellScriptBin "life_archive" ''
    OUT_DIR="/home/toonzzzrock/Pictures/LifeArchive"
    FLAG_FILE="$OUT_DIR/flag.txt"
    JSON_LOG="$OUT_DIR/window_log.json"

    # Read the flag file and trim whitespace
    flag=$(tr -d '[:space:]' < "$FLAG_FILE")

    # Exit early if flag is not 'true'
    if [ "$flag" != "true" ]; then
        exit 0
    fi

    # Take screenshot
    grim -t jpeg -q 100 -c "$OUT_DIR/$(date +"%Y-%m-%d_%H-%M").jpeg"

    # # Timestamp for window log
    # timestamp=$(date +"%Y-%m-%dT%H:%M")

    # # Remove "class: " prefix and trim whitespace/tabs
    # class_list=$(hyprctl clients | grep "title: " | awk '{gsub("title: ", ""); gsub(/^[ \t]+|[ \t]+$/, ""); print}')

    # # Convert list to JSON array
    # json_classes=$(echo "$class_list" | jq -R . | jq -s .)

    # # Build entry
    # entry=$(jq -n --arg time "$timestamp" --argjson classes "$json_classes" '{timestamp: $time, windows: $classes}')

    # # Ensure the log file exists
    # if [ ! -f "$JSON_LOG" ]; then
    #     echo "[]" > "$JSON_LOG"
    # fi

    # # Append entry
    # tmp=$(mktemp)
    # jq ". + [$entry]" "$JSON_LOG" > "$tmp" && mv "$tmp" "$JSON_LOG"
  ''