local hadSuccessI, LSPConfig = pcall(require, "lspconfig")
local hadSuccessII, CompletionConfig = pcall(require, "cmp_nvim_lsp")
local hadSuccessIII, InstalledServers = pcall(require, "mason-lspconfig")
local allSet = hadSuccessI and hadSuccessII and hadSuccessIII

if not allSet then
  return
end

local mainServers = InstalledServers.get_installed_servers()
local VimDiagnostic = vim.diagnostic.config
local signDefine = vim.fn.sign_define

VimDiagnostic({
  virtual_text = true,
  float = {
    focusable = true,
    style = "minimal",
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    source = "always",
    header = "",
    prefix = "",
  },
})

signDefine("DiagnosticSignError", { text = "✗", texthl = "DiagnosticSignError" })
signDefine("DiagnosticSignWarn", { text = "!", texthl = "DiagnosticSignWarn" })
signDefine("DiagnosticSignInformation", { text = "", texthl = "DiagnosticSignInfo" })
signDefine("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

local lspOpts = {
  on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    require("PluginsSettings.KeyBindings").LSPKeys(bufnr)
  end,
  capabilities = CompletionConfig.default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    }),
  },
}

for _, lspServer in pairs(mainServers) do
  if lspServer == "lua_ls" then
    lspOpts.settings = {
      Lua = {
        diagnostics = {
          globals = { "vim", "user", "require" },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = {
          enable = false,
        },
      },
    }
  end

  if lspServer == "tsserver" then
    local hadSuccessV, Typescript = pcall(require, "typescript")
    if not hadSuccessV then
      return
    end
    Typescript.setup({})
  end

  if lspServer == "rust_analyzer" then
    local hadSuccessVI, RustTools = pcall(require, "rust-tools")
    if not hadSuccessVI then
      print("rust_analyzer failed to load!")
      return
    end
    RustTools.setup({
      server = {
        on_attach = function(_, bufnr)
          require("PluginsSettings.KeyBindings").RustKeys(bufnr)
        end,
      },
    })
  end

  if lspServer == "clangd" then
    local customOpts = lspOpts
    lspOpts.capabilities.offsetEncoding = { "utf-16" }
    LSPConfig[lspServer].setup(customOpts)
  end

  LSPConfig[lspServer].setup(lspOpts)

end

