{
  programs.nixvim = {
    opts = {
      updatetime = 100;

      number = true;
      relativenumber = true;

      list = true;
      listchars = {
        tab = ">-";
        trail = "~";
        extends = ">";
        precedes = "<";
      };

      mouse = "a";

      wrap = false;

      scrolloff = 12;

      splitbelow = true;
      splitright = true;

      ignorecase = true;
      smartcase = true;

      # spell is now scoped to prose filetypes below instead of global,
      # so it doesn't squiggle-underline code identifiers.
      spelllang = ["en" "pt"];

      undofile = true;
      # was "/tmp//": /tmp doesn't survive reboots (often tmpfs), so undo
      # history was silently thrown away. Persist it under XDG state instead.
      undodir = "~/.local/state/nvim/undo//";
    };

    # Make sure the undodir actually exists; nvim won't create it for you.
    extraConfigLua = ''
      vim.fn.mkdir(vim.fn.expand("~/.local/state/nvim/undo"), "p")
    '';

    autoCmd = [
      {
        event = ["FileType"];
        pattern = ["markdown" "gitcommit" "text" "tex"];
        command = "setlocal spell";
      }
    ];
  };
}
