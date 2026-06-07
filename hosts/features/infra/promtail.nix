{
  config,
  pkgs,
  ...
}: let
  lokiPort = toString config.services.loki.configuration.server.http_listen_port;
  hostname = config.networking.hostName;
  alloyConfig = pkgs.writeText "config.alloy" ''
    loki.write "default" {
      endpoint {
        url = "http://127.0.0.1:${lokiPort}/loki/api/v1/push"
      }
    }

    loki.relabel "journal" {
      forward_to = [loki.write.default.receiver]
      rule {
        source_labels = ["__journal__systemd_unit"]
        target_label  = "unit"
      }
    }

    loki.source.journal "journal" {
      max_age    = "12h"
      labels     = {
        job      = "systemd-journal",
        host     = "${hostname}",
        instance = "127.0.0.1",
      }
      forward_to = [loki.relabel.journal.receiver]
    }

    local.file_match "nginx" {
      path_targets = [{
        __path__ = "/var/log/nginx/*.log",
        job       = "nginx",
        host     = "${hostname}",
        instance  = "127.0.0.1",
      }]
    }

    loki.source.file "nginx" {
      targets    = local.file_match.nginx.targets
      forward_to = [loki.write.default.receiver]
    }
  '';
in {
  services.alloy = {
    enable = true;
    configPath = alloyConfig;
  };

  users = {
    users.alloy = {
      isSystemUser = true;
      group = "alloy";
      extraGroups = ["nginx"];
    };
    groups = {
      alloy = {};
      nginx = {};
    };
  };
}
