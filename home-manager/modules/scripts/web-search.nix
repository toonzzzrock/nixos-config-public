{ pkgs }:
pkgs.writeShellScriptBin "web-search" ''
  # check if rofi is already running
  if pidof rofi > /dev/null; then
    pkill rofi
  fi

  declare -A URLS

  URLS=(
    ["🌎 Search"]="https://search.google.com/search?q="
    ["❄️ 25.05 Packages"]="https://search.nixos.org/packages?channel=25.05&from=0&size=50&sort=relevance&type=packages&query="
    ["🎞️ YouTube"]="https://www.youtube.com/results?search_query="
    ["🦥 Wiki"]="https://www.wikiwand.com/en/search?q="
  )

  # List for rofi
  gen_list() {
    for i in "''${!URLS[@]}"
    do
      echo "$i"
    done
  }

  main() {
    # Pass the list to rofi
    platform=$( (gen_list) | ${pkgs.rofi}/bin/rofi -dmenu -config ~/.config/rofi/config-long.rasi )

    if [[ -n "$platform" ]]; then
      query=$( (echo ) | ${pkgs.rofi}/bin/rofi -dmenu -config ~/.config/rofi/config-long.rasi )

      if [[ -n "$query" ]]; then
        url=''${URLS[$platform]}$query
        xdg-open "$url"
      else
        exit
      fi
    else
      exit
    fi
  }

   main

   exit 0
''
