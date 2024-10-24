{pkgs, ...}: {
  stylix = {
    enable = true;

    image = ./features/config/wallpapers/moon.jpg;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/da-one-gray.yaml";

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    fonts = {
      monospace = {
        package = pkgs.iosevka;
        name = "IosevkaTerm";
      };

      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };

      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };

      sizes = {
        applications = 12;
        terminal = 12;
        desktop = 10;
        popups = 10;
      };
    };

    polarity = "dark";

    targets = {
      hyprland.enable = false;
      nixvim.enable = false;
      waybar.enable = false;
      zathura.enable = false;

      wofi.enable = true;
    };
  };
}
