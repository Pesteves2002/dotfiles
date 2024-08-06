{lib, ...}: let
  sshKeys = [
    "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBMOPNp+vhM3oHBcsCIWys8t8/pRz7q6Tlt2orblvYmPHXoQ3QhNTI9zlyLhBaF/Ol2ac6LpRJjnTGu41uq8ccso="
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPa8Z24yEquM4MZTbflPvA3LufkHgdWX62OGrjufkfzP tomas@novablast"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL0r4o+OjJ18Ue3L0KfNh7dyMQ+MsFLWAraBuUhH0mDM tomas@dragonfly"
  ];
in {
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
