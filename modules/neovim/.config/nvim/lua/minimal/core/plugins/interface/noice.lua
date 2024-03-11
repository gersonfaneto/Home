local M = {
  "folke/noice.nvim",
  event = {
    "UIEnter",
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
}

function M.config()
  local noice = require("noice")

  noice.setup({
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      progress = {
        enabled = false,
      },
      signature = {
        auto_open = {
          enabled = false,
        },
      },
    },
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
    presets = {
      command_palette = true,
      long_message_to_split = true,
    },
    views = {
      hover = {
        border = { style = "rounded" },
        size = { max_width = 80 },
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
            { event = "notify", find = "No information available" },
          },
        },
      },
    },
  })
end

utils.base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>ne",
    rhs = ":Noice enable<CR>",
    description = "Enable.",
  },
  {
    mode = { "n" },
    lhs = "<leader>nd",
    rhs = ":Noice disable<CR>",
    description = "Disable.",
  },
  {
    mode = { "n" },
    lhs = "<leader>nh",
    rhs = ":Noice telescope<CR>",
    description = "Open notification history.",
  },
  {
    mode = { "n" },
    lhs = "<leader>nc",
    rhs = ":Noice dismiss<CR>",
    description = "Clear all notifications.",
  },
  {
    mode = { "n" },
    lhs = "<leader>np",
    rhs = ":Noice last<CR>",
    description = "View last notification.",
  },
}, { options = { silent = true, noremap = true }, prefix = "Noice :: " })

return M
