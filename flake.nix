{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # mikuboot = {
    #   url = "gitlab:evysgarden/mikuboot";
    #   inputs.nixpkgs.follows = "nixpkgs"; # only useful for the package output
    # };
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
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs = {
        hyprland.follows = "hyprland";
      };
    };
    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs = {
        hyprland.follows = "hyprland";
      };
    };
    nil.url = "github:oxalica/nil";
  };
  outputs =
    { self, ... }@inputs:
    {
      packages.x86_64-linux.my-neovim =
        (inputs.nvf.lib.neovimConfiguration {
          pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
          modules = [
            ./nvim.nix
          ];
        }).neovim;

      nixosConfigurations.toonzzzrock = inputs.nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs; # include system here
        }; # Pass the flake inputs to NixOS modules
        modules = [
          ./configuration.nix
          inputs.home-manager.nixosModules.home-manager
          inputs.chaotic.nixosModules.default # IMPORTANT
          # inputs.mikuboot.nixosModules.default
          # https://github.com/oxalica/rust-overlay
          (
            { pkgs, ... }:
            {
              environment.systemPackages = [ self.packages.${pkgs.stdenv.hostPlatform.system}.my-neovim ];
            }
          )
          (
            { pkgs, ... }:
            {
              nixpkgs.overlays = [ inputs.rust-overlay.overlays.default ];
              environment.systemPackages = with pkgs; [
                rust-bin.stable.latest.default
                gcc # provides `cc`
                pkg-config # helps native deps find headers/libs
                openssl # common native dep (openssl-sys)
                rust-analyzer
                rustc
                cargo
                rustfmt
                cmake
                clippy
                inputs.nil.packages.${pkgs.stdenv.hostPlatform.system}.nil
              ];
            }
          )

          {
            home-manager = {
              useGlobalPkgs = true;
              backupFileExtension = "HMBackup";
              useUserPackages = true;
              users.toonzzzrock = {
                imports = [ ./home.nix ];
              };
              extraSpecialArgs = {
                inherit inputs; # Pass the flake's top-level 'inputs' directly
              };
            };
          }
        ];
      };
    };
}
