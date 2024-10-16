{pkgs, ...}: let
  tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
in {
  services = {
    xserver = {
      enable = true;
      displayManager.setupCommands = ''
        ${pkgs.numlockx}/bin/numlockx on
      '';
    };

    greetd = {
      enable = true;
      settings = rec {
        intial_session = {
          command = "${tuigreet} --time --remember --cmd  ${pkgs.hyprland}/bin/hyprland";
        };
        default_session = intial_session;
      };
    };
  };

  # this is a life saver.
  # literally no documentation about this anywhere.
  # might be good to write about this...
  # https://www.reddit.com/r/NixOS/comments/u0cdpi/tuigreet_with_xmonad_how/
  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Without this errors will spam on screen
    # Without these bootlogs will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}
