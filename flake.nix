{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    hyprpaper = {
      url = "github:hyprwm/hyprpaper";
      inputs = {
        nixpkgs.follows = "hyprland/nixpkgs";
        systems.follows = "hyprland/systems";
      };
    };
    nvf.url = "github:notashelf/nvf";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs = {
        hyprland.follows = "hyprland";
      };
    };
    nil.url = "github:oxalica/nil";
    preload-ng.url = "github:miguel-b-p/preload-ng";
    antigravity-nix = {
      url = "github:jacopone/antigravity-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    direnv-instant.url = "github:Mic92/direnv-instant";

    life-calendar = {
      url = "github:toonzzzrock/life-calendar";
      inputs = {
        nixpkgs.follows = "hyprland/nixpkgs";
        systems.follows = "hyprland/systems";
      };
    };
  };
  outputs =
    { self, ... }@inputs:
    {
      nixosConfigurations.toonzzzrock = inputs.nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs; # include system here
        };
        modules = [
          ./configuration.nix
          inputs.home-manager.nixosModules.home-manager
          inputs.preload-ng.nixosModules.default
          inputs.life-calendar.nixosModules.default
          (
            { pkgs, config, ... }:
            {
              programs.life-calendar = {
                enable = true;
                birthDate = "2004-10-19";
                deathDate = "2084-10-19";
                editor = "code";
                diaryDir = "~/.life-calendar/diary";
                diaryTemplate = "~/.life-calendar/template.md";
              };

              home-manager = {
                useGlobalPkgs = true;
                backupFileExtension = "HMBackup";
                useUserPackages = true;
                users.toonzzzrock = {
                  imports = [
                    ./home-manager/home.nix
                    inputs.direnv-instant.homeModules.direnv-instant
                  ];
                };
                extraSpecialArgs = {
                  inherit inputs;
                };
              };
            }
          )
        ];
      };
    };
}
