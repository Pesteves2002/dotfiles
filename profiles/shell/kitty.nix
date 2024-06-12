{...}: {
  programs.kitty = {
    enable = true;

    shellIntegration.enableZshIntegration = true;

    theme = "GitHub Dark";

    font = {
      name = "Fira Code";
      size = 11;
    };

    keybindings = {
      "ctrl+plus" = "increase_font_size all +1.0";
      "ctrl+minus" = "decrease_font_size all -1.0";
    };

    settings = {
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      enable_audio_bell = false;
    };

    extraConfig = ''
      confirm_os_window_close 2
    '';
  };
  home.sessionVariables.TERMINAL = "kitty";
}
