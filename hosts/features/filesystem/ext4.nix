{
  config,
  inputs,
  lib,
  ...
}: let
  inherit (config.filesystem) espSize;
in {
  imports = [
    inputs.disko.nixosModules.disko
  ];

  assertions = [
    {
      assertion = config.filesystem.mainDisk != null;
      message = ''
        Declaring a filesystem requires filesystem.mainDisk to be set
      '';
    }
  ];

  # Partitions configuration (using disko)
  disko.devices = {
    disk = {
      # Define disk with two partitions, one EFI boot partition
      # and another ext4 taking up the remaining of the disk space.
      # If using legacy boot, create an additional partition for GRUB.
      disk0 = {
        type = "disk";
        device = config.filesystem.mainDisk;
        content = {
          type = "gpt";
          partitions =
            (lib.optionalAttrs (!config.filesystem.useEfi) {
              boot = {
                size = "1M";
                type = "EF02"; # for grub MBR
              };
            })
            // {
              ESP = {
                size = espSize;
                type = "EF00"; # for EFI boot
                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountOptions = ["umask=0077"];
                  mountpoint = "/boot";
                };
              };
              root = {
                size = "100%";
                content = {
                  type = "filesystem";
                  format = "ext4";
                  mountpoint = "/";
                };
              };
            };
        };
      };
    };
  };
}
