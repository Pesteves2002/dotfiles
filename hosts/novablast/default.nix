{
  imports = [
    ./hardware.nix

    ../common.nix

    ../features/display/sddm.nix
    ../features/display/hyprland.nix
    ../features/display/i3.nix

    ../features/audio

    ../features/networking
    ../features/networking/static.nix
    ../features/networking/dns.nix
    ../features/networking/icmp.nix
    ../features/networking/sshd.nix
    ../features/networking/fail2ban.nix
    # ../features/networking/minecraft.nix

    ../features/devices/ios.nix

    ../features/drivers/nvidia.nix

    ../features/boot/systemd-boot.nix

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
