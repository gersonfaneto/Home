return {
  "nvim-lualine/lualine.nvim",
  event = { "UIEnter" },
  config = function()
    local interface = require("minimal.utils.interface")

    local colors = interface.colors.get()
    local icons = interface.icons.get("diagnostics")

    local lualine = require("lualine")

    lualine.setup({
      options = {
        refresh = {
          statusline = 100,
        },
        theme = {
          normal = {
            a = { fg = colors.fg, bg = colors.bg },
            b = { fg = colors.fg, bg = colors.bg },
            c = { fg = colors.fg, bg = colors.bg },
          },
          insert = { a = { fg = colors.fg, bg = colors.bg }, b = { fg = colors.fg, bg = colors.bg } },
          visual = { a = { fg = colors.fg, bg = colors.bg }, b = { fg = colors.fg, bg = colors.bg } },
          command = { a = { fg = colors.fg, bg = colors.bg }, b = { fg = colors.fg, bg = colors.bg } },
          replace = { a = { fg = colors.fg, bg = colors.bg }, b = { fg = colors.fg, bg = colors.bg } },

          inactive = {
            a = { bg = colors.bg, fg = colors.fg },
            b = { bg = colors.bg, fg = colors.fg },
            c = { bg = colors.bg, fg = colors.fg },
          },
        },
        icons_enabled = true,
        section_separators = "",
        component_separators = "",
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
      },
      sections = {
        lualine_a = { "branch" },
        lualine_b = {
          {
            "filetype",
            icon_only = true,
            separator = "",
            padding = {
              left = 1,
              right = 0,
            },
          },
          {
            "filename",
            path = 1,
            symbols = {
              modified = "  ",
              readonly = "",
              unnamed = "",
            },
          },
          {
            "diagnostics",
            sources = { "nvim_lsp" },
            symbols = {
              info = icons.BoldInformation .. " ",
              hint = icons.BoldHint .. " ",
              warn = icons.BoldWarning .. " ",
              error = icons.BoldError .. " ",
            },
          },
        },
        lualine_c = {},
        lualine_x = {
          "selectioncount",
        },
        lualine_y = {
          "progress",
          "location",
        },
        lualine_z = {
          function()
            return " " .. os.date("%R")
          end,
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {
        "lazy",
        "neo-tree",
      },
    })
  end,
}
