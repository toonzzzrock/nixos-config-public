{ pkgs, username, ... }:
let
  life_archive = import ./life_archive.nix { inherit pkgs; };
  life_archive_label = import ./life_archive_label.nix { inherit pkgs; };
  life_archive_toggle = import ./life_archive_toggle.nix { inherit pkgs; };
in
{
  home.packages = [
    (import ./keybinds.nix { inherit pkgs; })
    (import ./task-waybar.nix { inherit pkgs; })
    (import ./wallsetter.nix {
      inherit pkgs;
      inherit username;
    })
    (import ./web-search.nix { inherit pkgs; })
    (import ./rofi-launcher.nix { inherit pkgs; })
    (import ./hypr-shutdown.nix { inherit pkgs; })
    (import ./hypr-reboot.nix { inherit pkgs; })
    life_archive
    life_archive_label
    life_archive_toggle
    (import ./hypr-start.nix { inherit pkgs; })
    (import ./memorize.nix { inherit pkgs; })
  ];

  systemd.user.services.life_archive = {
    Unit = {
      Description = "Life Archive Service";
      PartOf = [ "hyprland-session.target" ];
      After = [ "hyprland-session.target" ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${life_archive}/bin/life_archive";
      WorkingDirectory = "%h/Pictures/LifeArchive";
      Environment = "PATH=${
        pkgs.lib.makeBinPath [
          pkgs.coreutils
          pkgs.grim
          pkgs.jq
        ]
      }";
    };
    Install = {
      WantedBy = [ "hyprland-session.target" ];
    };
  };

  systemd.user.services.life_archive_label = {
    Unit = {
      Description = "Life Archive Label Service";
      PartOf = [ "hyprland-session.target" ];
      After = [ "hyprland-session.target" ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${life_archive_label}/bin/life_archive_label";
      WorkingDirectory = "%h/Pictures/LifeArchive";
      Environment = "PATH=${
        pkgs.lib.makeBinPath [
          pkgs.coreutils
          pkgs.hyprland
          pkgs.jq
        ]
      }";
    };
    Install = {
      WantedBy = [ "hyprland-session.target" ];
    };
  };

  # run every 5 minutes
  systemd.user.timers.life_archive = {
    Unit = {
      Description = "Life Archive Timer";
      PartOf = [ "hyprland-session.target" ];
      After = [ "hyprland-session.target" ];
    };
    Timer = {
      OnCalendar = "*:0/5";
      Persistent = true;
    };
    Install = {
      WantedBy = [ "hyprland-session.target" ];
    };
  };

  # run every 5 seconds
  systemd.user.timers.life_archive_label = {
    Unit = {
      Description = "Life Archive Label Timer";
      PartOf = [ "hyprland-session.target" ];
      After = [ "hyprland-session.target" ];
    };
    Timer = {
      OnCalendar = "*:*:0/5";
      Persistent = true;
    };
    Install = {
      WantedBy = [ "hyprland-session.target" ];
    };
  };
}
