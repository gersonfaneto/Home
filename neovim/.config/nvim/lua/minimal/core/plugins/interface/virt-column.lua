local M = {
  "lukas-reineke/virt-column.nvim",
  event = { "BufReadPost", "BufNewFile" },
}

local is_enabled = utils.types.settings.show_color_column

function M.config()
  require("virt-column").setup({
    enabled = is_enabled,
    char = { "┆" },
    virtcolumn = table.concat(utils.types.settings.color_column, ","),
    highlight = { "ColorColumn" },
    exclude = {
      filetypes = {},
      buftype = {},
    },
  })

  utils.base.mappings.bulk_register({
    {
      mode = { "n" },
      lhs = "<leader>eor",
      rhs = function ()
        is_enabled = not is_enabled
        require("virt-column").update({ enabled = is_enabled })
        vim.cmd("e!")
      end,
      description = "Toggle color column.",
    },
  }, { options = { silent = true }, description = "Editor Options :: " })
end

return M
