{config, ...}: let
  prometheus_port = 9090;
in {
  services = {
    prometheus = {
      enable = true;

      listenAddress = "0.0.0.0";
      port = prometheus_port;

      exporters = {
        node = {
          enable = true;
          enabledCollectors = ["systemd"];
          port = 9002;
        };
      };

      scrapeConfigs = [
        {
          job_name = "node_exporter";
          static_configs = [
            {
              targets = ["127.0.0.1:${toString config.services.prometheus.exporters.node.port}"];
            }
          ];
        }
      ];
    };
  };

  networking.firewall = {
    interfaces.tailscale0 = {
      allowedTCPPorts = [prometheus_port]; # Only through tailscale
    };
  };
}
