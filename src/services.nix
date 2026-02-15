{ pkgs, lib, ... }:
{
  # OOMD - Out Of Memory Daemon
  systemd.oomd.enable = true;

  # Unused 32-bit audio support
  services.pulseaudio.support32Bit = true;
  services.pipewire.alsa.support32Bit = true;
  services.jack.alsa.support32Bit = true;
  hardware.graphics.enable32Bit = lib.mkForce true;
  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Name = "ChaOS";
        ControllerMode = "dual";
        FastConnectable = "true";
        Experimental = "true";
        AutoEnable = "true";
      };
      Policy = {
        Enable = "Source,Sink,Media,Socket";
      };
      LE = {
        EnableAdvMonInterleaveScan = "true";
      };
    };
  };
  services.blueman.enable = false;

  # Auto-connect to previously paired + trusted devices.
  # Note: BlueZ only auto-connects reliably for devices marked as Trusted.
  # systemd.services.bluetooth-autoconnect = {
  #   description = "Auto-connect trusted Bluetooth devices";
  #   after = [ "bluetooth.service" ];
  #   requires = [ "bluetooth.service" ];
  #   serviceConfig = {
  #     Type = "oneshot";
  #     ExecStart = pkgs.writeShellScript "bluetooth-autoconnect" ''
  #       set -euo pipefail

  #       export PATH="${
  #         lib.makeBinPath [
  #           pkgs.bluez
  #           pkgs.coreutils
  #           pkgs.gawk
  #           pkgs.gnugrep
  #         ]
  #       }:$PATH"

  #       btctl="${pkgs.bluez}/bin/bluetoothctl"

  #       # Wait briefly for BlueZ to come up and the controller to be powered.
  #       for _ in $(seq 1 20); do
  #         if "$btctl" show 2>/dev/null | grep -q "Powered: yes"; then
  #           break
  #         fi
  #         sleep 0.5
  #       done

  #       paired=$($btctl paired-devices | awk '{print $2}')
  #       [ -z "$paired" ] && exit 0

  #       for dev in $paired; do
  #         info=$($btctl info "$dev" || true)
  #         echo "$info" | grep -q "Trusted: yes" || continue
  #         echo "$info" | grep -q "Connected: yes" && continue
  #         $btctl connect "$dev" >/dev/null 2>&1 || true
  #       done
  #     '';
  #   };
  # };

  # systemd.timers.bluetooth-autoconnect = {
  #   description = "Periodically auto-connect trusted Bluetooth devices";
  #   wantedBy = [ "timers.target" ];
  #   timerConfig = {
  #     OnBootSec = "10s";
  #     OnUnitActiveSec = "3s";
  #     Unit = "bluetooth-autoconnect.service";
  #   };
  # };

  # auto mounting USB drives
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # Disable journald to reduce SSD wear
  services.journald.extraConfig = "Storage=none";
  systemd.services.systemd-journal-flush.enable = false;

  # Disable unneeded services
  services.avahi.enable = false;
  services.flatpak.enable = false;
  services.httpd.enablePerl = false;
  services.das_watchdog.enable = false;
  services.upower.enable = true;
  services.hardware.bolt.enable = false;
  services.geoclue2.enable = false;
  services.system-config-printer.enable = false;
  systemd.services.systemd-udev-settle.enable = false;
  services.printing = {
    enable = false;
    webInterface = false;
  };
  services.wyoming.satellite.vad.enable = false;
  services.speechd.enable = false;
  services.xserver.desktopManager.xterm.enable = false;
  services.xserver.excludePackages = [ pkgs.xterm ];
  documentation = {
    enable = false;
    doc.enable = false;
    info.enable = false;
    man.enable = false;
    nixos.enable = false;
  };
  programs = {
    # The lessopen package pulls in Perl.
    less.lessopen = lib.mkForce null;
    command-not-found.enable = lib.mkForce false;
    fish.generateCompletions = lib.mkForce false;
    nano.enable = false;
  };
  systemd.services."sys-fs-pstore.mount".enable = false;
  systemd.services."systemd-pstore".enable = false;
  systemd.services."modprobe@efi_pstore".enable = false;
  console = {
    enable = false;
  };
  services.preload-ng = {
    enable = true;
  };
}
