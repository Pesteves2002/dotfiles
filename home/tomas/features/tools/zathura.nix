{
  programs.zathura = {
    enable = true;

    options = {
      scroll-page-aware = "true";
      smooth-scroll = "true";
      show-scrollbars = "true";

      window-title-page = "true";

      incremental-search = "true";

      selection-clipboard = "clipboard";

      recolor = "true"; # open documents with inverted colors by default
      recolor-keephue = "true";
    };
  };
}
