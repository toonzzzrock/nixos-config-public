{ lib, ... }:
{
  # Docker
  virtualisation = {
    docker = {
      enable = true;
    };
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;
  programs.virt-manager.enable = true;
  hardware.nvidia-container-toolkit.enable = true;

  systemd.services.container.wantedBy = lib.mkForce [ ];
  systemd.services.docker.wantedBy = lib.mkForce [ ];

  # virtualisation.virtualbox = {
  #   host = {
  #     enable = true;
  #     enableExtensionPack = true;
  #   };
  #   guest = {
  #     enable = true;
  #     dragAndDrop = true;
  #     clipboard = true;
  #     vboxsf = false;
  #   };
  # };
  # users.extraGroups.vboxusers.members = [ "toonzzzrock" ];
}
