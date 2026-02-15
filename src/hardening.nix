{
  config,
  pkgs,
  lib,
  ...
}:
let
  commonHardening = {
    ProtectHome = false; # mount /home, /root, /run/user readonly【759222533746914†L154-L156】
    ProtectSystem = "full"; # make /boot, /etc and /usr readonly【759222533746914†L154-L156】
    ProtectClock = true; # disallow changing system clock【759222533746914†L149-L151】
    ProtectKernelTunables = false; # restrict modification of kernel parameters【759222533746914†L149-L153】
    ProtectKernelModules = false; # prevent loading kernel modules【759222533746914†L149-L153】
    ProtectKernelLogs = true; # restrict access to kernel log messages【759222533746914†L149-L153】
    ProtectControlGroups = true; # restrict cgroups access【759222533746914†L156-L159】
    RestrictNamespaces = true; # limit unprivileged namespace creation【759222533746914†L157-L159】
    LockPersonality = true; # prevent changing process personality【759222533746914†L158-L160】
    MemoryDenyWriteExecute = true; # disallow W+X memory mappings【759222533746914†L160-L162】
    RestrictRealtime = true; # block real‑time scheduling【759222533746914†L160-L162】
    RestrictSUIDSGID = true; # drop SUID/SGID binaries【759222533746914†L160-L162】
    PrivateDevices = true; # hide /dev; service gets a minimal device node set
    PrivateTmp = true; # give service its own /tmp and /var/tmp
    # Block dangerous system call groups such as raw I/O, module loading,
    # mounting filesystems, rebooting and swapping.  The article
    # recommends using a negative filter (~) to drop entire syscall
    # groups【759222533746914†L149-L156】.
    SystemCallFilter = "~@clock @cpu-emulation @debug @obsolete @module @mount @raw-io @reboot @swap";
  };
