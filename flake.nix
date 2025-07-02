{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url   	= "github:NixOS/nixpkgs/nixos-25.05";
    # nvidia-patch = {
    #   url = "github:icewind1991/nvidia-patch-nixos";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    chaotic = {
      url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    };
    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix/release-25.05";
    # hyprland = {
    #   url = "github:hyprwm/Hyprland";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };
  outputs = { self, nixpkgs, ...}@inputs:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.toonzzzrock = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { 
          inherit inputs system;  # include system here
        }; # Pass the flake inputs to NixOS modules
        modules = [
          ./configuration.nix
          inputs.chaotic.nixosModules.nyx-cache
          inputs.chaotic.nixosModules.nyx-overlay
          inputs.chaotic.nixosModules.nyx-registry
          
          inputs.stylix.nixosModules.stylix
          inputs.home-manager.nixosModules.home-manager
          {
              home-manager.useGlobalPkgs   	= true;
              home-manager.backupFileExtension = "HMBackup";
              home-manager.useUserPackages 	= true;

              home-manager.users.toonzzzrock = {
                imports = [
                  ./home.nix
                ];
              };

              home-manager.extraSpecialArgs = {
                inherit inputs; # Pass the flake's top-level 'inputs' directly
                inherit system; # Pass system directly
              };
          }
        ];
    };
  };
}


