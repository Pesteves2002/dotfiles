{config, ...}: {
  services.promtail = {
    enable = true;

    configuration = {
      server = {
        http_listen_port = 3031;
        grpc_listen_port = 0;
      };

      positions = {
        filename = "/tmp/positions.yaml";
      };

      clients = [
        {
          url = "http://127.0.0.1:${toString config.services.loki.configuration.server.http_listen_port}/loki/api/v1/push";
        }
      ];

      scrape_configs = [
        # For systemd logs
        {
          job_name = "journal";
          journal = {
            max_age = "12h";
            labels = {
              job = "systemd-journal";
              host = "your_hostname";
              instance = "127.0.0.1";
            };
          };

          relabel_configs = [
            {
              source_labels = ["__journal__systemd_unit"];
              target_label = "unit";
            }
          ];
        }

        {
          job_name = "nginx";
          static_configs = [
            {
              targets = ["127.0.0.1"];
              labels = {
                job = "nginx";
                __path__ = "/var/log/nginx/*.log";
                host = "your_hostname";
                instance = "127.0.0.1";
              };
            }
          ];
        }
      ];
    };
  };

  # https://oblivion.keyruu.de/Homelab/Monitoring
  # Give nginx read permissions to promtail
  users = {
    users.promtail = {
      isSystemUser = true;
      group = "promtail";
      extraGroups = ["nginx"];
    };

    groups = {
      promtail = {};
      nginx = {};
    };
  };
}
