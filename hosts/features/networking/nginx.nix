{
  services.nginx = {
    enable = true;
    virtualHosts."tomase.pt" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        return = "200 '<html><body>It works</body></html>'";
        extraConfig = ''
          default_type text/html;
        '';
      };

      locations."/test" = {
        return = "200 '<html><body>It works too</body></html>'";
        extraConfig = ''
          default_type text/html;
        '';
      };
    };
  };

  networking.firewall.allowedTCPPorts = [80 443];

  security.acme = {
    acceptTerms = true;
    defaults.email = "tomasesteves2002@gmail.com";
  };
}
