{ pkgs, ... }:
{
  # basic Git setup
  programs.git = {
    enable = true;
    userName = "toonzzzrock";
    userEmail = "toonzzzrock@gmail.com";
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };
  };
}
