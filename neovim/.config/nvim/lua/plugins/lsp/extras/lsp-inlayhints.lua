return {
  "lvimuser/lsp-inlayhints.nvim",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  cond = function ()
    local types = require("utils.types")

    return types.get_settings("inlay_hints")
  end,
  config = function()
    local lsp_inlayhints = require("lsp-inlayhints")

    lsp_inlayhints.setup()

    vim.api.nvim_create_augroup("LSPAttachInlayHints", {})

    vim.api.nvim_create_autocmd("LSPAttach", {
      group = "LSPAttachInlayHints",
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
}
