{
  pkgs,
  inputs,
  ...
}:
let
  ZenBrowser = inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.twilight.override {
    nativeMessagingHosts = [ pkgs.firefoxpwa ];
  };
in

{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/http" = "zen-twilight.desktop";
      "x-scheme-handler/https" = "zen-twilight.desktop";
      "application/x-extension-shtml" = "zen-twilight.desktop";
      "application/x-extension-xhtml" = "zen-twilight.desktop";
      "application/x-extension-html" = "zen-twilight.desktop";
      "application/x-extension-xht" = "zen-twilight.desktop";
      "application/x-extension-htm" = "zen-twilight.desktop";
      "x-scheme-handler/unknown" = "zen-twilight.desktop";
      "x-scheme-handler/mailto" = "zen-twilight.desktop";
      "x-scheme-handler/chrome" = "zen-twilight.desktop";
      "x-scheme-handler/about" = "zen-twilight.desktop";
      "application/xhtml+xml" = "zen-twilight.desktop";
      "application/json" = "zen-twilight.desktop";
      "text/plain" = "zen-twilight.desktop";
      "text/html" = "zen-twilight.desktop";
    };
  };

  home.packages = with pkgs; [
    ZenBrowser
    (makeDesktopItem {
      name = "zen-twilight";
      desktopName = "Zen Browser (Twilight)";
      genericName = "Web Browser";
      comment = "Browse the Web with Zen";
      exec = "${ZenBrowser}/bin/zen-browser %U";
      icon = "zen-twilight"; # or an absolute path like "/home/you/icons/zen.png"
      terminal = false;
      categories = [
        "Network"
        "WebBrowser"
      ];

      mimeTypes = [
        "application/x-extension-shtml"
        "application/x-extension-xhtml"
        "application/x-extension-html"
        "application/x-extension-xht"
        "application/x-extension-htm"
        "x-scheme-handler/unknown"
        "x-scheme-handler/mailto"
        "x-scheme-handler/chrome"
        "x-scheme-handler/about"
        "x-scheme-handler/https"
        "x-scheme-handler/http"
        "application/xhtml+xml"
        "application/json"
        "text/plain"
        "text/html"
      ];
    })
  ];
}
