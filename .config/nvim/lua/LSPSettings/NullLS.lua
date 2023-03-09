local hadSuccess, NullLS = pcall(require, "null-ls")
if not hadSuccess then
  return
end

local Formatting = NullLS.builtins.formatting
local CodeActions = NullLS.builtins.code_actions
local Diagnostics = NullLS.builtins.diagnostics

local sources = {
  Formatting.eslint_d,
  Formatting.autopep8,
  Formatting.stylua,
  Formatting.clang_format,
  Formatting.stylelint,
  Formatting.prettier,

  CodeActions.eslint_d,

  Diagnostics.eslint_d,
}

local LSPFormatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        LSPFormatting(bufnr)
      end,
    })
  end
end

NullLS.setup({
  sources = sources,
  on_attach = on_attach,
})
