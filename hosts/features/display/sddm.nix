{pkgs, ...}: {
  services = {
    xserver = {
      enable = true;
      displayManager.setupCommands = ''
        ${pkgs.numlockx}/bin/numlockx on
      '';
    };

    displayManager = {
      sddm = {
        enable = true;
        theme = "${import ./sddm-theme.nix {inherit pkgs;}}";
        extraPackages = with pkgs; [libsForQt5.qt5.qtquickcontrols2 libsForQt5.qt5.qtgraphicaleffects];
      };
    };
  };
}
