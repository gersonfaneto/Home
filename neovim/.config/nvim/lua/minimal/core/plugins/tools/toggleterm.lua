local M = {
  "akinsho/toggleterm.nvim",
  cmd = { "ToggleTerm" },
  version = "*",
}

function M.config()
  local toggleterm = require("toggleterm")

  toggleterm.setup({
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
      return 20
    end,
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
end

function M.init()
  utils.base.mappings.bulk_register({
    {
      mode = { "n" },
      lhs = "<leader>tt",
      rhs = ":ToggleTerm direction=float<CR>",
      description = "Float.",
    },
    {
      mode = { "n" },
      lhs = "<leader>tw",
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

  vim.api.nvim_create_autocmd({ "TermOpen" }, {
    pattern = "term://*",
    callback = function()
      utils.base.mappings.bulk_register({
        {
          mode = { "t" },
          lhs = "<ESC>",
          rhs = [[<C-\><C-n>]],
          description = "Exit.",
        },
        {
          mode = { "t" },
          lhs = "<C-h>",
          rhs = [[<Cmd>wincmd h<CR>]],
          description = "Left.",
        },
        {
          mode = { "t" },
          lhs = "<C-j>",
          rhs = [[<Cmd>wincmd j<CR>]],
          description = "Down.",
        },
        {
          mode = { "t" },
          lhs = "<C-k>",
          rhs = [[<Cmd>wincmd k<CR>]],
          description = "Up.",
        },
        {
          mode = { "t" },
          lhs = "<C-l>",
          rhs = [[<Cmd>wincmd l<CR>]],
          description = "Right.",
        },
      }, { options = { buffer = 0, silent = true, noremap = true }, prefix = "ToggleTerm :: " })
    end,
  })
end

return M
