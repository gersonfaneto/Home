return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    lazy = false,
    dependencies = {
      {
        "williamboman/mason.nvim",
        build = function()
          pcall(vim.cmd, "MasonUpdate")
        end,
        dependencies = {
          "williamboman/mason-lspconfig.nvim",
        },
      },
      {
        "hrsh7th/nvim-cmp",
        dependencies = {
          "hrsh7th/cmp-path",
          "hrsh7th/cmp-emoji",
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-nvim-lsp",
          "L3MON4D3/LuaSnip",
          "saadparwaiz1/cmp_luasnip",
        },
      },
      "neovim/nvim-lspconfig",
      "onsails/lspkind.nvim",
      "b0o/schemastore.nvim",
    },
    config = function()
      local lsp = require("lsp-zero").preset("recommended")

      local settings = require("core.settings")

      local ensure_installed = {
        "bashls",
        "clangd",
        "cmake",
        "csharp_ls",
        "cssls",
        "emmet_ls",
        "html",
        "jdtls",
        "lua_ls",
        "pyright",
        "rust_analyzer",
        "svelte",
        "tailwindcss",
        "tsserver",
        "vuels",
      }

      lsp.on_attach(function(_, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }

        local api = require("utils.api")

        api.mappings.bulk_register({
          {
            mode = { "n", "v" },
            lhs = "<leader>la",
            rhs = vim.lsp.buf.code_action,
            options = opts,
            description = "Show code actions.",
          },
          {
            mode = { "n" },
            lhs = "<leader>rn",
            rhs = vim.lsp.buf.rename,
            options = opts,
            description = "Rename symbol under cursor.",
          },
          {
            mode = { "n" },
            lhs = "<leader>lf",
            rhs = function()
              vim.lsp.buf.format({ async = true })
            end,
            options = opts,
            description = "Format current buffer.",
          },
          {
            mode = { "n" },
            lhs = "K",
            rhs = vim.lsp.buf.hover,
            options = opts,
            description = "Show help information.",
          },
          {
            mode = { "n" },
            lhs = "gr",
            rhs = function()
              require("telescope.builtin").lsp_references()
            end,
            options = opts,
            description = "Go to references.",
          },
          {
            mode = { "n" },
            lhs = "gi",
            rhs = function()
              require("telescope.builtin").lsp_implementations()
            end,
            options = opts,

            description = "Go to implementations.",
          },
          {
            mode = { "n" },
            lhs = "gd",
            rhs = function()
              require("telescope.builtin").lsp_definitions()
            end,
            options = opts,
            description = "Go to definitions.",
          },
          {
            mode = { "n" },
            lhs = "gD",
            rhs = function()
              require("telescope.builtin").lsp_type_definitions()
            end,
            options = opts,
            description = "Go to type definitions.",
          },
          {
            mode = { "n" },
            lhs = "of",
            rhs = vim.diagnostic.open_float,
            options = opts,
            description = "Show current line diagnostic..",
          },
          {
            mode = { "n" },
            lhs = "<leader>ld",
            rhs = function()
              require("telescope.builtin").diagnostics()
            end,
            options = opts,
            description = "Show project diagnostics.",
          },
          {
            mode = { "n" },
            lhs = "[d",
            rhs = vim.diagnostic.goto_prev,
            options = opts,
            description = "Jump to previous diagnostic.",
          },
          {
            mode = { "n" },
            lhs = "]d",
            rhs = vim.diagnostic.goto_next,
            options = opts,
            description = "Jump to next diagnostic.",
          },
        })
      end)

      if settings.format_on_save then
        lsp.format_on_save({
          format_opts = {
            async = false,
            timeout_ms = 10000,
          },
          servers = {
            ["gopls"] = { "go" },
            ["lua_ls"] = { "lua" },
            ["rust_analyzer"] = { "rust" },
          },
        })
      end

      lsp.set_preferences({
        suggest_lsp_servers = false,
      })

      lsp.set_sign_icons({
        info = "I",
        hint = "H",
        warn = "W",
        error = "E",
      })

      vim.diagnostic.config({
        underline = true,
        virtual_text = true,
        signs = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          source = "always",
          style = "minimal",
          border = "rounded",
          header = "",
          prefix = "",
        },
      })

      local lspconfig = require("lspconfig")

      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup({
        ensure_installed = ensure_installed,
      })

      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      })

      lspconfig.rust_analyzer.setup({
        settings = {
          ["rust-analyzer"] = {
            lens = {
              enable = true,
            },
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              runBuildScripts = true,
            },
            check = {
              enable = true,
              allFeatures = true,
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
            procMacro = {
              enable = true,
              ignored = {
                ["napi-derive"] = { "napi" },
                ["async-trait"] = { "async_trait" },
                ["async-recursion"] = { "async_recursion" },
              },
            },
          },
        },
      })

      lsp.skip_server_setup({
        "jdtls",
      })

      lsp.setup()

      local utils = require("utils.api")
      local icons = require("utils.interface").icons

      local cmp = require("cmp")
      local cmp_types = require("cmp.types.cmp")
      local cmp_mapping = require("cmp.config.mapping")

      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      cmp.setup({
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            local max_width = 0
            if max_width ~= 0 and #vim_item.abbr > max_width then
              vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. icons.ui.Ellipsis
            end
            vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind

            if entry.source.name == "copilot" then
              vim_item.kind = icons.git.Octoface
              vim_item.kind_hl_group = "CmpItemKindCopilot"
            end

            if entry.source.name == "emoji" then
              vim_item.kind = icons.misc.Smiley
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
          { name = "crates" },
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
            elseif utils.jumpable(1) then
              luasnip.jump(1)
            elseif utils.has_words_before() then
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
  },
}
