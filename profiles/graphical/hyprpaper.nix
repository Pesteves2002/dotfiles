{pkgs, ...}: {
  home.packages = [pkgs.hyprpaper];

  xdg.configFile."hypr/hyprpaper.conf".text = ''
        preload = ~/.dotfiles/config/wallpapers/escape_velocity.jpg
    wallpaper = ,~/.dotfiles/config/wallpapers/escape_velocity.jpg

  '';
}
