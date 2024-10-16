{pkgs, ...}: {
  stylix = {
    enable = true;

    image = ./features/config/wallpapers/moon.jpg;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/da-one-gray.yaml";

    targets = {
      hyprland.enable = false;
      nixvim.enable = false;
waybar.enable = false;
      wofi.enable = true;
    };
  };
}
