{ lib, pkgs, ... }: {
  programs.zathura = {
    enable = true;
    extraConfig = ''
set font "JetBrainsMono Nerd Font"
set recolor "true"
# set recolor-keephue "true"

set page-padding 10
set scroll-wrap "true"
set statusbar-home-tilde "true"
'';
    mappings = {
    "<C-.>" = "scroll up";
    "<C-e>" = "scroll down";
    "<C-o>" = "scroll left";
    "<C-u>" = "scroll right";
    "." = "scroll half-up";
    "e" = "scroll half-down";
    ">" = "scroll page-top";
    "E" = "scroll page-bottom";
    "<A-.>" = "scroll full-up";
    "<A-e>" = "scroll full-down";
    "<PageUp>" = "scroll half-up";
    "<PageDown>" = "scroll half-down";
    "<BackSpace>" = "scroll half-up";
    "<Space>" = "scroll half-down";
    "h" = "navigate previous";
    "n" = "navigate next";
    "b" = "adjust_window best-fit";
    "H" = "adjust_window best-fit";
    "w" = "adjust_window width";
    "W" = "adjust_window width";
    "p" = "rotate rotate-ccw";
    "<Left>" = "rotate rotate-ccw";
    "," = "rotate rotate-cw";
    "<Right>" = "rotate rotate-cw";

    "<C-s>" = "search forward";
    "<C-r>" = "search backward";

    "<A-g>" = "goto";
    "g" = "reload";
    "c" = "recolor";
    "u" = "follow";
    "<Return>" = "toggle_presentation";
    "i" = "toggle_index";
    "Q" = "quit";

    "[presentation] <Return>" = "toggle_presentation";

# Index mode
    "[index] i" = "toggle_index";
    "[index] ." = "navigate_index up";
    "[index] e" = "navigate_index down";
    "[index] u" = "navigate_index select";
    "[index] +" = "navigate_index expand";
    "[index] -" = "navigate_index collapse";
    "[index] <Tab>" = "navigate_index toggle";
    # Unfortunately, there is no "toggle-all":
    "[index] <ShiftTab>" = "navigate_index expand-all";
    "[index] <A-ShiftTab>"= "navigate_index collapse-all";
    };

    options = {
        default-bg = "rgba(0,0,0,0.5)";
        default-fg = "#d5d2be";
        inputbar-bg = "#464646";
        inputbar-fg = "#d5d2be";
        statusbar-bg = "#222222";
        statusbar-fg = "#d5d2be";

        completion-bg = "#464646";
        completion-fg = "#d5d2be";
        completion-group-bg = "#464646";
        completion-group-fg = "#099709";
        completion-highlight-bg = "#6f6f6f";
        completion-highlight-fg = "#d5d2be";

        notification-bg = "#464646";
        notification-fg = "#f6f0e1";
        notification-warning-bg = "#464646";
        notification-warning-fg = "#e8e815";
        notification-error-bg = "#c64242";
        notification-error-fg = "#f6f0e1";

        index-bg = "#3f3f3f";
        index-fg = "#d5d2be";
        index-active-bg = "#4f4f4f";
        index-active-fg = "#d5d2be";

        recolor-lightcolor = "rgba(0, 0, 0, 0.4)";
        # recolor-darkcolor = "#d5d2be";
    };
  };
}
