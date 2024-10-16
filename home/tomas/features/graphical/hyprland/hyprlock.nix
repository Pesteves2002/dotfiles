let
  wallpaper = toString ../../config/wallpapers/fractal.png;
in {
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        # disable_loading_bar = true;
        hide_cursor = true;
        ignore_empty_input = true;
      };

      background = [
        {
          path = wallpaper;
          blur_passes = 1;
          blur_size = 4;
        }
      ];

      input-field = [
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

      label = [
        {
          text = "$TIME";
          font_size = 96;
          text_align = "center";
          halign = "center";
          valign = "center";
          position = "-560, 240";
        }
      ];
    };
  };
}
