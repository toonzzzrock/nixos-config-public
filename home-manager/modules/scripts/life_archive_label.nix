{ pkgs }:
pkgs.writeShellScriptBin "life_archive_label" ''
  OUT_DIR="/home/toonzzzrock/Pictures/LifeArchive"
  FLAG_FILE="$OUT_DIR/flag.txt"
  LABEL_DIR="/home/toonzzzrock/Pictures/LifeArchiveLabel"

  mkdir -p "$OUT_DIR" "$LABEL_DIR"
  if [ ! -f "$FLAG_FILE" ]; then
    echo "false" > "$FLAG_FILE"
  fi

  # Read the flag file and trim whitespace
  flag=$(tr -d '[:space:]' < "$FLAG_FILE")

  # Exit early if flag is not 'true'
  if [ "$flag" != "true" ]; then
      exit 0
  fi

  # Save a Hyprland client snapshot to a per-day JSON file.
  DAY="$(date +"%Y-%m-%d")"
  CAPTURE_TIME="$(date +"%H_%M_%S")"
  DAY_JSON="$LABEL_DIR/$DAY.json"

  if command -v hyprctl >/dev/null 2>&1; then
      NEW_DATA=$(hyprctl -j clients | ${pkgs.jq}/bin/jq -c 'map({class: .class, title: .title})')

      if [ -f "$DAY_JSON" ]; then
          ${pkgs.jq}/bin/jq --arg day "$DAY" --arg time "$CAPTURE_TIME" --argjson data "$NEW_DATA" '
              if type == "object" and has("captures") then
                  .captures[$time] = $data
              else
                  {date: $day, captures: {($time): $data}}
              end
          ' "$DAY_JSON" > "$DAY_JSON.tmp" && mv "$DAY_JSON.tmp" "$DAY_JSON"
      else
          ${pkgs.jq}/bin/jq -n --arg day "$DAY" --arg time "$CAPTURE_TIME" --argjson data "$NEW_DATA" \
              '{date: $day, captures: {($time): $data}}' > "$DAY_JSON"
      fi
  fi
''
