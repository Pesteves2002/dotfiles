{config, ...}: let
  domain = "grafana.tomase.pt";
in {
  services = {
    grafana = {
      enable = true;

      settings = {
        server = {
          http_addr = "127.0.0.1";
          http_port = 3067;
          enforce_domain = true;
          enable_gzip = true;
          inherit domain;
        };

        security = {
          secret_key = "SW2YcwTIb9zpOOhoPsMm";
        };

        analytics = {
          reporting_enabled = false;
          feedback_links_enabled = false;
        };
      };
    };

    nginx.virtualHosts.${domain} = {
      forceSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://${toString config.services.grafana.settings.server.http_addr}:${toString config.services.grafana.settings.server.http_port}";
        proxyWebsockets = true;
        recommendedProxySettings = true;
      };
    };
  };
}
