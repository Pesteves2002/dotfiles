{
  wayland.windowManager.hyprland = {
    settings = {
      decoration = {
        blur.enabled = false;
        drop_shadow = false;
      };

      animation = [
        "windows, 1, 2, default, slide"
        "borderangle, 0, 30, linear, loop" # Disable border angle
        "workspaces, 1, 2, default, slide"
      ];

      gestures = {
        workspace_swipe = true;
      };

      misc.vfr = true;
    };
  };
}
