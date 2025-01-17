{
  programs.nixvim = {
    plugins = {
      # Help with commands completion
      which-key = {
        enable = true;
        settings = {
        };
      };

      web-devicons.enable = true;
      mini.enable = true;
    };
  };
}
