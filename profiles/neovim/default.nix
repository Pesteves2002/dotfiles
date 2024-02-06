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
      inherit lists;
      nvim-treesitter = pkgs.vimPlugins.nvim-treesitter;
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
