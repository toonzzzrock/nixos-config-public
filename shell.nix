{
  pkgs,
  lib,
  config,
  pkgsTopLevel,
  ...
}:
{

  nixpkgs.overlays = [
    (self: super: rec {
      # https://github.com/NixOS/nixpkgs/blob/c339c066b893e5683830ba870b1ccd3bbea88ece/nixos/modules/programs/nix-ld.nix#L44
      # > We currently take all libraries from systemd and nix as the default.
      pythonldlibpath = lib.makeLibraryPath (
        with super;
        [
          zlib
          zstd
          stdenv.cc.cc
          curl
          openssl
          attr
          libssh
          bzip2
          libxml2
          acl
          libsodium
          util-linux
          xz
        ]
      );
      # here we are overriding python program to add LD_LIBRARY_PATH to it's env
      python = super.stdenv.mkDerivation {
        name = "python";
        buildInputs = [ super.makeWrapper ];
        src = super.python312;
        installPhase = ''
          mkdir -p $out/bin
          cp -r $src/* $out/
          wrapProgram $out/bin/python3 --set LD_LIBRARY_PATH ${pythonldlibpath}
          wrapProgram $out/bin/python3.12 --set LD_LIBRARY_PATH ${pythonldlibpath}
        '';
      };
      python3Packages = super.python3Packages.overrideScope (
        final: prev: {
          enableOptimizations = true;
          reproducibleBuild = false;
        }
      );
    })
  ];

  environment.localBinInPath = true;
  environment.systemPackages = with pkgs; [
    python
    uv
    micromamba
  ];
}
