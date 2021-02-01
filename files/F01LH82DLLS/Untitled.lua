  local actions = require('telescope.actions')
  -- Global remapping
  ------------------------------
  require('telescope').setup{
    defaults = {
      mappings = {
        i = {
          -- To disable a keymap, put [map] = false
          -- So, to not map "<C-n>", just put
          ["<c-x>"] = false,
          -- Otherwise, just set the mapping to the function that you want it to be.
          ["<C-i>"] = actions.goto_file_selection_split,
          -- Add up multiple actions
          ["<CR>"] = actions.goto_file_selection_edit + actions.center,
          -- You can perform as many actions in a row as you like
          ["<CR>"] = actions.goto_file_selection_edit + actions.center + my_cool_custom_action,
        },
        n = {
          ["<esc>"] = actions.close
          ["<C-i>"] = my_cool_custom_action,
        }
      }
    }
  }
