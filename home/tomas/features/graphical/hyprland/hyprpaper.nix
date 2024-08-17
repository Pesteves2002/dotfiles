let
  wallpaper = toString ../../config/wallpapers/moon.jpg;
in {
  services.hyprpaper = {
    enable = true;

    settings = {
      ipc = "off";
      splash = false;

      preload = [wallpaper];
      wallpaper = [",${wallpaper}"];
    };
  };
}
