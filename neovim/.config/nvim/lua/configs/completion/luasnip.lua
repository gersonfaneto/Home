local api = require("utils.api")
local settings = require("core.settings")

local m = {
  requires = {
    "luasnip",
    "luasnip.loaders",
    "luasnip.loaders.from_vscode",
  },
}

function m.before()
  m.register_key()
end

function m.load()
  m.luasnip.setup({
    history = true,
    region_check_events = "insertenter",
    delete_check_events = "textchanged,insertleave",
    update_events = "textchanged,textchangedi,insertleave",
    enable_autosnippets = true,
    store_selection_keys = "<Tab>",
  })

  m.luasnip_loaders_from_vscode.lazy_load({
    paths = {
      api.paths.join(settings.global_config_directory, "snippets"),
      api.paths.join(settings.storage_directory, "friendly-snippets"),
    },
  })
end

function m.after()
  m.luasnip.filetype_extend("javascript", { "typescript" })
  m.luasnip.filetype_extend("typescript", { "javascript" })
  m.luasnip.filetype_extend("vue", { "javascript", "typescript" })
end

function m.register_key()
  api.maps.bulk_register({
    {
      mode = { "i", "s" },
      lhs = "<Tab>",
      rhs = function()
        return vim.api.nvim_eval("luasnip#jumpable(1) ? '<plug>luasnip-jump-next' : '<Tab>'")
      end,
      options = { silent = true, expr = true },
      description = "Jump to the next fragment placeholder.",
    },
    {
      mode = { "i", "s" },
      lhs = "<S-Tab>",
      rhs = function()
        return vim.api.nvim_eval("luasnip#jumpable(-1) ? '<plug>luasnip-jump-prev' : '<S-Tab>'")
      end,
      options = { silent = true, expr = true },
      description = "Jump to the previous fragment placeholder.",
    },
  })
end

return m
