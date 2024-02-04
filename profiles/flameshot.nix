# profiles/flameshot.nix
#
# Author: Tomás Esteves <tomasesteves2002@gmail.com> 
# URL:    https://github.com/Pesteves2002/dotfiles
#
# flameshot configuration

{ config, lib, ... }: {
  services.flameshot = {
    enable = true;

    settings = {

      General = {

        savePath = "${config.home.homeDirectory}/Pictures/Screenshots";

        savePathFixed = true;

        uiColor = "#001fcf";

        showHelp = false;

        showDesktopNotification = false;

        filenamePattern = "%y-%m-%d_%H-%M-%S";

        disabledTrayIcon = true;

        autoCloseIdleDaemon = true;

        startupLaunch = false;

        contrastOpacity = 100;

        predefinedColorPaletteLarge = true;
      };

      Shortcuts = {

        TYPE_PENCIL = "W";
        TYPE_PIN = "P";
      };

    };

  };
}
