{pkgs}:
pkgs.writeShellScriptBin "life_archive_toggle" ''
  FLAG_FILE="/home/toonzzzrock/Pictures/LifeArchive/flag.txt"
  mkdir -p "$(dirname "$FLAG_FILE")"
  if [ ! -f "$FLAG_FILE" ]; then
    echo "false" > "$FLAG_FILE"
  fi
  flag=$(tr -d '[:space:]' < "$FLAG_FILE")
  if [ "$flag" = "true" ]; then
    echo "false" > "$FLAG_FILE"
  else
    echo "true" > "$FLAG_FILE"
  fi
''