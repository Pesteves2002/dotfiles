{
  lib,
  sshKeys,
  ...
}: {
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      LoginGraceTime = 0;
    };
    authorizedKeysFiles = lib.mkForce ["/etc/ssh/authorized_keys.d/%u"];
  };

  users = {
    users = {
      tomas.openssh.authorizedKeys.keys = sshKeys;
    };
  };
}
