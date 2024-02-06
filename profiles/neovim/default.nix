# profiles/neovim/default.nix
# Author: Tomás Esteves <tomasesteves2002@gmail.com>
# URL:    https://github.com/Pesteves2002/dotfiles
#
# neovim configuration

{ config, lib, pkgs, osConfig, ... }:
let
  inherit (lib) lists;
  plugins = with pkgs.vimPlugins; [

    (import ./tree-sitter.nix {
      inherit lists nvim-treesitter;
    })

    {
      plugin = nvim-lspconfig;
      type = "lua";
      config = ''
        -- common lsp setup
        local lsp_config = require'lspconfig'
        local lsp_setup = require'generic_lsp'
      '';
    }
    cmp_luasnip
    cmp-treesitter
    cmp-nvim-lsp
    cmp-spell
    cmp-path
    cmp-git

    {
      plugin = gruvbox-nvim;
      config = "colorscheme gruvbox";
    }

    {
      plugin = vim-illuminate;
      config = ''
        let g:Illuminate_delay = 100
        hi def link LspReferenceText CursorLine
        hi def link LspReferenceRead CursorLine
        hi def link LspReferenceWrite CursorLine
      '';
    }

    nvim-web-devicons
    vim-signature

    {
      plugin = nerdcommenter;
      type = "lua";
      config = ''
        vim.g.NERDCreateDefaultMappings = 0
        vim.g.NERDSpaceDelims = 1

        vim.keymap.set('n', '<leader>cc', '<Plug>NERDCommenterToggle')
        vim.keymap.set('x', '<leader>cc', '<Plug>NERDCommenterToggle')
      '';
    }

    {
      plugin = nvim-osc52;
      type = "lua";
      config = ''
        local function copy(lines, _)
          require('osc52').copy(table.concat(lines, '\n'))
        end

        local function paste()
          return {vim.fn.split(vim.fn.getreg(""), '\n'), vim.fn.getregtype("")}
        end

        vim.g.clipboard = {
          name = 'osc52',
          copy = {['+'] = copy, ['*'] = copy},
          paste = {['+'] = paste, ['*'] = paste},
        }

        -- Now the '+' register will copy to system clipboard using OSC52
        vim.keymap.set(''', '<leader>y', '"+y')
        vim.keymap.set('n', '<leader>Y', '"+y$')
      '';
    }

  ];

  files = {
    "${config.xdg.configHome}/nvim/lua/generic_lsp.lua".source =
      ./generic_lsp.lua;
  };
in {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraConfig = builtins.readFile ./base.vim;
    inherit plugins;

  };

  home.file = files;

  home.sessionVariables = { EDITOR = "nvim"; };

}
