{
  config,
  pkgs,
  lib,
  ...
}:

let
  wrapDir = "${config.home.homeDirectory}/.local/lib/ccache-wrappers";
  cacheDir = "${config.xdg.cacheHome}/ccache";
in
{
  home.packages = [ pkgs.ccache ];

  # Put wrapper dir first in PATH (before /run/current-system/sw/bin)
  home.sessionPath = [ wrapDir ];

  # Make cache location + behavior deterministic (no activation-time ccache calls)
  xdg.enable = true;
  home.sessionVariables = {
    CCACHE_DIR = cacheDir;
    CCACHE_MAXSIZE = "20G";
    CCACHE_COMPRESS = "1";
    CCACHE_COMPILER_CHECK = "content";
  };

  # Ensure cache dir exists (just mkdir; don't run ccache here)
  home.activation.ensureCcacheDir = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p "${cacheDir}"
  '';

  # Deterministic wrappers (no activation-time symlink logic)
  home.file."${wrapDir}/gcc".source = "${pkgs.ccache}/bin/ccache";
  home.file."${wrapDir}/g++".source = "${pkgs.ccache}/bin/ccache";
  home.file."${wrapDir}/cc".source = "${pkgs.ccache}/bin/ccache";
  home.file."${wrapDir}/c++".source = "${pkgs.ccache}/bin/ccache";
}
