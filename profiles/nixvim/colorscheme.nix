{...}: {
  programs.nixvim = {
    colorschemes.ayu = {
      enable = true;

      # TODO: Add settings when upstream supports it
      # settings = {
      #   style = "deep";
      # };
    };
  };
}
