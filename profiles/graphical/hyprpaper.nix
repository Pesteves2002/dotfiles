{...}: {
  services.hyprpaper = {
    enable = true;

    settings = {
      ipc = "on";
      splash = false;

      preload = ["/home/tomas/.dotfiles/config/wallpapers/moon.jpg"];
      wallpaper = [",/home/tomas/.dotfiles/config/wallpapers/moon.jpg"];
    };
  };
}
