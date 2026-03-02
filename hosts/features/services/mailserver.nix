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

    dmarcReporting.enable = true;

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

  security.acme.certs.${mail_domain} = {
    # keep a stable private key for TLSA records (DANE)
    # https://community.letsencrypt.org/t/please-avoid-3-0-1-and-3-0-2-dane-tlsa-records-with-le-certificates/7022/14
    extraLegoRenewFlags = ["--reuse-key"];
  };
}
