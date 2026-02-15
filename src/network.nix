{
  lib,
  ...
}:
{
  programs.captive-browser = {
    enable = true;
    interface = "wlan0";
  };
  # https://wiki.nixos.org/wiki/Systemd/resolved
  systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;
  systemd.services."network-online.target".wantedBy = lib.mkForce [ ];
  systemd.services.NetworkManager-wait-online.wantedBy = lib.mkForce [ ];
  services.resolved = {
    enable = true;
    # Disable the stub listener so dnscrypt-proxy can bind to 127.0.0.1:53
    settings = {
      Resolve = {
        DNSStubListener = "no";
      };
    };
  };

  services.dnscrypt-proxy = {
    # https://github.com/DNSCrypt/dnscrypt-proxy/blob/master/dnscrypt-proxy/example-dnscrypt-proxy.toml
    enable = true;
    settings = {
      listen_addresses = [
        "127.0.0.1:53"
      ];

      ignore_system_dns = true;
      ipv6_servers = false; # disable IPv6 if not needed
      doh_servers = false; # disable DoH servers
      odoh_servers = true; # enable Oblivious DoH
      dnscrypt_servers = false; # disable DNSCrypt protocol
      require_nolog = true; # only resolvers with no-logging
      require_dnssec = true; # require DNSSEC support
      require_nofilter = false; # (optional) only servers with no filtering
      http3 = true; # enable DNS-over-HTTP/3 support

      cache = true;
      cache_size = 86400;
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
      fallback_resolvers = [
        "1.1.1.1:53"
        "9.9.9.9:53"
      ];
    };
  };

  services.syncthing = {
    enable = true;
    user = "toonzzzrock";
    dataDir = "/home/toonzzzrock/000-Syncthing";
  };

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = true;
  };
  networking = {
    hostName = "ChaOS";
    useDHCP = lib.mkDefault true;
    # If using NetworkManager:
    # NetworkManager + iwd Wi‑Fi stack
    wireless.iwd.enable = true;
    interfaces.wlan0.mtu = 1480;
    networkmanager = {
      enable = true;
      wifi = {
        macAddress = "stable-ssid";
        scanRandMacAddress = lib.mkDefault true;
        powersave = false;
        backend = "iwd"; # use iwd instead of wpa_supplicant
      };
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
      allowPing = false; # optional
      allowedTCPPorts = [ 22 ];
      allowedUDPPorts = [ ];
    };
  };
}
