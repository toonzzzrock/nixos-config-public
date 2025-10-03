{ config, pkgs, lib, ... }: {
  home.file = {
    ".config/yazi" = {
      source = ../yazi;
      recursive = true;
    };
  };
}
