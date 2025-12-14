{ pkgs, lib, ... }:
{
  services = {
    mysql = {
      enable = true;
      package = pkgs.mariadb;
    };
    postgresql = {
      enable = true;
      authentication = pkgs.lib.mkOverride 10 ''
        #type database  DBuser  auth-method
        local all       all     trust
      '';
    };
  };
  systemd.services.mysql.wantedBy = lib.mkForce [ ];
  systemd.services.postgresql.wantedBy = lib.mkForce [ ];
}
