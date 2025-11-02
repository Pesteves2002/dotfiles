{
  imports = [
    ./hardware.nix
    ../tomas.nix

    ../common.nix

    ../features/display/greetd.nix
    ../features/display/hyprland.nix

    ../features/audio

    ../features/networking
    ../features/networking/dns.nix
    ../features/networking/networkmanager.nix
    ../features/networking/bluetooth.nix

    ../features/drivers/amd.nix

    ../features/laptop

    ../features/devices/ios.nix

    ../features/boot/grub.nix

    ../features/services/localsend.nix

    ../features/system/home-manager.nix

    ../features/virtualisation/virtual-machines.nix
  ];

  networking = {
    hostName = "dragonfly"; # Define your hostname.
    hostId = "53c8f223"; # Created with head -c 8 /etc/machine-id

    dnsServers = ["1.1.1.1" "1.0.0.1" "9.9.9.9"];
  };

  system.stateVersion = "24.11";
}
