{config, ...}: let
  c = config.networking;

  # https://dnscrypt.info/stamps/
  upstreams = [
    "sdns://AgcAAAAAAAAABzEuMS4xLjEAEmRucy5jbG91ZGZsYXJlLmNvbQovZG5zLXF1ZXJ5" # 1.1.1.1
    "sdns://AgcAAAAAAAAABzEuMC4wLjEAEmRucy5jbG91ZGZsYXJlLmNvbQovZG5zLXF1ZXJ5" # 1.0.0.1
    "sdns://AgcAAAAAAAAAFlsyNjA2OjQ3MDA6NDcwMDo6MTExMV0AIDFkb3QxZG90MWRvdDEuY2xvdWRmbGFyZS1kbnMuY29tCi9kbnMtcXVlcnk" # [2606:4700:4700::1111]
    "sdns://AgcAAAAAAAAAFlsyNjA2OjQ3MDA6NDcwMDo6MTAwMV0AIDFkb3QxZG90MWRvdDEuY2xvdWRmbGFyZS1kbnMuY29tCi9kbnMtcXVlcnk" # [2606:4700:4700::1001]
  ];
in {
  # Network Manager
  networking = {
    nameservers = c.dnsServers;

    dhcpcd.extraConfig = "nohook resolv.conf";
    networkmanager.dns = "none";
  };

  services.dnsproxy = {
    enable = true;
    settings = {
      upstream = upstreams;
      listen-addrs = [
        "127.0.0.53"
      ];
    };
    flags = ["--cache"];
  };
}
