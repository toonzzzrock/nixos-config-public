{
  pkgs,
  inputs,
  system,
  ...
}:
{
  home.packages = [
    (inputs.hyprpaper.packages.${pkgs.system}.default)
    (inputs.zen-browser.packages."${system}".twilight.override {
      nativeMessagingHosts = [ pkgs.firefoxpwa ];
    })
  ];
}
