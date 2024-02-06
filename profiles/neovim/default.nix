# profiles/neovim/default.nix
# Author: Tomás Esteves <tomasesteves2002@gmail.com>
# URL:    https://github.com/Pesteves2002/dotfiles
#
# neovim configuration

{ config, lib, pkgs, osConfig, ... }:
let
  inherit (lib) lists;
  plugins = with pkgs.vimPlugins; [
    # Handles displaying icons for file types in Neovim.
    nvim-web-devicons

    # Adds closing brackets automatically
    {
      plugin = delimitMate;
      config = ''
        let delimitMate_expand_cr=2
        let delimitMate_expand_space=1
      '';
    }

    # Provides code highlighting for LSP references and symbols.
    {
      plugin = vim-illuminate;
      config = ''
        let g:Illuminate_delay = 100
        hi def link LspReferenceText CursorLine
        hi def link LspReferenceRead CursorLine
        hi def link LspReferenceWrite CursorLine
      '';
    }

    # Imports the Nix language support for Treesitter.
    (import ./tree-sitter.nix { inherit lists nvim-treesitter; })

    # Adds visual markers for changes in the gutter.
    vim-signature

    # Fuzzy file searching and navigation with FZF.
    {
      plugin = fzf-lua;
      type = "lua";
      config = ''
        local fzf_lua = require('fzf-lua')
        fzf_lua.setup{
          fzf_opts = {
            ['#layout'] = 'reverse',
          },
          winopts = {
            height = 0.75,
            width = 0.75,
          },
        }

        local set = vim.keymap.set

        local files = function()
          vim.fn.system('git rev-parse #is-inside-work-tree')
          if vim.v.shell_error == 0 then
            fzf_lua.git_files()
          else
            fzf_lua.files()
          end
        end

        -- Fuzzy find files in the working directory (where you launched Vim from)
        set('n', '<leader>f', files)

        -- Fuzzy find lines in the current file
        set('n', '<leader>/', fzf_lua.blines)

        -- Fuzzy find an open buffer
        set('n', '<leader>b', fzf_lua.buffers)

        -- Fuzzy find text in the working directory
        set('n', '<leader>rg', fzf_lua.grep_project)

        -- Fuzzy find Vim commands (like Ctrl-Shift-P in Sublime/Atom/VSC)
        set('n', '<leader>c', fzf_lua.commands)

        local notes_dir = "~/documents/notes/"
        local notes = function()
          fzf_lua.files({cwd = notes_dir})
        end
        -- Fuzzy find files in the notes directory
        set('n', '<leader>no', notes)

        local new_note = function()
          local callback = function(input)
            if (input ~= nil and input ~= "") then
              vim.cmd.edit(notes_dir .. input)
            end
          end
          vim.ui.input({
              prompt = "Enter path for new note: ",
              completion = "file",
            },
            callback)
        end
        set('n', '<leader>nn', new_note)
      '';
    }

    # Allows easy commenting/uncommenting of code.
    vim-commentary

    # Configures the base16-nord color scheme.
    {
      plugin = nvim-base16;
      config = ''
        " colorscheme settings
        set background=dark
        colorscheme base16-nord
      '';
    }

    # Provides utility functions for Neovim plugins.
    plenary-nvim

    # Configures copying and pasting using OSC52 for system clipboard integration.
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

    # Sets up colorizer for color highlighting in files.
    {
      plugin = nvim-colorizer-lua;
      type = "lua";
      config = ''
        require 'colorizer'.setup ({ user_default_options = { names = false; }})
      '';
    }

    # Configures LSP (Language Server Protocol) for Neovim.
    {
      plugin = nvim-lspconfig;
      type = "lua";
      config = ''
        -- common lsp setup
        local lsp_config = require'lspconfig'
        local lsp_setup = require'generic_lsp'
      '';
    }

    # Configures Neovim presence, providing information about the user's editing status.
    {
      plugin = presence-nvim;
      config = ''
        let g:presence_auto_update       = 1
        let g:presence_editing_text      = "Editing %s"
        let g:presence_workspace_text    = "Working on %s"
        let g:presence_neovim_image_text = "vim but better"
        let g:presence_main_image        = "neovim"
      '';
    }

    # Snippet engine for Neovim.
    luasnip

    # Configures nvim-cmp for autocompletion.
    {
      plugin = nvim-cmp;
      type = "lua";
      config = ''
        -- Setup nvim-cmp.
        local cmp = require'cmp'
        cmp.setup({
          snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
              require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            end,
          },
          window = {
            -- completion = cmp.config.window.bordered(),
            -- documentation = cmp.config.window.bordered(),
          },
          mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          }),
          sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'treesitter' },
            { name = 'spell' },
            { name = 'path' },
            { name = 'buffer' },
          })
        })
        -- Autocomplete commits, Issue/PR numbers, mentions
        cmp.setup.filetype('gitcommit', {
          sources = cmp.config.sources({
            { name = 'git' },
            { name = 'spell' },
            { name = 'buffer' },
          })
        })
        -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline('/', {
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = 'buffer' },
          }
        })
        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = 'path' },
            { name = 'cmdline' },
          })
        })
      '';
    }

    # Integrates nvim-cmp with luasnip for snippet support.
    cmp_luasnip

    # Integrates nvim-cmp with Treesitter for enhanced autocompletion.
    cmp-treesitter

    # Integrates nvim-cmp with Neovim LSP for language server autocompletion.
    cmp-nvim-lsp

    # Integrates nvim-cmp with spell checking for autocompletion.
    cmp-spell

    # Integrates nvim-cmp with file path autocompletion.
    cmp-path

    # Integrates nvim-cmp with git-related autocompletion.
    cmp-git

    # Configures NERDCommenter for easy code commenting.
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
