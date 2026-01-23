let
  sshKeys = [
    "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBMOPNp+vhM3oHBcsCIWys8t8/pRz7q6Tlt2orblvYmPHXoQ3QhNTI9zlyLhBaF/Ol2ac6LpRJjnTGu41uq8ccso="
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPa8Z24yEquM4MZTbflPvA3LufkHgdWX62OGrjufkfzP tomas@novablast"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL0r4o+OjJ18Ue3L0KfNh7dyMQ+MsFLWAraBuUhH0mDM tomas@dragonfly"
  ];
in {
  imports = [
    ./hardware.nix

    ../common.nix

    ../tomas.nix

    ../features/boot/grub.nix

    ../features/filesystem/ext4.nix

    ../features/networking/nginx.nix
    ../features/networking/headscale.nix

    ../features/services/mailserver.nix
    ../features/services/minecraft.nix
    ../features/services/grafana.nix
    ../features/services/nextcloud.nix
    ../features/services/results-bot.nix
    ../features/services/website.nix

    # ../features/virtualisation/docker.nix
  ];

  filesystem = {
    mainDisk = "/dev/sda";
    espSize = "128M";
    useEfi = false; # OVH does not support UEFI
  };

  networking = {
    wiredInterface = "ens3";

    hostName = "takumi";
    dnsServers = ["1.1.1.1" "1.0.0.1" "9.9.9.9"];
  };

  users.users.root.openssh.authorizedKeys.keys = sshKeys;

  system.stateVersion = "24.11";
}
