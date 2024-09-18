{pkgs, ...}: {
  virtualisation.libvirtd = {
    enable = true;
    onBoot = "ignore";
  };

  environment.systemPackages = [pkgs.virt-manager];
}
