{config, ...}: let
  c = config.networking;
in {
  # Network Manager
  networking = {
    nameservers = c.dnsServers;

    dhcpcd.extraConfig = "nohook resolv.conf";
    networkmanager.dns = "none";
  };
}
