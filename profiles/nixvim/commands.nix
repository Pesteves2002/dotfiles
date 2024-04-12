{...}: {
  programs.nixvim = {
    autoCmd = [
      # save position in file (cursed thingies)
      {
        event = "BufReadPost";
        pattern = "*";
        callback = {__raw = "function() vim.api.nvim_exec('silent! normal! g`\"zv', false) end";};
      }
    ];
    extraConfigLua = ''
      vim.cmd('cabbrev W w')
    '';
  };
}
