{
  imports = [
    ./hardware.nix

    ../common.nix

    ../features/display/sddm.nix
    ../features/display/hyprland.nix

    ../features/audio

    ../features/networking
    ../features/networking/minecraft.nix

    ../features/drivers/nvidia.nix

    ../features/boot/systemd-boot.nix
  ];

  networking.hostName = "novablast";

  system.stateVersion = "23.11"; # Did you read the comment?
}
