{pkgs, ...}: {
  programs.swaylock = {
    enable = true;
    settings = {
      ignore-empty-password = true;
      show-failed-attempts = true;
      image = "~/.dotfiles/config/wallpapers/escape_velocity.jpg";
      indicator-caps-lock = true;
      indicator-radius = 100;
    };
  };
}
