local M = {
  "echasnovski/mini.nvim",
}

function M.config()
  require("mini.ai").setup()

  require("mini.align").setup()

  require("mini.surround").setup()

  local colors = utils.interface.colors.get_colors()

  require("mini.indentscope").setup({
    symbol = "│",
    options = { try_as_border = true },
  })

  vim.api.nvim_create_autocmd("FileType", {
    pattern = {
      "help",
      "lazy",
      "mason",
      "notify",
      "oil",
      "Oil",
    },
    callback = function()
      vim.b.miniindentscope_disable = true
    end,
  })

  vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = colors.fg })
end

return M
