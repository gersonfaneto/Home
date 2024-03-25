local M = {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = { "Neotree" },
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
    popup_border_style = "rounded",
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
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
    },
    event_handlers = {},
  })

  M.handlers.fix_colors()
end

function M.init()
  M.handlers.register_mappings()
end

M.handlers = {
  register_mappings = function()
    utils.base.mappings.bulk_register({
      {
        mode = { "n" },
        lhs = "<leader>nf",
        rhs = ":Neotree reveal float filesystem<CR>",
        description = "Files",
      },
      {
        mode = { "n" },
        lhs = "<leader>nb",
        rhs = ":Neotree reveal float buffers<CR>",
        description = "Buffers",
      },
      {
        mode = { "n" },
        lhs = "<leader>ng",
        rhs = ":Neotree reveal float git_status<CR>",
        description = "Git",
      },
    }, { prefix = "NeoTree :: ", options = { silent = true, noremap = true } })
  end,
  fix_colors = function()
    local colors = utils.interface.colors.get_colors()

    vim.cmd("highlight NeoTreeNormal guibg=" .. colors.bg .. " guifg=none")
    vim.cmd("highlight NeoTreeFloatNormal guifg=none guibg=none")
    vim.cmd("highlight NeoTreeFloatBorder gui=none guifg=" .. colors.fg .. " guibg=none")
    vim.cmd("highlight NeoTreeEndOfBuffer guibg=" .. colors.bg)
  end,
}

return M
