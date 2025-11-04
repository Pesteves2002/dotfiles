{
  programs.nixvim.plugins.copilot-lua = {
    enable = true;

    settings = {
      filetypes = {
        "*" = true;
      };

      server_opts_overrides = {offsetEncoding = "utf-16";};

      panel = {
        enabled = false;
      };

      suggestion = {
        enabled = false;
      };
    };
  };
}
