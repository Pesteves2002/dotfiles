{
  lib,
  pkgs,
  ...
}: let
  imgLink = "https://raw.githubusercontent.com/Pesteves2002/dotfiles/nixos/home/tomas/features/config/wallpapers/beach.png";

  image = pkgs.fetchurl {
    url = imgLink;
    hash = "sha256-fHOdO+8KmnjLiyBsPfiW3QRS1PsVfTJOyrifYD0Gr20=";
  };
in {
  programs.hyprlock = {
    enable = true;
    package = pkgs.unstable.hyprlock;

    settings = {
      general = {
        # disable_loading_bar = true;
        hide_cursor = false;
        ignore_empty_input = true;
      };

      background = lib.mkForce [
        {
          path = "${image}";
          blur_passes = 1;
          blur_size = 4;
        }
      ];

      input-field = lib.mkForce [
        {
          size = "200, 50";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(202, 211, 245)";
          inner_color = "rgb(91, 96, 120)";
          outer_color = "rgb(24, 25, 38)";
          outline_thickness = 5;
          shadow_passes = 2;
        }
      ];

      label = lib.mkForce [
        {
          text = "$TIME";
          font_size = 96;
          text_align = "center";
          halign = "center";
          valign = "center";
          position = "-560, 240";
        }

        {
          text = "Restart";
          size = "50, 50";
          onclick = "reboot";
        }
      ];
    };
  };
}
