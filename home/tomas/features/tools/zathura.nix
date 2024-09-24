{
  programs.zathura = {
    enable = true;

    options = {
      scroll-page-aware = "true";

      window-title-page = "true";

      incremental-search = "true";

      selection-clipboard = "clipboard";

      recolor = "true"; # open documents with inverted colors by default
      recolor-keephue = "true";
    };
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # Use Zathura as default PDF viewer
      "application/pdf" = ["org.pwmt.zathura.desktop"];
    };
  };
}
