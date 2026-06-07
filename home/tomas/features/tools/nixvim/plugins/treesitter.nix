{
  programs.nixvim = {
    plugins = {
      treesitter = {
        enable = true;
        nixGrammars = true;
        nixvimInjections = true;

        autoLoad = true;
        folding.enable = false;

        highlight = {
          enable = true;
          # additional_vim_regex_highlighting = true;

          disable = [
            ''
              function(lang, buf)
                      local max_filesize = 100 * 1024 -- 100 KB
                      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                      if ok and stats and stats.size > max_filesize then
                          return true
                      end
                  end
            ''
          ];
        };

        settings = {
          auto_install = true;
          incremental_selection.enable = true;
          indent.enable = true;
        };
      };

      treesitter-context = {
        enable = true;
        settings = {max_lines = 2;};
      };
    };
  };
}
