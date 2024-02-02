# # profiles/graphical/i3.nix
#
# Author: Tomás Esteves <tomasesteves2002@gmail.com>
# URL:    https://github.com/Pesteves2002/dotfiles
#
# i3configuration

{ config, lib, pkgs, ... }: {
  xsession = {
    enable = true;
    windowManager.i3 = {
      enable = true;
      config = {
        modifier = "Mod4";

        menu = "${pkgs.rofi}/bin/rofi -matching normal -modi drun -show drun";
      };
    };
  };
}
