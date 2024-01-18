local M = {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    "<C-e><C-r>",
    "<C-e><C-l>",
    "<C-e><C-f>",
    "<C-e><C-e>",
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
}

function M.config()
  local neo_tree = require("neo-tree")

  neo_tree.setup({
    close_if_last_window = true,
    popup_border_style = "single",
    enable_git_status = true,
    enable_modified_markers = true,
    enable_diagnostics = true,
    sort_case_insensitive = true,
    default_component_configs = {
      indent = {
        with_markers = true,
        with_expanders = true,
      },
      modified = {
        symbol = " ",
        highlight = "NeoTreeModified",
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "",
        folder_empty_open = "",
      },
      git_status = {
        symbols = {
          -- Change type
          added = "",
          deleted = "",
          modified = "",
          renamed = "",
          -- Status type
          untracked = "",
          ignored = "",
          unstaged = "",
          staged = "",
          conflict = "",
        },
      },
    },
    window = {
      position = "float",
      width = 35,
    },
    filesystem = {
      use_libuv_file_watcher = true,
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          "node_modules",
        },
        never_show = {
          ".DS_Store",
          "thumbs.db",
        },
      },
    },
    event_handlers = {
      {
        event = "neo_tree_window_after_open",
        handler = function(args)
          if args.position == "left" or args.position == "right" then
            vim.cmd("wincmd =")
          end
        end,
      },
      {
        event = "neo_tree_window_after_close",
        handler = function(args)
          if args.position == "left" or args.position == "right" then
            vim.cmd("wincmd =")
          end
        end,
      },
    },
  })

  M.handlers.register_mappings()
end

M.handlers = {
  register_mappings = function()
    utils.base.mappings.bulk_register({
      {
        mode = { "n" },
        lhs = "<C-e><C-r>",
        rhs = ":Neotree toggle right<CR>",
        description = "Toggle the right window.",
      },
      {
        mode = { "n" },
        lhs = "<C-e><C-l>",
        rhs = ":Neotree toggle left<CR>",
        description = "Toggle the left window.",
      },
      {
        mode = { "n" },
        lhs = "<C-e><C-f>",
        rhs = ":Neotree toggle float<CR>",
        description = "Toggle the floating window.",
      },
      {
        mode = { "n" },
        lhs = "<C-e><C-e>",
        rhs = ":Neotree focus<CR>",
        description = "Focus the open window.",
      },
    }, { prefix = "NeoTree :: ", options = { silent = true, noremap = true } })
  end,
}

return M
