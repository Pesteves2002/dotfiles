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
      package = pkgs.nextcloud31;

      hostName = domain;

      database.createLocally = true;

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
