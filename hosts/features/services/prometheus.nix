{config, ...}: {
  services = {
    prometheus = {
      enable = true;

      listenAddress = "0.0.0.0";
      port = 9090;

      exporters = {
        node = {
          enable = true;
          enabledCollectors = ["systemd"];
          port = 9002;
        };
      };

      scrapeConfigs = [
        {
          job_name = "systemd_scrape";
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
      allowedTCPPorts = [9090]; # Only through tailscale
    };
  };
}
