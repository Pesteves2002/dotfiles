{
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;

      settings = {
        close_if_last_window = true;
        filesystem = {
          bind_to_cwd = true;
          follow_current_file = {
            enabled = true;
          };
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
    ];

    globals = {
      loaded_netrwPlugin = 1;
      loaded_netrw = 1;
    };
  };
}
