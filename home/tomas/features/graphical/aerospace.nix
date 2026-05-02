{pkgs, ...}: let
  focus = dir: "focus --boundaries all-monitors-outer-frame --boundaries-action wrap-around-all-monitors ${dir}";
  move = dir: "move --boundaries all-monitors-outer-frame --boundaries-action create-implicit-container ${dir}";
  move-workspace = id: "move-node-to-workspace --focus-follows-window ${id}";
in {
  programs.aerospace = {
    enable = true;

    package = pkgs.unstable.aerospace;

    launchd.enable = true;

    userSettings = {
      "config-version" = 2;

      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;

      accordion-padding = 30;

      default-root-container-layout = "tiles";
      default-root-container-orientation = "auto";

      on-focused-monitor-changed = ["move-mouse monitor-lazy-center"];

      automatically-unhide-macos-hidden-apps = true;

      persistent-workspaces = [
        "1"
        "2"
        "3"
        "4"
        "5"
        "6"
        "7"
        "8"
        "9"
        "A"
        "B"
        "C"
        "D"
        "E"
        "F"
        "G"
        "I"
        "M"
        "N"
        "O"
        "P"
        "Q"
        "R"
        "S"
        "T"
        "U"
        "V"
        "W"
        "X"
        "Y"
        "Z"
      ];

      on-mode-changed = [];

      after-startup-command = [
        "exec-and-forget borders active_color=0xffe1e3e4 inactive_color=0xff494d64 width=5.0"
      ];

      key-mapping.preset = "qwerty";

      gaps = {
        inner = {
          horizontal = 0;
          vertical = 0;
        };

        outer = {
          left = 0;
          bottom = 0;
          top = 0;
          right = 0;
        };
      };

      mode.main.binding = {
        alt-slash = "layout tiles horizontal vertical";
        alt-comma = "layout accordion horizontal vertical";

        alt-h = focus "left";
        alt-j = focus "down";
        alt-k = focus "up";
        alt-l = focus "right";

        alt-left = focus "left";
        alt-down = focus "down";
        alt-up = focus "up";
        alt-right = focus "right";

        alt-shift-h = move "left";
        alt-shift-j = move "down";
        alt-shift-k = move "up";
        alt-shift-l = move "right";

        alt-shift-left = move "left";
        alt-shift-down = move "down";
        alt-shift-up = move "up";
        alt-shift-right = move "right";

        alt-minus = "resize smart -50";
        alt-equal = "resize smart +50";

        alt-1 = "workspace 1";
        alt-2 = "workspace 2";
        alt-3 = "workspace 3";
        alt-4 = "workspace 4";
        alt-5 = "workspace 5";
        alt-6 = "workspace 6";
        alt-7 = "workspace 7";
        alt-8 = "workspace 8";
        alt-9 = "workspace 9";
        alt-a = "workspace A";
        alt-b = "workspace B";
        alt-c = "workspace C";
        alt-d = "workspace D";
        alt-e = "workspace E";
        alt-f = "workspace F";
        alt-g = "workspace G";
        alt-i = "workspace I";
        alt-m = "workspace M";
        alt-n = "workspace N";
        alt-o = "workspace O";
        alt-p = "workspace P";
        alt-q = "workspace Q";
        alt-r = "workspace R";
        alt-s = "workspace S";
        alt-t = "workspace T";
        alt-u = "workspace U";
        alt-v = "workspace V";
        alt-w = "workspace W";
        alt-x = "workspace X";
        alt-y = "workspace Y";
        alt-z = "workspace Z";

        alt-shift-1 = move-workspace "1";
        alt-shift-2 = move-workspace "2";
        alt-shift-3 = move-workspace "3";
        alt-shift-4 = move-workspace "4";
        alt-shift-5 = move-workspace "5";
        alt-shift-6 = move-workspace "6";
        alt-shift-7 = move-workspace "7";
        alt-shift-8 = move-workspace "8";
        alt-shift-9 = move-workspace "9";
        alt-shift-a = move-workspace "A";
        alt-shift-b = move-workspace "B";
        alt-shift-c = move-workspace "C";
        alt-shift-d = move-workspace "D";
        alt-shift-e = move-workspace "E";
        alt-shift-f = move-workspace "F";
        alt-shift-g = move-workspace "G";
        alt-shift-i = move-workspace "I";
        alt-shift-m = move-workspace "M";
        alt-shift-n = move-workspace "N";
        alt-shift-o = move-workspace "O";
        alt-shift-p = move-workspace "P";
        alt-shift-q = move-workspace "Q";
        alt-shift-r = move-workspace "R";
        alt-shift-s = move-workspace "S";
        alt-shift-t = move-workspace "T";
        alt-shift-u = move-workspace "U";
        alt-shift-v = move-workspace "V";
        alt-shift-w = move-workspace "W";
        alt-shift-x = move-workspace "X";
        alt-shift-y = move-workspace "Y";
        alt-shift-z = move-workspace "Z";

        alt-tab = "workspace-back-and-forth";
        alt-shift-tab = "move-workspace-to-monitor --wrap-around next";

        alt-shift-semicolon = "mode service";
      };

      mode.service.binding = {
        esc = ["reload-config" "mode main"];
        r = ["flatten-workspace-tree" "mode main"];
        f = ["layout floating tiling" "mode main"];
        backspace = ["close-all-windows-but-current" "mode main"];

        alt-shift-h = ["join-with left" "mode main"];
        alt-shift-j = ["join-with down" "mode main"];
        alt-shift-k = ["join-with up" "mode main"];
        alt-shift-l = ["join-with right" "mode main"];
      };
    };
  };

  home.packages = with pkgs; [
    jankyborders
  ];
}
