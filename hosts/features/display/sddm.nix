{pkgs, ...}: {
  services = {
    xserver.enable = true;

    displayManager.sddm = {
      enable = true;
      autoNumlock = true;

      theme = "${import ./sddm-theme.nix {inherit pkgs;}}";

      extraPackages = with pkgs; [libsForQt5.qt5.qtquickcontrols2 libsForQt5.qt5.qtgraphicaleffects];
    };
  };
}
