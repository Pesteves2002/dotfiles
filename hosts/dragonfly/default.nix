{
  imports = [
    ./hardware.nix

    ../common.nix

    ../tomas.nix

    ../features/audio

    ../features/boot/grub.nix

    ../features/devices/ios.nix
    ../features/display/greetd.nix
    ../features/display/hyprland.nix

    ../features/drivers/amd.nix

    ../features/laptop

    ../features/networking/bluetooth.nix
    ../features/networking/networkmanager.nix

    ../features/services/localsend.nix
  ];

  networking = {
    hostName = "dragonfly"; # Define your hostname.
    hostId = "53c8f223"; # Created with head -c 8 /etc/machine-id

    dnsServers = ["1.1.1.1" "1.0.0.1" "9.9.9.9"];
  };

  system.stateVersion = "24.11";
}
