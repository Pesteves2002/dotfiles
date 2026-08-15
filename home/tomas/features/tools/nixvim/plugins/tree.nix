{
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;

      settings = {
        close_if_last_window = true;

        window = {
          width = 30;
          position = "left";
        };

        source_selector = {
          winbar = true;
          statusline = false;
          sources = [
            {
              source = "filesystem";
              display_name = " 󰉓 Files";
            }
            {
              source = "buffers";
              display_name = " 󰈚 Buffers";
            }
            {
              source = "git_status";
              display_name = " 󰊢 Git";
            }
          ];
        };

        filesystem = {
          bind_to_cwd = true;
          follow_current_file = {
            enabled = true;
          };

          filtered_items = {
            visible = false;
            hide_dotfiles = false;
            hide_gitignored = true;
            hide_by_name = [
              ".git"
              "node_modules"
            ];
          };

          window = {
            fuzzy_finder_mappings = {
              "<C-j>" = "move_cursor_down";
              "<C-k>" = "move_cursor_up";
            };
          };
        };

        buffers = {
          follow_current_file = {
            enabled = true;
          };
          group_empty_dirs = true;
          show_unloaded = true;
        };

        enable_git_status = true;
        enable_diagnostics = true;
      };
    };

    extraConfigLua = ''
      require("neo-tree").setup({
        event_handlers = {
          {
            event = "file_open_requested",
            handler = function()
              -- auto close
              -- vim.cmd("Neotree toggle close")
              -- OR
              require("neo-tree.command").execute({ action = "close" })
            end
          },
        },

        window = {
          mappings = {
            ["h"] = function(state)
              local node = state.tree:get_node()
                if node.type == 'directory' and node:is_expanded() then
                  require'neo-tree.sources.filesystem'.toggle_directory(state, node)
                else
                  require'neo-tree.ui.renderer'.focus_node(state, node:get_parent_id())
                end
              end,

            ["l"] = function(state)
              local node = state.tree:get_node()
                if node.type == 'directory' then
                  if not node:is_expanded() then
                    require'neo-tree.sources.filesystem'.toggle_directory(state, node)
                  elseif node:has_children() then
                    require'neo-tree.ui.renderer'.focus_node(state, node:get_child_ids()[1])
                  end
                end
              end,
          },
        },
      })
    '';

    keymaps = [
      {
        # Toggle NvimTree
        mode = "n";
        key = "<C-n>";
        action = "<CMD>Neotree reveal toggle<CR>";
      }

      {
        # Toggle NvimTree
        mode = "n";
        key = "<leader>pv";
        action = "<CMD>Neotree reveal toggle<CR>";
      }

      {
        # Toggle open-buffers panel
        mode = "n";
        key = "<leader>be";
        action = "<CMD>Neotree toggle buffers<CR>";
      }

      {
        # Toggle git status panel (note: <leader>gs is taken by fugitive's :Git)
        mode = "n";
        key = "<leader>gt";
        action = "<CMD>Neotree toggle git_status<CR>";
      }
    ];

    globals = {
      loaded_netrwPlugin = 1;
      loaded_netrw = 1;
    };
  };
}
