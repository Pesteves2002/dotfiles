{
  pkgs,
  config,
  ...
}: let
  domain = "tomase.pt";
  headscale_domain = "headscale.${domain}";
  dns_domain = "devices.${domain}";
  port = 8080;

  interface = "ens3";
in {
  services = {
    headscale = {
      enable = true;
      address = "0.0.0.0";
      inherit port;

      settings = {
        server_url = "https://${headscale_domain}";

        dns = {
          base_domain = dns_domain;

          override_local_dns = false;
        };

        logtail.enabled = false;
      };
    };

    nginx.virtualHosts.${headscale_domain} = {
      forceSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://${config.services.headscale.settings.listen_addr}";
        proxyWebsockets = true;
      };
    };

    tailscale = {
      useRoutingFeatures = "both";
    };
  };

  system = {
    activationScripts."tailscale-udp-gro-forwarding".text = ''
      ${pkgs.ethtool}/bin/ethtool -K ${interface} rx-udp-gro-forwarding on rx-gro-list off
    '';
  };
}
