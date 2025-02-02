{lib, ...}: let
  inherit (lib) mkOption types;
in {
  options.networking = {
    wiredInterface = mkOption {
      type = types.nullOr types.str;
      default = null;
      example = "eth0";
      description = "The main wired interface of this device";
    };

    wirelessInterface = mkOption {
      type = types.nullOr types.str;
      default = null;
      example = "wlo1";
      description = "The main wireless interface of this device";
    };

    ipv4Address = mkOption {
      type = types.nullOr types.str;
      default = null;
      example = "192.168.0.2";
      description = "The local IPv4 address of this device";
    };

    ipv4SubnetMask = mkOption {
      type = types.nullOr types.int;
      default = null;
      example = 24;
      description = "The local IPv4 subnet mask of this device";
    };

    ipv4Gateway = mkOption {
      type = types.nullOr types.str;
      default = null;
      example = "192.168.0.1";
      description = "The local IPv4 gateway of this device";
    };

    wakeOnLan = mkOption {
      type = types.bool;
      default = false;
      example = true;
      description = "Enable Wake-on-LAN for this device";
    };

    dnsServers = mkOption {
      type = types.listOf types.str;
      default = [];
      example = ["8.8.8.8" "8.8.4.4"];
      description = "The nameservers to use for DNS resolution";
    };
  };
}
