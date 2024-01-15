local M = {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter" },
  dependencies = {
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "onsails/lspkind.nvim",
    {
      "L3MON4D3/LuaSnip",
      dependencies = {
        "saadparwaiz1/cmp_luasnip",
      },
    },
  },
}

function M.config()
  local cmp = require("cmp")
  local cmp_types = require("cmp.types.cmp")
  local cmp_mapping = cmp.mapping

  local lspkind = require("lspkind")
  local luasnip = require("luasnip")

  local icons = {
    ui = utils.interface.icons.get("ui"),
    git = utils.interface.icons.get("git"),
    misc = utils.interface.icons.get("misc"),
  }

  require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/extras/snippets" } })
  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    experimental = {
      ghost_text = {
        hl_group = "LspCodeLens",
      },
    },
    window = {
      completion = cmp.config.window.bordered({
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
      }),
      documentation = cmp.config.window.bordered({
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
      }),
    },
    sources = {
      { name = "luasnip" },
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "path" },
      { name = "emoji" },
      { name = "buffer" },
      { name = "crates" },
    },
    mapping = cmp_mapping.preset.insert({
      ["<C-e>"] = cmp_mapping.abort(),
      ["<C-c>"] = cmp_mapping.complete(),
      ["<C-b>"] = cmp_mapping.scroll_docs(-4),
      ["<C-f>"] = cmp_mapping.scroll_docs(4),
      ["<Up>"] = cmp_mapping(cmp_mapping.select_prev_item({ behavior = cmp_types.SelectBehavior.Select }), {
        "i",
      }),
      ["<Down>"] = cmp_mapping(cmp_mapping.select_next_item({ behavior = cmp_types.SelectBehavior.Select }), {
        "i",
      }),
      ["<Tab>"] = cmp_mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_locally_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp_mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<CR>"] = cmp_mapping(function(fallback)
        if cmp.visible() then
          local confirm_opts = vim.deepcopy({
            behavior = cmp_types.ConfirmBehavior.Replace,
            select = false,
          })

          local is_insert_mode = function()
            return vim.api.nvim_get_mode().mode:sub(1, 1) == "i"
          end

          if is_insert_mode() then
            confirm_opts.behavior = cmp_types.ConfirmBehavior.Insert
          end

          if cmp.confirm(confirm_opts) then
            return
          end
        end
        fallback()
      end),
    }),
    ---@diagnostic disable-next-line: missing-fields
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        local max_width = 0

        if max_width ~= 0 and #vim_item.abbr > max_width then
          vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. icons.ui.Ellipsis
        end

        if entry.source.name == "crates" then
          vim_item.kind = icons.misc.Package
          vim_item.kind_hl_group = "CmpItemKindCrate"
        elseif entry.source.name == "emoji" then
          vim_item.kind = icons.misc.Smiley
          vim_item.kind_hl_group = "CmpItemKindEmoji"
        else
          vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind
        end

        vim_item.menu = ({
          nvim_lsp = "[LSP]",
          crates = "[Crates]",
          luasnip = "[Snippet]",
          path = "[Path]",
          emoji = "[Emoji]",
          buffer = "[Buffer]",
        })[entry.source.name]

        ---@diagnostic disable-next-line: assign-type-mismatch
        vim_item.dup = ({
          buffer = 1,
          path = 1,
          nvim_lsp = 0,
          luasnip = 1,
        })[entry.source.name] or 0

        return vim_item
      end,
    },
  })
end

return M
