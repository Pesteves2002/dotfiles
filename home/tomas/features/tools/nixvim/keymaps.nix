{
  programs.nixvim.keymaps = [
    # invert search direction
    {
      mode = "n";
      key = "n";
      action = "'Nn'[v:searchforward]";
      options.expr = true;
    }
    {
      mode = "n";
      key = "N";
      action = "'nN'[v:searchforward]";
      options.expr = true;
    }

    # clear search highlight
    {
      mode = "n";
      key = "<Esc>";
      action = ":nohlsearch<CR>";
      options.silent = true;
    }

    # toggle wrap mode
    {
      mode = "n";
      key = "<Leader>w";
      action = ":set wrap!<CR>";
    }

    {
      mode = "n";
      key = "<Leader>u";
      action = ":UndotreeToggle<CR>";
    }

    {
      mode = "n";
      key = "<Leader>gs";
      action = ":Git<CR>";
    }

    # replace word under cursor
    {
      mode = "n";
      key = "<Leader>s";
      action = ":%s/\\<<C-r><C-w>\\>/";
    }

    # move lines up and down
    {
      mode = "v";
      key = "J";
      action = ":m '>+1<CR>gv=gv";
    }
    {
      mode = "v";
      key = "K";
      action = ":m '<-2<CR>gv=gv";
    }

    {
      mode = "t";
      key = "<Esc>";
      action = "<C-\\><C-n>";
    }

    # save methods
    {
      mode = "n";
      key = "<C-s>";
      action = ":w<CR>";
    }
    {
      mode = "i";
      key = "<C-s>";
      action = "<Esc>:w<CR>a";
    }

    {
      # Format file
      mode = "n";
      key = "<space>fm";
      action = "<CMD>lua vim.lsp.buf.format()<CR>";
    }
  ];
}
