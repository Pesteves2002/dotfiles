{
  imports = [
    ./hardware.nix

    ../common.nix

    ../features/display/sddm.nix
    ../features/display/hyprland.nix

    ../features/audio

    ../features/networking
    ../features/networking/icmp.nix
    ../features/networking/sshd.nix
    ../features/networking/fail2ban.nix
    ../features/networking/minecraft.nix
    ../features/networking/wakeonlan.nix

    ../features/drivers/nvidia.nix

    ../features/boot/systemd-boot.nix
  ];

  networking = {
    hostName = "novablast";
    wiredInterface = "enp750";
  };

  system.stateVersion = "23.11"; # Did you read the comment?
}
