local M = {
  "L3MON4D3/LuaSnip",
  event = { "InsertEnter" },
  dependencies = {
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },
}

function M.config()
  local snippets = require("luasnip")

  local loaders = require("luasnip.loaders.from_vscode")

  loaders.lazy_load()


  vim.snippet.expand = snippets.lsp_expand

  ---@diagnostic disable-next-line: duplicate-set-field
  vim.snippet.active = function(filter)
    filter = filter or {}
    filter.direction = filter.direction or 1

    if filter.direction == 1 then
      return snippets.expand_or_jumpable()
    else
      return snippets.jumpable(filter.direction)
    end
  end

  ---@diagnostic disable-next-line: duplicate-set-field
  vim.snippet.jump = function(direction)
    if direction == 1 then
      if snippets.expandable() then
        return snippets.expand_or_jump()
      else
        return snippets.jumpable(1) and snippets.jump(1)
      end
    else
      return snippets.jumpable(-1) and snippets.jump(-1)
    end
  end

  vim.snippet.stop = snippets.unlink_current

  snippets.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
    override_builtin = true,
  })

  -- FIX: Can't tell why this won't work...
  -- utils.base.mappings.bulk_register({
  --   {
  --     mode = { "i", "s" },
  --     lhs = "<C-k>",
  --     rhs = function()
  --       return vim.snippet.active({ direction = 1 }) and vim.snippet.jump()
  --     end,
  --     description = "Select next entry.",
  --   },
  --   {
  --     mode = { "i", "s" },
  --     lhs = "<C-j>",
  --     rhs = function()
  --       return vim.snippet.active({ direction = -1 }) and vim.snippet.jump(-1)
  --     end,
  --     description = "Select previous item.",
  --   },
  -- }, { options = { silent = true }, prefix = "Snippets :: " })

  vim.keymap.set({ "i", "s" }, "<c-k>", function()
    return vim.snippet.active({ direction = 1 }) and vim.snippet.jump(1)
  end, { silent = true })

  vim.keymap.set({ "i", "s" }, "<c-j>", function()
    return vim.snippet.active({ direction = -1 }) and vim.snippet.jump(-1)
  end, { silent = true })
end

return M
