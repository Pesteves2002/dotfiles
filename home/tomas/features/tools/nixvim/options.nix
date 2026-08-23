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
    };

    autoCmd = [
      {
        event = ["FileType"];
        pattern = ["markdown" "gitcommit" "text" "tex"];
        command = "setlocal spell";
      }
    ];
  };
}
