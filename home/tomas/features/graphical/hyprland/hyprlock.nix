{
  lib,
  pkgs,
  config,
  ...
}: let
  imgLink = "https://raw.githubusercontent.com/Pesteves2002/dotfiles/nixos/home/tomas/features/config/wallpapers/beach.png";

  image = pkgs.fetchurl {
    url = imgLink;
    hash = "sha256-fHOdO+8KmnjLiyBsPfiW3QRS1PsVfTJOyrifYD0Gr20=";
  };

  inherit (config.laptop) isLaptop;
  mainMonitor = (lib.findFirst (m: m.primary) null config.monitors).name or "";
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
          blur_passes = 2;
          blur_size = 4;
        }
      ];

      input-field = lib.mkForce [
        {
          monitor = mainMonitor;
          size = "200, 50";
          outline_thickness = 5;

          dots_center = true;

          outer_color = "rgb(24, 25, 38)";
          inner_color = "rgb(91, 96, 120)";
          font_color = "rgb(202, 211, 245)";
          fade_on_empty = false;

          position = "0, 0";

          shadow_passes = 2;
        }
      ];

      label =
        [
          {
            monitor = mainMonitor;
            text = "$TIME";

            font_size = 128;

            position = "-25%, 25%";
          }
        ]
        ++ lib.optionals (!isLaptop) [
          {
            monitor = mainMonitor;
            text = "Restart";

            color = "rgb(202, 211, 245)";

            font_size = 14;

            position = "0, -25%";
            zindex = 1; # ensure it's above the shape

            onclick = "reboot";
          }
        ];

      shape = lib.optionals (!isLaptop) [
        {
          monitor = mainMonitor;
          size = "205, 50";

          color = "rgb(91, 96, 120)";
          rounding = -1; # smooth rounded corners

          border_size = 5;
          border_color = "rgb(24, 25, 38)";

          position = "0, -25%";

          shadow_passes = 2;
        }
      ];
    };
  };
}
