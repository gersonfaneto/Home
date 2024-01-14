local M = {
  "nvimdev/lspsaga.nvim",
  event = { "LspAttach" },
}

function M.config()
  local lspsaga = require("lspsaga")

  lspsaga.setup({
    move_in_saga = { prev = "k", next = "j" },
    diagnostic_header = { " ", " ", " ", " " },
    scroll_preview = {
      scroll_down = "<C-f>",
      scroll_up = "<C-b>",
    },
    definition = {
      keys = {
        edit = "<CR>",
        split = "s",
        vsplit = "v",
        close = "<C-c>",
      },
    },
    finder = {
      default = "ref+imp",
      silent = true,
      keys = {
        toggle_or_open = "<CR>",
      },
    },
    lightbulb = {
      sign = false,
      enable_in_insert = false,
      virtual_text = false,
    },
    symbol_in_winbar = {
      enable = true,
      separator = "  ",
      show_file = true,
    },
    ui = {
      code_action = "ﯦ",
      diagnostic = "",
      preview = "",
    },
  })
end

utils.base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>tt",
    rhs = ":Lspsaga term_toggle<CR>",
    description = "Toggle terminal.",
  },
  {
    mode = { "n" },
    lhs = "<leader>so",
    rhs = ":Lspsaga outline<CR>",
    description = "Toggle outline.",
  },
}, { prefix = "Saga: ", options = { silent = true, noremap = true } })

return M
