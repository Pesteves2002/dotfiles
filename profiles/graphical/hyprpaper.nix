{pkgs, ...}: {
  home.packages = [pkgs.hyprpaper];

  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ~/.dotfiles/config/wallpapers/road.png
    wallpaper = ,~/.dotfiles/config/wallpapers/road.png
  '';
}
