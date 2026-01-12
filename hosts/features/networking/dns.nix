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

    dnssec = "true";
    domains = ["~."];

    dnsovertls = "true";
  };
}
