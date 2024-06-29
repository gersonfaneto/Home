local M = {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = { "Neotree" },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
}

function M.init()
  utils.base.mappings.bulk_register({
    {
      mode = { "n" },
      lhs = "<leader>ns",
      rhs = ":Neotree toggle left<CR>",
      description = "Open (Toggle) to the side.",
    },
    {
      mode = { "n" },
      lhs = "<leader>nf",
      rhs = ":Neotree toggle float<CR>",
      description = "Open (Toggle) as a float.",
    },
  }, { prefix = "NeoTree :: ", options = { silent = true, noremap = true } })
end

function M.config()
  local icons = {}

  icons.ui = utils.interface.icons.get("ui")
  icons.git = utils.interface.icons.get("git")

  local neo_tree = require("neo-tree")

  neo_tree.setup({
    close_if_last_window = true,
    popup_border_style = "rounded",
    sort_case_insensitive = true,
    enable_git_status = true,
    enable_diagnostics = true,
    enable_modified_markers = true,
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
        folder_closed = icons.ui.Folder,
        folder_open = icons.ui.FolderOpen,
        folder_empty = icons.ui.EmptyFolder,
        folder_empty_open = icons.ui.EmptyFolderOpen,
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
      file_size = {
        enabled = false,
        required_width = 64,
      },
      type = {
        enabled = false,
        required_width = 122,
      },
      last_modified = {
        enabled = false,
        required_width = 88,
      },
      created = {
        enabled = false,
        required_width = 110,
      },
      symlink_target = {
        enabled = false,
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
    source_selector = {
      winbar = true,
      sources = {
        { source = "filesystem", display_name = "   Files " },
        { source = "buffers", display_name = "   Buffers " },
        { source = "git_status", display_name = "   Git " },
      },
    },
    event_handlers = {},
  })

  local colors = utils.interface.colors.get_colors()

  vim.cmd("highlight NeoTreeNormal guibg=" .. colors.bg .. " guifg=none")
  vim.cmd("highlight NeoTreeFloatNormal guifg=none guibg=none")
  vim.cmd("highlight NeoTreeFloatBorder gui=none guifg=" .. colors.fg .. " guibg=none")
  vim.cmd("highlight NeoTreeEndOfBuffer guibg=" .. colors.bg)
  vim.cmd("highlight NeoTreeTabInactive guibg=" .. colors.bg)
  vim.cmd("highlight NeoTreeTabActive guibg=" .. colors.bg)
  vim.cmd("highlight NeoTreeTabInactive guibg=" .. colors.bg)
  vim.cmd("highlight NeoTreeTabSeparatorInactive guibg=" .. colors.bg)
  vim.cmd("highlight NeoTreeTabSeparatorActive guibg=" .. colors.bg)
end

return M
