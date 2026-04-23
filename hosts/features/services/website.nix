{
  config,
  inputs,
  secrets,
  ...
}: let
  domain = "tomase.pt";
  cv = "cv.${domain}";
  cv_redirect = "github.com/Pesteves2002/cv/releases/download/compiled-pdf/cv.pdf";
in {
  services.nginx.virtualHosts = {
    ${domain} = {
      enableACME = true;
      forceSSL = true;
      serverAliases = [
        "www.${domain}"
      ];
      locations."/" = {
        proxyPass = "http://127.0.0.1:3000";
      };
    };

    ${cv} = {
      enableACME = true;
      forceSSL = true;
      serverAliases = [
        "www.${cv}"
      ];

      globalRedirect = cv_redirect;
    };
  };

  age.secrets."website.env".file = "${secrets}/takumi/website.age";

  systemd.services.tomase-website = {
    description = "Tomás Esteves Website";
    after = ["network.target"];
    wantedBy = ["multi-user.target"];

    serviceConfig = {
      ExecStart = "${inputs.tomase-website.packages.x86_64-linux.default}/bin/tomase_website";

      Type = "simple";
      Restart = "on-failure";
      RestartSec = 3;
      DynamicUser = true;

      EnvironmentFile = [config.age.secrets."website.env".path];

      #Hardening
      CapabilityBoundingSet = "";
      NoNewPrivileges = true;
      PrivateUsers = true;
      PrivateTmp = true;
      PrivateDevices = true;
      PrivateMounts = true;
      ProtectClock = true;
      ProtectControlGroups = true;
      ProtectHome = true;
      ProtectHostname = true;
      ProtectKernelLogs = true;
      ProtectKernelModules = true;
      ProtectKernelTunables = true;
      RestrictAddressFamilies = [
        "AF_INET"
        "AF_INET6"
      ];
      RestrictNamespaces = true;
      RestrictRealtime = true;
      RestrictSUIDSGID = true;
    };
  };
}
