{ pkgs }:
pkgs.writeShellScriptBin "memorize" ''

  # check if rofi is already running
  if pidof rofi > /dev/null; then
    pkill rofi
  fi

  MEMORY_FILE="/etc/nixos/memorize/memory.json"

  # Ensure memory.json exists and is valid
  if [ ! -f "$MEMORY_FILE" ]; then
    echo "{}" > "$MEMORY_FILE"
  fi

  # Validate JSON format
  if ! jq empty "$MEMORY_FILE" 2>/dev/null; then
    echo "{}" > "$MEMORY_FILE"
  fi

  # Extract keys and values from memory.json
  gen_list() {
    jq -r 'to_entries[] | "\(.key) \(.value)"' "$MEMORY_FILE"
  }

  main() {
    # Pass the list of keys and values to rofi
    selection=$( (gen_list) | ${pkgs.rofi}/bin/rofi -dmenu -config ~/.config/rofi/config-long.rasi -p "Memory Search" )

    if [[ -n "$selection" ]]; then
      # Extract the value from the selected entry
      value=$(echo "$selection" | awk '{print substr($0, index($0,$2))}')

      if [[ -n "$value" ]]; then
        # copy the value to the clipboard with wl-copy save to 
        echo -n "$value" | wl-copy

      fi
    fi
  }

  main

  exit 0
''