in
{
  systemd.services = {
    dbus.serviceConfig = {
      ProtectControlGroups = true; # restrict cgroups access【759222533746914†L156-L159】
      RestrictNamespaces = true; # limit unprivileged namespace creation【759222533746914†L157-L159】
      LockPersonality = true;
      ProtectClock = true; # disallow changing system clock【759222533746914†L149-L151】
      ProtectKernelTunables = true; # restrict modification of kernel parameters【759222533746914†L149-L153】
      ProtectKernelModules = true; # prevent loading kernel modules【759222533746914†L149-L153】
      ProtectKernelLogs = true; # restrict access to kernel log messages【759222533746914†L149-L153】
      PrivateDevices = true; # hide /dev; service gets a minimal device node set
      PrivateTmp = true; # give service its own /tmp and /var/tmp
    };

    # nix-daemon.serviceConfig = {
    #   ProtectControlGroups = true; # restrict cgroups access【759222533746914†L156-L159】
    #   RestrictNamespaces = true; # limit unprivileged namespace creation【759222533746914†L157-L159】
    #   LockPersonality = true; # prevent changing process personality【759222533746914†L158-L160】
    #   RestrictRealtime = true; # block real‑time scheduling【759222533746914†L160-L162】
    #   RestrictSUIDSGID = true;
    #   ProtectClock = true; # disallow changing system clock【759222533746914†L149-L151】
    #   ProtectKernelModules = true; # prevent loading kernel modules【759222533746914†L149-L153】
    #   ProtectKernelLogs = true; # restrict access to kernel log messages【759222533746914†L149-L153】
    #   PrivateDevices = true; # hide /dev; service gets a minimal device node set
    #   PrivateTmp = true; # give service its own /tmp and /var/tmp
    # };

    # "NetworkManager-dispatcher".serviceConfig = commonHardening // {
    #   PrivateDevices = false;
    #   ProtectHome   = false;
    #   ProtectSystem = "true"; # make /usr and /etc read‑only but allow /boot and others
    # };
    # NetworkManager.serviceConfig = {
    #   ProtectSystem = lib.mkDefault "true";
    #   PrivateTmp    = lib.mkDefault true;
    #   PrivateDevices = lib.mkDefault true;
    # };

    acpid.serviceConfig = {
      ProtectKernelTunables = true; # restrict modification of kernel parameters【759222533746914†L149-L153】
      ProtectKernelModules = true; # prevent loading kernel modules【759222533746914†L149-L153】
      ProtectKernelLogs = true; # restrict access to kernel log messages【759222533746914†L149-L153】
      RestrictNamespaces = true; # limit unprivileged namespace creation【759222533746914†L157-L159】
      LockPersonality = true; # prevent changing process personality【759222533746914†L158-L160】
      MemoryDenyWriteExecute = true; # disallow W+X memory mappings【759222533746914†L160-L162】
      PrivateDevices = true; # hide /dev; service gets a minimal device node set
      PrivateTmp = true;
      RestrictAddressFamilies = [
        "AF_INET"
        "AF_INET6"
        "AF_UNIX"
      ];
    };
    # nbfc_service.serviceConfig = {
    #   ProtectControlGroups = true; # restrict cgroups access【759222533746914†L156-L159】
    #   RestrictNamespaces = true; # limit unprivileged namespace creation【759222533746914†L157-L159】
    #   MemoryDenyWriteExecute = true; # disallow W+X memory mappings【759222533746914†L160-L162】
    #   RestrictSUIDSGID = true; # drop SUID/SGID binaries【759222533746914†L160-L162】

    #   ProtectClock = true; # disallow changing system clock【759222533746914†L149-L151】
    #   ProtectKernelLogs = true; # restrict access to kernel log messages【759222533746914†L149-L153】
    #   LockPersonality = true; # prevent changing process personality【759222533746914†L158-L160】
    #   PrivateDevices = true; # hide /dev; service gets a minimal device node set
    #   PrivateTmp = true; # hide /dev; service gets a minimal device node set
    # };

    nscd.serviceConfig = {
      ProtectKernelTunables = lib.mkDefault true; # restrict modification of kernel parameters【759222533746914†L149-L153】
      ProtectKernelModules = lib.mkDefault true; # prevent loading kernel modules【759222533746914†L149-L153】
      ProtectKernelLogs = lib.mkDefault true; # restrict access to kernel log messages【759222533746914†L149-L153】
      RestrictNamespaces = lib.mkDefault true; # limit unprivileged namespace creation【759222533746914†L157-L159】
      LockPersonality = lib.mkDefault true; # prevent changing process personality【759222533746914†L158-L160】
      MemoryDenyWriteExecute = lib.mkDefault true; # disallow W+X memory mappings【759222533746914†L160-L162】
      PrivateDevices = lib.mkDefault true; # hide /dev; service gets a minimal device node set
      PrivateTmp = lib.mkDefault true;
    };

    emergency.serviceConfig = commonHardening;

    nvidia-powerd.serviceConfig = commonHardening // {
      # GPU power management requires access to /dev/nvidia*; keep
      # devices visible and avoid making /home read‑only to allow user
      # settings【366938153626919†L836-L842】.
      PrivateDevices = false;
      ProtectHome = false;
    };

    # rescue.service gives a root rescue shell similar to emergency.
    rescue.serviceConfig = commonHardening;

    # scx.service (Sysmon Cloud?), treat as typical service and apply
    # baseline restrictions.
    scx.serviceConfig = commonHardening;

    # system76-scheduler manages CPU scheduling policies on System76
    # machines.  Baseline hardening suffices.
    system76-scheduler.serviceConfig = commonHardening;

    # systemd-ask-password-console and wall ask the user for
    # passwords.  Although they need to interact with users, they can
    # still benefit from sandboxing.
    "systemd-ask-password-console".serviceConfig = commonHardening;
    "systemd-ask-password-wall".serviceConfig = commonHardening;
  };

  security.unprivilegedUsernsClone = true;
  boot.kernel.sysctl = {
    "kernel.unprivileged_userns_clone" = 1;
  };

  nix.settings.sandbox = true; # keep sandboxing once namespaces are available
  nix.settings.allowed-users = [ "@wheel" ];

  programs.firejail = {
    enable = lib.mkDefault false;
  };

  # https://github.com/cynicsketch/nix-mineral/blob/main/nix-mineral.nix
  services.dbus.apparmor = "enabled";
  security = {
    sudo.enable = false;
    sudo-rs = {
      enable = true;
      execWheelOnly = true;
      wheelNeedsPassword = false;
    };
    soteria.enable = true;
    apparmor = {
      enable = lib.mkDefault true;
      killUnconfinedConfinables = lib.mkDefault true;
      enableCache = true;
      packages = [ pkgs.apparmor-profiles ];
    };

    pam = {
      loginLimits = [
        {
          domain = lib.mkDefault "*";
          item = lib.mkDefault "core";
          type = lib.mkDefault "hard";
          value = lib.mkDefault "0";
        }
      ];
      services = {
        # Increase hashing rounds for /etc/shadow; this doesn't automatically
        # rehash your passwords, you'll need to set passwords for your accounts
        # again for this to work.
        passwd.rules.password."unix".settings.rounds = lib.mkDefault 65536;
        # Enable PAM support for securetty, to prevent root login.
        # https://unix.stackexchange.com/questions/670116/debian-bullseye-disable-console-tty-login-for-root
        login.rules.auth = {
          "nologin" = {
            enable = lib.mkDefault true;
            order = lib.mkDefault 0;
            control = lib.mkDefault "requisite";
            modulePath = lib.mkDefault "${config.security.pam.package}/lib/security/pam_nologin.so";
          };
          "securetty" = {
            enable = lib.mkDefault true;
            order = lib.mkDefault 1;
            control = lib.mkDefault "requisite";
            modulePath = lib.mkDefault "${config.security.pam.package}/lib/security/pam_securetty.so";
          };
        };

        su.requireWheel = lib.mkDefault true;
        su-l.requireWheel = lib.mkDefault true;
      };
    };
  };

  boot.blacklistedKernelModules = [
    # Obscure network protocols
    "ax25"
    "netrom"
    "rose"
    # Old or rare or insufficiently audited filesystems
    "adfs"
    "affs"
    "bfs"
    "befs"
    "cramfs"
    "efs"
    "erofs"
    "exofs"
    "freevxfs"
    "f2fs"
    "hfs"
    "hpfs"
    "jfs"
    "minix"
    "nilfs2"
    "ntfs"
    "omfs"
    "qnx4"
    "qnx6"
    "sysv"
    "ufs"
    "xe"
    "amdgpu"
    "radeon" # AMD GPUs
    "iTCO_wdt"
    "intel_oc_wdt"
    "iTCO_vendor_support"
    "pcspkr"
    "joydev"
    "mac_hid"
    "stp"
    "llc"
    "nouveau"

  ];
}
