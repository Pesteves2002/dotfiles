{config, ...}: let
  domain = "tomase.pt";
  headscale_domain = "headscale.${domain}";
  dns_domain = "devices.${domain}";
  port = 8080;
in {
  services = {
    headscale = {
      enable = true;
      address = "0.0.0.0";
      inherit port;

      settings = {
        server_url = "https://${headscale_domain}";

        dns = {base_domain = dns_domain;};

        logtail.enabled = false;
      };
    };

    nginx.virtualHosts.${headscale_domain} = {
      forceSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://localhost:${toString port}";
        proxyWebsockets = true;
      };
    };
  };
}
