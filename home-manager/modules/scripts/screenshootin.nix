{ pkgs }:

pkgs.writeShellScriptBin "screenshootin" ''
  mkdir -p "$HOME/Pictures/Screenshots"

  grim -g "$(slurp -w 0)" - | \
    ifne bash -c '
      tee > "$HOME/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png" \
          >(copyq add --format image/png -)
    '
''