{
  pkgs,
  config,
  ...
}: let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  users.mutableUsers = true;
  users.users.tomas = {
    description = "Tomás Esteves";
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups =
      [
        "wheel" # Permission to use 'sudo'
        "video"
        "audio"
      ]
      ++ ifTheyExist [
        "network"
        "networkmanager"
        "net"
        "docker"
        "podman"
        "git"
        "dialout"
        "plugdev"
        "libvirtd"
      ];
  };

  home-manager.users.tomas = import ../home/tomas/${config.networking.hostName};
}
