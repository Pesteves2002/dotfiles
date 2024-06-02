{...}: {
  programs.nixvim.opts = {
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

    spell = true;
    spelllang = ["en" "pt"];

    foldenable = false;

    undofile = true;
    undodir = "/tmp//";
  };
}
