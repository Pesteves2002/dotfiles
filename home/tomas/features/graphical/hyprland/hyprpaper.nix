let
  wallpaper = toString ../../config/wallpapers/moon.jpg;
in {
  services.hyprpaper = {
    enable = true;

    settings = {
      ipc = "on";
      splash = false;

      preload = [wallpaper];
      wallpaper = [",${wallpaper}"];
    };
  };
}
