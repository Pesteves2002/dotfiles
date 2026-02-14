let
  loki_port = 3030;
in {
  imports = [./promtail.nix];

  services.loki = {
    enable = true;

    configuration = {
      server.http_listen_port = loki_port;
      auth_enabled = false;

      analytics.reporting_enabled = false;

      common = {
        ring = {
          instance_addr = "127.0.0.1";
          kvstore = {
            store = "inmemory";
          };
        };

        replication_factor = 1;
        path_prefix = "/tmp/loki";
      };

      schema_config = {
        configs = [
          {
            from = "2025-05-15";
            store = "tsdb";
            object_store = "filesystem";
            schema = "v13";
            index = {
              prefix = "index_";
              period = "24h";
            };
          }
        ];
      };

      storage_config = {
        filesystem = {
          directory = "/tmp/loki/chunks";
        };
      };
    };
  };

  networking.firewall = {
    interfaces.tailscale0 = {
      allowedTCPPorts = [loki_port]; # Only through tailscale
    };
  };
}
