{ config, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    # fzf as source
    # home.file.".p10k.zsh".text = builtins.readFile ./p10k.zsh;
    plugins = [
      {
        name = "powerlevel10k-config";
        src = ./config;
        file = "p10k.zsh";
      }
      {
        name = "fzf-history-search";
        src = "${pkgs.zsh-vi-mode}/share/fzf-history-search";
      }
      {
        name = "fzf-tab";
        src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
      }
      {
        name = "zsh-vi-mode";
        src = "${pkgs.zsh-vi-mode}/share/zsh-vi-mode";
      }
      {
        name = "zsh-autosuggestions";
        src = "${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions";
      }
      {
        name = "zsh-syntax-highlighting";
        src = "${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting";
      }
    ];

    shellAliases =
      let
        flakeDir = "~/flake";
      in {
        sw = "nh os switch";
        upd = "nh os switch --update";
        hms = "nh home switch";

        pkgs = "nvim ${flakeDir}/nixos/packages.nix";

        nix-re = "cd /etc/nixos && sudo nixos-rebuild switch --flake .#toonzzzrock";
        nix-save = "cd /home/toonzzzrock/Desktop/current-nixos-config &&
          sudo cp -r /etc/nixos current-nixos-config &&
          sudo rm -r ./nixos-config/home-manager &&
          sudo rm -r ./nixos-config/wallpapers &&
          sudo mv ./current-nixos-config/* ./nixos-config &&
          cd nixos-config/ &&
          git add . &&
          git commit -m \"$(date +%Y-%m-%d)\" &&
          git push origin main"; 
        nix-clean = "sudo nix-collect-garbage -d && sudo nix-store --optimize";


        r = "ranger";
        v = "nvim";
        se = "sudoedit";
        ls = "eza";

        gs = "git status";
        ga = "git add";
        gc = "git commit";
        gp = "git push";

        y = "sudo yazi";

        "." = "cd ..";
        "2." = "cd ../..";
        ".." = "cd ../..";
        "3." = "cd ../../..";
        "..." = "cd ../../..";
      };

    history.size = 1000;
    history.path = "${config.xdg.dataHome}/zsh/history";
    completionInit = ""; # speed up zsh start time
    initContent = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      zvm_after_init_commands+=(eval "$(fzf --zsh)")

      # Start Tmux automatically if not already running. No Tmux in TTY
      if [ -z "$TMUX" ] && [ -n "$DISPLAY" ]; then
        tmux attach-session -t default || tmux new-session -s default
      fi
      eval "$(zoxide init zsh)"

      fastfetch

      # Enable Ctrl+Left/Right word movement in terminal
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
      bindkey '^H' backward-kill-word
      bindkey '5~' kill-word
    '';
  };

}