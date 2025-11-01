{ pkgs, ... }:
{
  # basic Git setup
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "toonzzzrock";
        email = "toonzzzrock@gmail.com";
      };
      init.defaultBranch = "main";
    };
  };

  programs.lazygit = {
    enable = true;
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };
  };
}
