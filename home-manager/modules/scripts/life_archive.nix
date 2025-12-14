{ pkgs }:
pkgs.writeShellScriptBin "life_archive" ''
  OUT_DIR="/home/toonzzzrock/Pictures/LifeArchive"
  FLAG_FILE="$OUT_DIR/flag.txt"

  # Read the flag file and trim whitespace
  flag=$(tr -d '[:space:]' < "$FLAG_FILE")

  # Exit early if flag is not 'true'
  if [ "$flag" != "true" ]; then
      exit 0
  fi

  # Take screenshot
  grim -t jpeg -q 100 -c "$OUT_DIR/$(date +"%Y-%m-%d_%H-%M").jpeg"

''
