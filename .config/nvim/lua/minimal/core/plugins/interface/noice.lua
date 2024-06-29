local M = {
  "folke/noice.nvim",
  event = {
    "UIEnter",
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
}

function M.init()
  utils.base.mappings.bulk_register({
    {
      mode = { "n" },
      lhs = "<leader>ne",
      rhs = ":NoiceEnable<CR>",
      description = "Enable.",
    },
    {
      mode = { "n" },
      lhs = "<leader>nd",
      rhs = ":NoiceDisable<CR>",
      description = "Disable.",
    },
    {
      mode = { "n" },
      lhs = "<leader>nh",
      rhs = ":NoiceHistory<CR>",
      description = "Open notification history.",
    },
    {
      mode = { "n" },
      lhs = "<leader>nc",
      rhs = ":NoiceDismiss<CR>",
      description = "Clear all notifications.",
    },
    {
      mode = { "n" },
      lhs = "<leader>nl",
      rhs = ":NoiceLast<CR>",
      description = "View last notification.",
    },
  }, { options = { silent = true, noremap = true }, prefix = "Noice :: " })
end

function M.config()
  local noice = require("noice")

  noice.setup({
    cmdline = {
      view = "cmdline_popup",
      format = {
        cmdline = {
          pattern = "^:",
          icon = "> ",
          lang = "vim",
          title = " Command ",
        },
        substitute = {
          pattern = "^:%%?s/",
          icon = " ",
          ft = "regex",
          title = " Rename ",
        },
        search_and_replace = {
          kind = "replace",
          pattern = "^:%%?s/",
          icon = " ",
          lang = "regex",
        },
        search_and_replace_range = {
          kind = "replace",
          pattern = "^:'<,'>%%?s/",
          icon = " ",
          lang = "regex",
        },
      },
    },
    commands = {
      last = {
        view = "split",
      },
      errors = {
        view = "split",
      },
    },
    lsp = {
      hover = {
        enabled = false,
      },
      progress = {
        enabled = false,
      },
      signature = {
        enabled = false,
      },
    },
    presets = {
      command_palette = true,
      long_message_to_split = true,
    },
    views = {
      hover = {
        enabled = false,
      },
      cmdline_popup = {
        border = {
          style = "rounded",
          padding = { 1, 2 },
        },
        filter_options = {},
        win_options = {
          winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        },
      },
    },
    routes = {
      {
        opts = { skip = true },
        filter = {
          any = {
            { event = "msg_show", find = "written" },
            { event = "msg_show", find = "%d+ lines, %d+ bytes" },
            { event = "msg_show", kind = "search_count" },
            { event = "msg_show", find = "%d+L, %d+B" },
            { event = "msg_show", find = "^Hunk %d+ of %d" },
            { event = "msg_show", find = "%d+ change" },
            { event = "msg_show", find = "%d+ line" },
            { event = "msg_show", find = "%d+ more line" },
            { event = "notify",   find = "No information available" },
          },
        },
      },
    },
  })
end

return M
