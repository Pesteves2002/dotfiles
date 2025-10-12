{
  imports = [
    ./hardware.nix
    ../tomas.nix

    ../common.nix

    ../features/networking/dns.nix
    ../features/networking/icmp.nix
    ../features/networking/sshd.nix
    ../features/networking/fail2ban.nix
    # ../features/networking/minecraft.nix

    ../features/boot/grub.nix

    ../features/filesystem/ext4.nix

    # ../features/virtualisation/docker.nix
  ];

  filesystem.mainDisk = "/dev/sda";
  filesystem.espSize = "128M";
  filesystem.useEfi = false; # OVH does not support UEFI

  networking = {
    hostName = "takumi";
  };

  system.stateVersion = "24.11";
}
