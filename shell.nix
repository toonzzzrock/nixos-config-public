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
    (python313.withPackages (
      ps: with ps; [
        ipykernel # kernel for .ipynb / Jupyter / VS Code
        tqdm
        matplotlib
        numpy
        pandas
      ]
    ))
    mamba-cpp

    nodePackages_latest.pnpm
    nodePackages_latest.vercel
    nodePackages_latest.prisma
    openssl
    nodejs
    prisma-engines
    sqlite
  ];
}
