local M = {
  "akinsho/toggleterm.nvim",
  keys = { "<leader>tt" },
  version = "*",
}

function M.config()
  local toggleterm = require("toggleterm")

  toggleterm.setup({
    size = 20,
    open_mapping = [[<leader>tf]],
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    persist_size = false,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = "curved",
      winblend = 0,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
  })

  utils.base.mappings.bulk_register({
    {
      mode = { "n" },
      lhs = "<leader>tf",
      rhs = ":ToggleTerm direction=float<CR>",
      description = "Float.",
    },
    {
      mode = { "n" },
      lhs = "<leader>tt",
      rhs = ":ToggleTerm direction=tab<CR>",
      description = "Tab.",
    },
    {
      mode = { "n" },
      lhs = "<leader>tv",
      rhs = ":ToggleTerm direction=vertical<CR>",
      description = "Vertical.",
    },
    {
      mode = { "n" },
      lhs = "<leader>th",
      rhs = ":ToggleTerm direction=horizontal<CR>",
      description = "Horizontal.",
    },
  }, { options = { silent = true, noremap = true }, prefix = "ToggleTerm :: " })
end

return M
