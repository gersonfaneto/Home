return {
  -- Inlay Hints.
  {
    "lvimuser/lsp-inlayhints.nvim",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function()
      local base = require("utils.base")

      local lsp_inlayhints = require("lsp-inlayhints")

      lsp_inlayhints.setup()

      vim.api.nvim_create_augroup("LspAttachInlayHints", {})

      vim.api.nvim_create_autocmd("LspAttach", {
        group = "LspAttachInlayHints",
        callback = function(args)
          if not base.settings.get_settings("inlay_hints") then
            return
          end
          if not (args.data and args.data.client_id) then
            return
          end

          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)

          lsp_inlayhints.on_attach(client, bufnr)
        end,
      })
    end,
  },

  -- Java.
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    event = {
      "BufReadPre",
      "BufNewFile",
    },
  },

  -- Dart & Flutter.
  {
    "dart-lang/dart-vim-plugin",
    ft = { "dart" },
    event = {
      "BufReadPre",
      "BufNewFile",
    },
  },
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      local base = require("utils.base")

      base.mappings.register({
        mode = { "n" },
        lhs = "<leader>fl",
        rhs = ":Telescope flutter commands<CR>",
        options = { noremap = true, silent = true },
        description = "Open Telescope Flutter Commands.",
      })

      return true
    end,
  },
}
