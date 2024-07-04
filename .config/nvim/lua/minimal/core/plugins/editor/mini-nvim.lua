local M = {
  "echasnovski/mini.nvim",
}

function M.config()
  if utils.types.settings.auto_pairs then
    require('mini.pairs').setup()
  end

  require("mini.ai").setup({
    mappings = {
      -- around_next = 'an',
      -- inside_next = 'in',
      -- around_last = 'al',
      -- inside_last = 'il',
      around_next = '',
      inside_next = '',
      around_last = '',
      inside_last = '',
    },
  })

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
