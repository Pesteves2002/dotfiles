{
  inputs,
  config,
  secrets,
  ...
}: let
  domain = "tomase.pt";
  mail_domain = "mail.${domain}";
in {
  imports = [
    inputs.simple-nixos-mailserver.nixosModule
  ];

  age.secrets.mailTomas.file = "${secrets}/takumi/mailTomas.age";

  mailserver = {
    enable = true;

    stateVersion = 3;

    fqdn = mail_domain;
    domains = [domain];

    loginAccounts = {
      "tomas@tomase.pt" = {
        hashedPasswordFile = config.age.secrets.mailTomas.path;

        aliases = ["@tomase.pt"];
      };
    };

    # Use Let's Encrypt certificates. Note that this needs to set up a stripped
    # down nginx and opens port 80.
    certificateScheme = "acme-nginx";
  };
}
