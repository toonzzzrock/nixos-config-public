{ pkgs, lib, ... }:
{

  systemd.oomd.enable = true;

  # Unused 32-bit audio support
  services.pulseaudio.support32Bit = lib.mkForce false;
  services.pipewire.alsa.support32Bit = lib.mkForce false;
  services.jack.alsa.support32Bit = lib.mkForce false;
  hardware.graphics.enable32Bit = lib.mkForce false;

  # Bluetooth
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = false; # powers up the default Bluetooth controller on boot
  services.blueman.enable = false;

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
  services.preload-ng.enable = true;

}
