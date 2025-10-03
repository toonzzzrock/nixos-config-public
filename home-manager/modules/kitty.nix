{ lib, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 15;
    };
    themeFile = "Catppuccin-Mocha";
    settings = {
      confirm_os_window_close = 0;
      dynamic_background_opacity = true;
      enable_audio_bell = false;
      mouse_hide_wait = "-1.0";
      window_padding_width = 10;
      background_opacity = "0.7";
      background_blur = 30;
      background = "#0D0D18";
      cursor_trail = 3;
      image_scaling = "nearest";
    };

    extraConfig = ''
      map ctrl+v paste_from_clipboard
      map ctrl+shift+c copy_to_clipboard
      map ctrl+backspace send_text all \x17
    '';
  };
}
