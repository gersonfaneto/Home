local settings = require("utils.api").settings

return {
  {
    "lvimuser/lsp-inlayhints.nvim",
    enabled = settings.get_settings("inlay_hints"),
    config = function()
      local lsp_inlayhints = require("lsp-inlayhints")

      lsp_inlayhints.setup()

      vim.api.nvim_create_augroup("LspAttachInlayHints", {})

      vim.api.nvim_create_autocmd("LspAttach", {
        group = "LspAttachInlayHints",
        callback = function(args)
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
}
