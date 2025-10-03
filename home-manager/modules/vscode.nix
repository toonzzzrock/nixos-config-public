{ pkgs, lib, config, ... }: {
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = true;
    package = pkgs.vscode.fhs;
  };
}
