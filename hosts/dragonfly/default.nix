{
  imports = [
    ./hardware.nix

    ../common.nix

    ../features/display/greetd.nix
    ../features/display/hyprland.nix

    ../features/audio

    ../features/networking
    ../features/networking/networkmanager.nix
    ../features/networking/bluetooth.nix

    ../features/drivers/amd.nix

    ../features/laptop

    ../features/boot/grub.nix
  ];

  networking.hostName = "dragonfly"; # Define your hostname.
  networking.hostId = "53c8f223"; # Created with head -c 8 /etc/machine-id

  system.stateVersion = "24.05"; # Did you read the comment?
}
