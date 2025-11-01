{
  pkgs,
  inputs,
  ...
}:
{
  home.packages = [
    (inputs.hyprpaper.packages.${pkgs.stdenv.hostPlatform.system}.default)
    (inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".twilight.override {
      nativeMessagingHosts = [ pkgs.firefoxpwa ];
    })
  ];
}
