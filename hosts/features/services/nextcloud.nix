{
  pkgs,
  secrets,
  config,
  ...
}: let
  domain = "cloud.tomase.pt";
in {
  age.secrets.nextcloud = {
    file = "${secrets}/takumi/nextcloud.age";
    owner = "nextcloud";
    group = "nextcloud";
  };

  services = {
    nextcloud = {
      enable = true;
      package = pkgs.nextcloud32;

      hostName = domain;

      database.createLocally = true;

      configureRedis = true;

      https = true;

      autoUpdateApps.enable = true;
      extraAppsEnable = true;
      extraApps = with config.services.nextcloud.package.packages.apps; {
        inherit notes;
      };

      settings = {
        defaultPhoneRegion = "PT";
        overwriteprotocol = "https";

        updatechecker = false;
      };

      config = {
        adminuser = "admin";
        adminpassFile = config.age.secrets.nextcloud.path;
        dbtype = "pgsql";
      };
    };

    nginx.virtualHosts.${domain} = {
      forceSSL = true;
      enableACME = true;
    };
  };
}
