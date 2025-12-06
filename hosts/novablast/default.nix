{
  imports = [
    ./hardware.nix

    ../common.nix

    ../tomas.nix

    ../features/audio

    ../features/boot/systemd-boot.nix

    ../features/devices/ios.nix

    ../features/drivers/nvidia.nix

    ../features/display/hyprland.nix
    # ../features/display/i3.nix
    ../features/display/sddm.nix

    ../features/networking/static.nix

    ../features/services/debug.nix
    ../features/services/localsend.nix

    # ../features/virtualisation/docker.nix
  ];

  networking = {
    hostName = "novablast";

    wiredInterface = "enp7s0";
    ipv4Address = "192.168.1.2";
    ipv4SubnetMask = 24;
    ipv4Gateway = "192.168.1.1";
    dnsServers = ["1.1.1.1" "1.0.0.1" "9.9.9.9"];

    wakeOnLan = true;
  };

  system.stateVersion = "24.11"; # Did you read the comment?
}
