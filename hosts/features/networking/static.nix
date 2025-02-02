{config, ...}: let
  c = config.networking;
in {
  # Network Manager
  networking = {
    interfaces.${c.wiredInterface} = {
      ipv4 = {
        addresses = [
          {
            address = c.ipv4Address;
            prefixLength = c.ipv4SubnetMask;
          }
        ];
      };

      wakeOnLan.enable = c.wakeOnLan;

      # name = c.hostName;
    };

    defaultGateway = {
      address = c.ipv4Gateway;
      interface = c.wiredInterface;
    };

    nameservers = c.dnsServers;
  };
}
