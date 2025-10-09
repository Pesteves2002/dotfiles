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
      firefox.enable = false;

      wofi.enable = true;
    };
  };

  # https://www.reddit.com/r/NixOS/comments/1ivo70f/comment/mebnssf/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
  stylix.targets.gnome-text-editor.enable = false;
}
