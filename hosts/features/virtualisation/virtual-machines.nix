{pkgs, ...}: {
  virtualisation.libvirtd = {
    enable = true;
    onBoot = "ignore";

    qemu.ovmf.enable = true; # enable UEFI
  };

  environment.systemPackages = [pkgs.virt-manager];
}
