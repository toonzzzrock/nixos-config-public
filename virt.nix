{ pkgs, lib, ... }:
{
  # Docker
  virtualisation = {
    docker = {
      enable = true;
    };
    libvirtd = {
      enable = true;
    };
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;
  programs.virt-manager.enable = true;
  hardware.nvidia-container-toolkit.enable = true;

  systemd.services.container.wantedBy = lib.mkForce [ ];
  systemd.services.docker.wantedBy = lib.mkForce [ ];
  systemd.services.libvirtd.wantedBy = lib.mkForce [ ];
}
