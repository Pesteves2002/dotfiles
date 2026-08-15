{pkgs, ...}: let
  focus = dir: "focus --boundaries all-monitors-outer-frame --boundaries-action wrap-around-all-monitors ${dir}";
  move = dir: "move-workspace-to-monitor ${dir}";
  move-workspace = id: "move-node-to-workspace --focus-follows-window ${id}";
  # https://github.com/nikitabobko/AeroSpace/issues/101
  workspace = id: ["workspace ${toString id}" "workspace ${toString id}" "workspace ${toString id}"];
  windowDetected = appId: workspaceId: {
    "if".app-id = appId;
    run = "move-node-to-workspace ${workspaceId}";
  };
in {
  programs.aerospace = {
    enable = true;

    launchd.enable = true;

    settings = {
      "config-version" = 2;

      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;

      accordion-padding = 30;

      default-root-container-layout = "tiles";
      default-root-container-orientation = "auto";

      focus-follows-mouse = true;

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
        "10"
      ];

      on-window-detected = [
        (windowDetected "net.kovidgoyal.kitty" "1")
        (windowDetected "com.tinyspeck.slackmacgap" "3")
        (windowDetected "com.todesktop.230313mzl4w4u92" "7")
        (windowDetected "com.microsoft.VSCode" "7")
        (windowDetected "com.docker.docker" "8")
      ];

      on-mode-changed = [];

      after-startup-command = [
        "exec-and-forget ${pkgs.jankyborders}/bin/borders active_color=0xffd79921 inactive_color=0xff282828 width=5.0"
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

        alt-1 = workspace 1;
        alt-2 = workspace 2;
        alt-3 = workspace 3;
        alt-4 = workspace 4;
        alt-5 = workspace 5;
        alt-6 = workspace 6;
        alt-7 = workspace 7;
        alt-8 = workspace 8;
        alt-9 = workspace 9;
        alt-0 = workspace 10;

        alt-shift-1 = move-workspace "1";
        alt-shift-2 = move-workspace "2";
        alt-shift-3 = move-workspace "3";
        alt-shift-4 = move-workspace "4";
        alt-shift-5 = move-workspace "5";
        alt-shift-6 = move-workspace "6";
        alt-shift-7 = move-workspace "7";
        alt-shift-8 = move-workspace "8";
        alt-shift-9 = move-workspace "9";
        alt-shift-0 = move-workspace "10";

        alt-tab = "workspace-back-and-forth";
        alt-shift-tab = "move-workspace-to-monitor --wrap-around next";

        alt-shift-semicolon = "mode service";

        alt-shift-s = "exec-and-forget open -a Flameshot --args gui";
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
