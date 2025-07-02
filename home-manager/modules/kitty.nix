{lib, ...}: {
 programs.kitty = lib.mkForce {
  enable = true;
  font = {
    name = "JetBrainsMono Nerd Font";
    size = 15;
  };
  settings = {
    confirm_os_window_close = 0;
    dynamic_background_opacity = true;
    enable_audio_bell = false;
    mouse_hide_wait = "-1.0";
    window_padding_width = 10;
    background_opacity = "0.5";
    background_blur = 8;
    background = "#0D0D18";

  };
  # Add this line for the key mapping
  extraConfig = ''
    map ctrl+v paste_from_clipboard
  '';
 };
}