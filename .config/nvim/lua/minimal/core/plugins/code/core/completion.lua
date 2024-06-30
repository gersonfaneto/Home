local M = {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter" },
  dependencies = {
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "L3MON4D3/LuaSnip",
  },
}

function M.config()
  local completion = require("cmp")

  local icons = {
    ui = utils.interface.icons.get("ui"),
    git = utils.interface.icons.get("git"),
    misc = utils.interface.icons.get("misc"),
    kind = utils.interface.icons.get("kind"),
  }

  completion.setup({
    snippet = {
      expand = function(args)
        vim.snippet.expand(args.body)
      end,
    },
    experimental = {
      ghost_text = {
        hl_group = "LspCodeLens",
      },
    },
    window = {
      completion = completion.config.window.bordered({
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
      }),
      documentation = completion.config.window.bordered({
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
      }),
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
      { name = "emoji" },
    },
    mapping = completion.mapping.preset.insert({
      ["<C-e>"] = completion.mapping.abort(),
      ["<C-c>"] = completion.mapping.complete(),
      ["<C-u>"] = completion.mapping.scroll_docs(-4),
      ["<C-d>"] = completion.mapping.scroll_docs(4),
      ["<C-p>"] = completion.mapping(
        completion.mapping.select_prev_item({
          behavior = completion.SelectBehavior.Select,
        }),
        {
          "i",
        }
      ),
      ["<C-n>"] = completion.mapping(
        completion.mapping.select_next_item({
          behavior = completion.SelectBehavior.Select,
        }),
        {
          "i",
        }
      ),
      ["<C-a>"] = completion.mapping(
        completion.mapping.confirm({
          behavior = completion.ConfirmBehavior.Insert,
          select = true,
        }),
        { "i", "c" }
      ),
    }),
    ---@diagnostic disable-next-line: missing-fields
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        local max_width = 0

        if max_width ~= 0 and #vim_item.abbr > max_width then
          vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. icons.ui.Ellipsis
        end

        if entry.source.name == "emoji" then
          vim_item.kind = icons.misc.Smiley
          vim_item.kind_hl_group = "CmpItemKindEmoji"
        else
          vim_item.kind = string.format("%s %s", icons.kind[vim_item.kind], vim_item.kind)
        end

        vim_item.menu = ({
          nvim_lsp = "[LSP]",
          luasnip = "[Snippet]",
          path = "[Path]",
          emoji = "[Emoji]",
          buffer = "[Buffer]",
        })[entry.source.name]

        return vim_item
      end,
    },
  })

  utils.plugins.completion.mappings.register(completion)
end

return M
