{ pkgs, ... }:
{
  home.file = {
    ".config/yazi/yazi.toml" = {
      source = ./yazi.toml;
    };
    ".config/yazi/keymap.toml" = {
      source = ./keymap.toml;
    };
  };
  programs.yazi = {
    enable = true;
    package = pkgs.yazi;
    plugins = {
      "chmod" = pkgs.yaziPlugins.chmod;
      "lazygit" = pkgs.yaziPlugins.lazygit;
      "git" = pkgs.yaziPlugins.git;
      "projects" = pkgs.yaziPlugins.projects;
      "mediainfo" = pkgs.yaziPlugins.mediainfo;
      "sudo" = pkgs.yaziPlugins.sudo;
    };
    initLua = ./init.lua;
  };
}
