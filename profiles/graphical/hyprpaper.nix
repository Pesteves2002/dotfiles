{pkgs, ...}: {
  home.packages = [pkgs.hyprpaper];

  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ~/.dotfiles/config/wallpapers/planet.png
    wallpaper = ,~/.dotfiles/config/wallpapers/planet.png
  '';
}
