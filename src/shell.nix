{
  pkgs,
  ...
}:
{
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc.lib
    glibc
  ];

  environment.localBinInPath = true;
  environment.systemPackages = with pkgs; [

    # Python & Data Science
    (python313.withPackages (
      ps: with ps; [
        ipykernel # kernel for .ipynb / Jupyter / VS Code
        tqdm
        matplotlib
        numpy
        pandas
      ]
    ))
    conda
    openssl

    # NodeJS Packages
    nodePackages_latest.pnpm
    nodePackages_latest.prisma
    nodejs
    prisma-engines
    sqlite

    # Development tools
    ## C/CPP
    clang-tools
    clang
    cmake
    ninja
    gnumake
    gcc
    clippy
    perf

    ## Profiling Tools
    hotspot
    heaptrack

    ## Rust Development
    rust-bin.stable.latest.default
    rust-analyzer
    rustc
    cargo
    rustfmt

  ];
}
