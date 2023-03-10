local hadSuccessI, CompletionConfig = pcall(require, "cmp")
local hadSuccessII, LuaSnipConfig = pcall(require, "luasnip")
local hadSuccessIII, LSPKindIcons = pcall(require, "lspkind")
local hadSuccessIV, CompletionSorting = pcall(require, "cmp-under-comparator")
local allSet = hadSuccessI and hadSuccessII and hadSuccessIII and hadSuccessIV

if not allSet then
  return
end

local CompMapping = CompletionConfig.mapping
local CompConfig = CompletionConfig.config

CompletionConfig.setup({
  experimental = {
    ghost_text = true,
  },
  snippet = {
    expand = function(args)
      LuaSnipConfig.lsp_expand(args.body)
    end,
  },
  window = {
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
    completion = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
  },
  mapping = CompMapping.preset.insert({
    ["<C-d>"] = CompMapping.scroll_docs(-4),
    ["<C-f>"] = CompMapping.scroll_docs(4),
    ["<C-Space>"] = CompMapping.complete(),
    ["<C-e>"] = CompMapping.close(),
    ["<CR>"] = CompMapping.confirm({
      behavior = CompletionConfig.ConfirmBehavior.Replace,
      select = false,
    }),
    ["<Tab>"] = CompMapping(function(fallback)
      if CompletionConfig.visible() then
        CompletionConfig.select_next_item()
      elseif LuaSnipConfig.expand_or_jumpable() then
        LuaSnipConfig.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = CompMapping(function(fallback)
      if CompletionConfig.visible() then
        CompletionConfig.select_prev_item()
      elseif LuaSnipConfig.jumpable(-1) then
        LuaSnipConfig.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = CompConfig.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    {
      name = "spell",
      option = {
        keep_all_entries = false,
        enable_in_context = function()
          return require("cmp.config.context").in_treesitter_capture("spell")
        end,
      },
    },
    { name = "path" },
    { name = "emoji" },
  }),
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(currEntry, entryDesc)
      local kindIcon = LSPKindIcons.cmp_format({ mode = "symbol_text", maxwidth = 50 })(currEntry, entryDesc)
      local compDesc = vim.split(kindIcon.kind, "%s", { trimempty = true })
      kindIcon.kind = " " .. (compDesc[1] or "") .. " "
      kindIcon.menu = "    (" .. (compDesc[2] or "") .. ")"
      return kindIcon
    end,
  },
  sorting = {
    comparators = {
      CompletionConfig.config.compare.offset,
      CompletionConfig.config.compare.exact,
      CompletionConfig.config.compare.score,
      CompletionSorting.under,
      CompletionConfig.config.compare.kind,
      CompletionConfig.config.compare.sort_text,
      CompletionConfig.config.compare.length,
      CompletionConfig.config.compare.order,
    },
  },
})
