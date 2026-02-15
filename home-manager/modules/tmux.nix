{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    mouse = true;
    escapeTime = 0;
    keyMode = "vi";
    terminal = "screen-256color";
    extraConfig = ''
      set -as terminal-features ",alacritty*:RGB"
      bind -n M-r source-file ~/.config/tmux/tmux.conf \; display "Reloaded!"

      # Disable auto-copy on mouse selection
      unbind -T copy-mode-vi MouseDragEnd1Pane
      unbind -T copy-mode MouseDragEnd1Pane

      # Disable auto-copy on double-click
      unbind -T copy-mode-vi DoubleClick1Pane
      unbind -T copy-mode DoubleClick1Pane

      # Manual copy with Ctrl+Shift+C (in copy mode and normal mode)
      bind -T copy-mode-vi C-S-c send-keys -X copy-pipe-and-cancel "wl-copy"
      bind -T copy-mode C-S-c send-keys -X copy-pipe-and-cancel "wl-copy"

      # Disable auto-copy on Enter in vi copy mode, require explicit copy command
      bind -T copy-mode-vi Enter send-keys -X clear-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "wl-copy"
      bind C-p previous-window
      bind C-n next-window
      # kill pane
      bind -n M-x kill-pane

      # respawn pane
      bind -n M-R respawn-pane

      # new after current
      bind -n M-Enter new-window -a

      bind -n M-1 select-window -t 1
      bind -n M-2 select-window -t 2
      bind -n M-3 select-window -t 3
      bind -n M-4 select-window -t 4
      bind -n M-5 select-window -t 5
      bind -n M-6 select-window -t 6
      bind -n M-7 select-window -t 7
      bind -n M-8 select-window -t 8
      bind -n M-9 select-window -t 9

      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D

      bind -n M-S-Left resize-pane -L 5
      bind -n M-S-Right resize-pane -R 5
      bind -n M-S-Up resize-pane -U 3
      bind -n M-S-Down resize-pane -D 3

      bind -n M-s split-window -v
      bind -n M-v split-window -h
    '';
    plugins = with pkgs; [
      tmuxPlugins.gruvbox
      # {
      #   plugin = tmuxPlugins.resurrect;
      #   extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      # }
      # {
      #   plugin = tmuxPlugins.continuum;
      #   extraConfig = ''
      # set -g @continuum-restore 'on'
      # set -g @continuum-save-interval '60' # minutes
      #   '';
      # }
    ];
  };
}
