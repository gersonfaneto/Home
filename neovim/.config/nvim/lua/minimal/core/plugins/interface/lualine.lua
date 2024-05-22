local M = {
  "nvim-lualine/lualine.nvim",
  event = { "UIEnter" },
}

function M.config()
  local colors = utils.interface.colors.get_colors()
  local icons = utils.interface.icons.get("diagnostics")

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
        statusline = {
          "starter",
        },
        winbar = {},
      },
    },
    sections = {
      lualine_a = {
        "branch",
      },
      lualine_b = {
        {
          "tabs",
          tabs_color = {
            active = { bg = colors.bg, fg = colors.accent },
            inactive = { bg = colors.bg, fg = colors.fg },
          },
          show_modified_status = false,
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
      lualine_c = {
        {
          "macros",
          fmt = function()
            local register = vim.fn.reg_recording()
            if register == "" then
              return ""
            else
              return "recording @" .. register
            end
          end,
          color = { bg = colors.bg, fg = colors.accent },
        },
      },
      lualine_x = {
        "selectioncount",
      },
      lualine_y = {
        {
          "progress",
          fmt = function()
            local total_lines = vim.fn.line("$")
            if total_lines <= 1 then
              return ""
            end
            local current_line = vim.fn.line(".")
            local line_ratio = math.ceil(((current_line / total_lines) * 100) % 101)
            return line_ratio .. "%%"
          end,
        },
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
end

return M
