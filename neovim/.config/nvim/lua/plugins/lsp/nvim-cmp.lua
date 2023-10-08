return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "onsails/lspkind.nvim",
    {
      "L3MON4D3/LuaSnip",
      dependencies = {
        "saadparwaiz1/cmp_luasnip",
      },
    },
  },
  config = function()
    local cmp = require("cmp")
    local cmp_types = require("cmp.types.cmp")
    local cmp_mapping = require("cmp.config.mapping")

    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    local base = require("utils.base")
    local interface = require("utils.interface")

    require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/extras/snippets" } })

    cmp.setup({
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          local max_width = 0
          if max_width ~= 0 and #vim_item.abbr > max_width then
            vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. interface.icons.get_icon("ui", "Ellipsis")
          end
          vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind

          if entry.source.name == "copilot" then
            vim_item.kind = interface.get_icon("git", "Octoface")
            vim_item.kind_hl_group = "CmpItemKindCopilot"
          end

          if entry.source.name == "emoji" then
            vim_item.kind = interface.get_icon("misc", "Smiley")
            vim_item.kind_hl_group = "CmpItemKindEmoji"
          end
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            emoji = "[Emoji]",
            path = "[Path]",
            luasnip = "[Snippet]",
            buffer = "[Buffer]",
            copilot = "[Copilot]",
          })[entry.source.name]
          vim_item.dup = ({
            buffer = 1,
            path = 1,
            nvim_lsp = 0,
            luasnip = 1,
          })[entry.source.name] or 0
          return vim_item
        end,
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
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
        {
          name = "copilot",
          keyword_length = 5,
          max_item_count = 3,
          trigger_characters = {
            {
              ".",
              ":",
              "(",
              "'",
              '"',
              "[",
              ",",
              "#",
              "*",
              "@",
              "|",
              "=",
              "-",
              "{",
              "/",
              "\\",
              "+",
              "?",
              " ",
            },
          },
        },
        {
          name = "nvim_lsp",
          entry_filter = function(entry, ctx)
            local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
            if kind == "Snippet" and ctx.prev_context.filetype == "java" then
              return false
            end
            if kind == "Text" then
              return false
            end
            return true
          end,
        },

        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
        { name = "emoji" },
        { name = "nvim_lua" },
      },
      mapping = cmp_mapping.preset.insert({
        ["<C-k>"] = cmp_mapping(cmp_mapping.select_prev_item(), { "i", "c" }),
        ["<C-j>"] = cmp_mapping(cmp_mapping.select_next_item(), { "i", "c" }),
        ["<Down>"] = cmp_mapping(cmp_mapping.select_next_item({ behavior = cmp_types.SelectBehavior.Select }), {
          "i",
        }),
        ["<Up>"] = cmp_mapping(cmp_mapping.select_prev_item({ behavior = cmp_types.SelectBehavior.Select }), {
          "i",
        }),
        ["<C-b>"] = cmp_mapping.scroll_docs(-4),
        ["<C-f>"] = cmp_mapping.scroll_docs(4),
        ["<C-y>"] = cmp_mapping({
          i = cmp_mapping.confirm({ behavior = cmp_types.ConfirmBehavior.Replace, select = false }),
          c = function(fallback)
            if cmp.visible() then
              cmp.confirm({ behavior = cmp_types.ConfirmBehavior.Replace, select = false })
            else
              fallback()
            end
          end,
        }),
        ["<Tab>"] = cmp_mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          elseif base.jumpable(1) then
            luasnip.jump(1)
          elseif base.has_words_before() then
            -- cmp.complete()
            fallback()
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
        ["<C-c>"] = cmp_mapping.complete(),
        ["<C-e>"] = cmp_mapping.abort(),
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
            local entry = cmp.get_selected_entry()
            local is_copilot = entry and entry.source.name == "copilot"
            if is_copilot then
              confirm_opts.behavior = cmp_types.ConfirmBehavior.Replace
              confirm_opts.select = true
            end
            if cmp.confirm(confirm_opts) then
              return
            end
          end
          fallback()
        end),
      }),
    })
  end,
}
