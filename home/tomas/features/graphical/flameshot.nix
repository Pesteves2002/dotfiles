{
  config,
  pkgs,
  ...
}: {
  services.flameshot = {
    enable = true;
    package = pkgs.flameshot.overrideAttrs (oldAttrs: {
      buildInputs = oldAttrs.buildInputs ++ [pkgs.libsForQt5.kguiaddons];
      cmakeFlags = [
        "-DUSE_WAYLAND_CLIPBOARD=true"
      ];
    });

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

  xdg.portal = {
    enable = true;
    configPackages = with pkgs; [xdg-desktop-portal-wlr];
    extraPortals = with pkgs; [xdg-desktop-portal-gtk];
  };
}
