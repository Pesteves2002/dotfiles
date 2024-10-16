{
  lib,
  pkgs,
  ...
}: {
  gtk = {
    enable = true;

    theme = lib.mkDefault {
      package = pkgs.nordic;
      name = "Nordic-darker";
    };

    iconTheme = lib.mkDefault {
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita";
    };
  };
}
