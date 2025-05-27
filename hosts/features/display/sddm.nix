{pkgs, ...}: let
  imgLink = "https://raw.githubusercontent.com/Pesteves2002/dotfiles/nixos/home/tomas/features/config/wallpapers/beach.png";

  image = pkgs.fetchurl {
    url = imgLink;
    hash = "sha256-fHOdO+8KmnjLiyBsPfiW3QRS1PsVfTJOyrifYD0Gr20=";
  };

  sddm-astronaut = pkgs.sddm-astronaut.override {
    themeConfig = {
      Background = "${image}";
    };
  };
in {
  services = {
    xserver.enable = true;

    displayManager.sddm = {
      enable = true;
      autoNumlock = true;

      theme = "sddm-astronaut-theme";

      extraPackages = [sddm-astronaut];
      package = pkgs.kdePackages.sddm; # qt6 sddm version

      #wayland.enable = true;
    };
  };

  environment.systemPackages = [
    sddm-astronaut
    pkgs.pipewire
  ];
}
