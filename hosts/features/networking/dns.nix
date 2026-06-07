{config, ...}: let
  c = config.networking;
in {
  # Network Manager
  networking = {
    nameservers = c.dnsServers;

    dhcpcd.extraConfig = "nohook resolv.conf noarp";
    dhcpcd.wait = "background";
    # networkmanager.dns = "none";
  };

  services.resolved = {
    enable = true;

    settings.Resolve = {
      DNSOverTLS = true;
      DNSSEC = true;
      Domains = ["~."];
    };
  };
}
