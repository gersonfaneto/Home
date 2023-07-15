return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  lazy = true,
  opts = {
    plugins = {
      marks = false,
      registers = false,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = false,
        g = false,
      },
    },
    operators = { gc = "Comments" },
    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "+",
    },
    popup_mappings = {
      scroll_down = "<c-d>",
      scroll_up = "<c-u>",
    },
    window = {
      border = "single",
      position = "bottom",
      margin = { 2, 0, 2, 0 },
      padding = { 2, 2, 2, 2 },
      winblend = 0,
      zindex = 1000,
    },
    layout = {
      height = { min = 4, max = 25 },
      width = { min = 20, max = 50 },
      spacing = 3,
      align = "left",
    },
    ignore_missing = false,
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
    show_help = true,
    show_keys = true,
    triggers = "auto",
    triggers_blacklist = {
      i = { "j", "k" },
      v = { "j", "k" },
    },

    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  },
  config = function(_, opts)
    local which_key = require("which-key")

    which_key.setup(opts)

    which_key.register(require('core.which-key.defaults'), {
      mode = "n",
      prefix = "<leader>",
    })

    which_key.register(require('core.which-key.non-leader'))
  end
}
