{
  lib,
  ...
}:
{
  environment.etc."dnscrypt-proxy/cloaking-rules.txt".text = ''
    wifi.siit.tu.ac.th 10.10.100.1
  '';
  # https://wiki.nixos.org/wiki/Systemd/resolved
  systemd.services.NetworkManager-wait-online.enable = false;
  systemd.services."network-online.target".wantedBy = lib.mkForce [ ];
  services.resolved.enable = false;
  services.dnscrypt-proxy = {
    # https://github.com/DNSCrypt/dnscrypt-proxy/blob/master/dnscrypt-proxy/example-dnscrypt-proxy.toml
    enable = true;
    settings = {
      ipv6_servers = false; # disable IPv6 if not needed
      doh_servers = false; # disable DoH servers
      odoh_servers = true; # enable Oblivious DoH
      dnscrypt_servers = false; # disable DNSCrypt protocol
      require_nolog = true; # only resolvers with no-logging
      require_dnssec = true; # require DNSSEC support
      require_nofilter = false; # (optional) only servers with no filtering
      http3 = true; # enable DNS-over-HTTP/3 support

      cache = true;
      cache_size = 16384;
      cache_min_ttl = 600;
      cache_max_ttl = 86400;
      cache_neg_min_ttl = 60;
      cache_neg_max_ttl = 600;

      sources."odoh-servers" = {
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/odoh-servers.md"
          "https://download.dnscrypt.info/resolvers-list/v3/odoh-servers.md"
        ];
        cache_file = "/var/cache/dnscrypt-proxy/odoh-servers.md";
        minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
        refresh_delay = 73;
        prefix = "";
      };
      sources."odoh-relays" = {
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/odoh-relays.md"
          "https://download.dnscrypt.info/resolvers-list/v3/odoh-relays.md"
        ];
        cache_file = "/var/cache/dnscrypt-proxy/odoh-relays.md";
        minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
        refresh_delay = 73;
        prefix = "";
      };
      anonymized_dns = {
        routes = [
          {
            server_name = "*";
            via = [ "*" ];
          }
        ];
      };
      server_names = [
        "odoh-cloudflare"
        "odoh-id-gmail"
      ];
      cloaking_rules = "/etc/dnscrypt-proxy/cloaking-rules.txt";
    };
  };

  networking = {
    hostName = "ChaOS";
    useDHCP = lib.mkDefault true;
    # If using NetworkManager:
    # NetworkManager + iwd Wi‑Fi stack
    wireless.iwd.enable = true;
    interfaces.wlan0.mtu = 1480;
    nameservers = [
      "127.0.0.1"
    ];
    networkmanager = {
      enable = true;
      wifi = {
        macAddress = lib.mkDefault "random";
        scanRandMacAddress = lib.mkDefault true;
        powersave = false;
        backend = "iwd"; # use iwd instead of wpa_supplicant
      };
      # dns = "systemd-resolved";
      dns = "none"; # use dnscrypt-proxy
    };
    enableIPv6 = false;
    hosts = {
      "0.0.0.0" = [
        "v10.events.data.microsoft.com"
        "self.events.data.microsoft.com"
        "functional.events.data.microsoft.com"
        "settings-win.data.microsoft.com"
        "settings.data.microsoft.com"
        "telecommand.telemetry.microsoft.com"
        "www.telecommandsvc.microsoft.com"
        "dc.services.visualstudio.com"
        "dc.trafficmanager.net"
        "vortex.data.microsoft.com"
        "weu-breeziest-in.cloudapp.net"
        "default.exp-tas.com"
        "bingsettingssearch.trafficmanager.net"
        "vscode.search.windows.net"
        "vscode-sync.trafficmanager.net"
        "vscode-sync-insiders.trafficmanager.net"
        "rink.hockeyapp.net"
      ];

      "::" = [
        "v10.events.data.microsoft.com"
        "self.events.data.microsoft.com"
        "functional.events.data.microsoft.com"
        "settings-win.data.microsoft.com"
        "settings.data.microsoft.com"
        "telecommand.telemetry.microsoft.com"
        "www.telecommandsvc.microsoft.com"
        "dc.services.visualstudio.com"
        "dc.trafficmanager.net"
        "vortex.data.microsoft.com"
        "weu-breeziest-in.cloudapp.net"
        "default.exp-tas.com"
        "bingsettingssearch.trafficmanager.net"
        "vscode.search.windows.net"
        "vscode-sync.trafficmanager.net"
        "vscode-sync-insiders.trafficmanager.net"
        "rink.hockeyapp.net"
      ];
    };

    firewall = {
      enable = true;
    };
    nftables.enable = true;
  };

}
