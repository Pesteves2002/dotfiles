{pkgs, ...}: {
  services = {
    xserver.enable = true;

    displayManager.sddm = {
      enable = true;
      autoNumlock = true;

      theme = "${import ./sddm-theme.nix {inherit pkgs;}}";

      settings = {
        Autologin = {
          Session = "Hyprland";
          User = "tomas";
        };
      };

      extraPackages = with pkgs; [libsForQt5.qt5.qtquickcontrols2 libsForQt5.qt5.qtgraphicaleffects];
    };
  };
}
