{...}: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    theme = "GitHub Dark";
    extraConfig = "
     confirm_os_window_close 2
";
  };
}
