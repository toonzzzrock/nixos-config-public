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
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
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
          inputs.determinate.nixosModules.default

          (
            { pkgs, config, ... }:
            {
              home-manager = {
                useGlobalPkgs = true;
                backupFileExtension = "HMBackup";
                useUserPackages = true;
                users.toonzzzrock = {
                  imports = [
                    ./home.nix
                  ];
                };
                extraSpecialArgs = {
                  inherit inputs; # Pass the flake's top-level 'inputs' directly
                };
              };
            }
          )
        ];
      };
    };
}
