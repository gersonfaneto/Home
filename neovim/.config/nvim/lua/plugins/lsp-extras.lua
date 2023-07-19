local settings = require("core.settings")

return {
  {
    "lvimuser/lsp-inlayhints.nvim",
    config = function()
      require("lsp-inlayhints").setup()

      vim.api.nvim_create_augroup("LspAttachInlayHints", {})

      vim.api.nvim_create_autocmd("LspAttach", {
        group = "LspAttachInlayHints",
        callback = function(args)
          if not settings.inlay_hints then
            return
          elseif not (args.data and args.data.client_id) then
            return
          end

          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)

          require("lsp-inlayhints").on_attach(client, bufnr)
        end,
      })
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    event = "BufReadPre",
  },
}
