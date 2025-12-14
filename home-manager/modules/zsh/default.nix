{ config, pkgs, ... }:
{

  programs = {
    atuin = {
      enable = true;
      daemon.enable = true;
      enableZshIntegration = true;
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    completionInit = ""; # speed up zsh start time

    plugins = [
      {
        name = "powerlevel10k-config";
        src = ./config;
        file = "p10k.zsh";
      }
      {
        name = "fzf-tab";
        src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
      }
    ];

    shellAliases = {
      mod = "sudo chmod 777 *";
      modr = "sudo chmod -R 777 *";
      rm = "rm -I";
      nix-re = "cd /etc/nixos && sudo nixos-rebuild switch --flake .#toonzzzrock";
      nix-up = "cd /etc/nixos && sudo nix flake update";
      py-env = "mamba env create -f environment.yml";
      cdn = "cd /etc/nixos";
      nix-clean = ''
        sudo rm -rf /tmp/* &&
                  sudo nix-collect-garbage -d && 
                  sudo nix-store --gc &&
                  nix-store --gc &&
                  nix-collect-garbage -d && 
                  sudo nix-store --optimize &&
                  nix-store --optimize'';

      btop = "sudo btop";

      sql-start = "sudo systemctl start mysql & sudo mariadb -u root -p";
      sql-stop = "sudo systemctl stop mysql";
      sql-restart = "sudo systemctl restart mysql";

      docker-start = "sudo systemctl start docker container";
      docker-stop = "sudo systemctl stop docker container";
      docker-restart = "sudo systemctl restart docker container";

      du = "ncdu";
      gi = "nvidia-offload gimp";

      v = "nvim";
      se = "sudoedit";
      ls = "eza";

      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gp = "git push";

      "." = "cd ..";
      "2." = "cd ../..";
      ".." = "cd ../..";
      "3." = "cd ../../..";
      "..." = "cd ../../..";
    };

    history = {
      size = 1000;
      path = "${config.home.homeDirectory}/.zsh_history";
      ignorePatterns = [
        "ls"
        "cd *"
        "exit"
        "rm *"
        "sudo rm *"
      ];
    };
    initContent = ''
      clear
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      source /etc/nixos/home-manager/modules/scripts/yazi.sh

      # Start Tmux automatically if not already running. No Tmux in TTY
      if [[ -z "$TMUX" ]]; then
        tmux attach-session -t default || tmux new-session -s default
      fi
      fastfetch
      eval "$(mamba shell hook --shell zsh)"
      zvm_after_init_commands+=(eval "$(fzf --zsh)")
      eval "$(zoxide init zsh)"

      # Enable Ctrl+Left/Right word movement in terminal
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
      bindkey "^H" backward-kill-word
      bindkey "5~" kill-word
    '';
  };
}
