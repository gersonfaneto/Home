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

      local ensure_installed = {
        -- LSP
        "jdtls",
        "clangd",
        "pyright",
        "cssls",
        "jsonls",
        "html",
        "emmet_ls",
        "vuels",
        "rust_analyzer",
        "vimls",
        "lua_ls",
        "bashls",
        "cmake",
        "svelte",
        "tsserver",
        "tailwindcss",
      }

      lsp.on_attach(function(_, bufnr)
        local opts = { noremap = true, silent = true }

        local maps = require("utils").maps

        lsp.default_keymaps({
          buffer = bufnr,
          omit = { "F2", "F3", "F4", "gl" },
        })

        maps.bulk_register({
          {
            mode = { "n" },
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
            description = "Rename variable.",
          },
          {
            mode = { "n" },
            lhs = "<leader>lf",
            rhs = function()
              vim.lsp.buf.format({ async = true })
            end,
            options = opts,
            description = "Format buffer.",
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
            lhs = "of",
            rhs = ":lua vim.diagnostics.open_float()<CR>",
            options = opts,
            description = "Show line diagnostic.",
          },
          {
            mode = { "n" },
            lhs = "<leader>td",
            rhs = function()
              require("telescope.builtin").diagnostics()
            end,
            options = opts,
            description = "Show workspace diagnostics.",
          },

          {
            mode = { "n", "v" },
            lhs = "<leader>lr",
            rhs = "<ESC>:lua require('telescope').extensions.refactoring.refactors()<CR>",
            options = opts,
            description = "Show refactoring options.",
          },
        })
      end)

      lsp.format_on_save({
        format_opts = {
          async = false,
          timeout_ms = 10000,
        },
        servers = {
          ["lua_ls"] = { "lua" },
          ["rust_analyzer"] = { "rust" },
          ["gopls"] = { "go" },
        },
      })

      lsp.set_preferences({
        suggest_lsp_servers = false,
      })

      lsp.set_sign_icons({
        error = "E",
        warn = "W",
        hint = "H",
        info = "I",
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

      mason_lspconfig.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            on_attach = lsp_attach,
            capabilities = lsp_capabilities,
          })
        end,
        ["lua_ls"] = function()
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
        end,
        ["rust_analyzer"] = function()
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
                    ["async-trait"] = { "async_trait" },
                    ["napi-derive"] = { "napi" },
                    ["async-recursion"] = { "async_recursion" },
                  },
                },
              },
            },
          })
        end,
      })

      local cmp = require("cmp")
      local lspkind = require("lspkind")
      local icons = require("utils").icons
      local luasnip = require("luasnip")
      local cmp_mapping = require("cmp.config.mapping")
      local cmp_types = require("cmp.types.cmp")
      local utils = require("utils")

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

            if entry.source.name == "crates" then
              vim_item.kind = icons.misc.Package
              vim_item.kind_hl_group = "CmpItemKindCrate"
            end

            if entry.source.name == "emoji" then
              vim_item.kind = icons.misc.Smiley
              vim_item.kind_hl_group = "CmpItemKindEmoji"
            end
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              emoji = "[Emoji]",
              path = "[Path]",
              calc = "[Calc]",
              vsnip = "[Snippet]",
              luasnip = "[Snippet]",
              buffer = "[Buffer]",
              tmux = "[TMUX]",
              copilot = "[Copilot]",
              treesitter = "[TreeSitter]",
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
            -- keyword_length = 0,
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

          { name = "path" },
          { name = "luasnip" },
          { name = "nvim_lua" },
          { name = "buffer" },
          { name = "calc" },
          { name = "emoji" },
          { name = "treesitter" },
          { name = "crates" },
          { name = "tmux" },
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
              }) -- avoid mutating the original opts below
              local is_insert_mode = function()
                return vim.api.nvim_get_mode().mode:sub(1, 1) == "i"
              end
              if is_insert_mode() then -- prevent overwriting brackets
                confirm_opts.behavior = cmp_types.ConfirmBehavior.Insert
              end
              local entry = cmp.get_selected_entry()
              local is_copilot = entry and entry.source.name == "copilot"
              if is_copilot then
                confirm_opts.behavior = cmp_types.ConfirmBehavior.Replace
                confirm_opts.select = true
              end
              if cmp.confirm(confirm_opts) then
                return -- success, exit early
              end
            end
            fallback() -- if not exited early, always fallback
          end),
        }),
      })
    end,
  },
}
