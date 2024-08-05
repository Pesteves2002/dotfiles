# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware.nix

    ../common.nix

    ../features/boot/systemd-boot.nix
  ];

  networking.hostName = "novablast";

  # Enable networking
  networking.networkmanager.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    grim
    slurp
    swappy
    wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
  ];

  # Add nvidia drivers
  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    # Modesetting is required.
    modesetting.enable = true;
    # Use the open source version of the kernel module (for driver 515.43.04+)
    open = true;
    # Enable the Nvidia settings menu
    nvidiaSettings = true;
    # Select the appropriate driver version for your specific GPU
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  programs.hyprland.enable = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";

    MOZ_ENABLE_WAYLAND = "1";
  };

  # xdg portal is required for screenshare
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  services.pipewire.wireplumber.enable = true;

  # needed to allow unlock with hyprlock
  security.pam.services.hyprlock = {};

  system.stateVersion = "23.11"; # Did you read the comment?

  fonts.packages = with pkgs; [
    fira-code
    nerdfonts
    noto-fonts
    noto-fonts-extra
    noto-fonts-emoji
    noto-fonts-cjk-sans
    font-awesome
  ];
}
