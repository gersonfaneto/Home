local hadSuccessI, MasonManager = pcall(require, "mason")
local hadSuccessII, MasonConfig = pcall(require, "mason-lspconfig")
local hadSuccessIII, LSPConfig = pcall(require, "lspconfig")
local hadSuccessIV, CompletionConfig = pcall(require, "cmp_nvim_lsp")

if not (hadSuccessI and hadSuccessII and hadSuccessIII and hadSuccessIV) then
  return
end

local defaultLSPPreview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "single"
  opts.max_width = opts.max_width or 80
  return defaultLSPPreview(contents, syntax, opts, ...)
end

local mainServers = {
  "cmake",
  "clangd",
  "csharp_ls",
  "cssls",
  "jdtls",
  "tsserver",
  "lua_ls",
  "intelephense",
  "pyright",
  "rust_analyzer",
  "eslint",
  "emmet_ls",
  "html",
  "jsonls",
  "tailwindcss",
}

MasonManager.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
    border = {
      "╭",
      "─",
      "╮",
      "│",
      "╯",
      "─",
      "╰",
      "│",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
})

MasonConfig.setup({
  ensure_installed = mainServers,
  automatic_installation = false,
})

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

  if lspServer == "jdtls" then
    goto continue
  end

  LSPConfig[lspServer].setup(lspOpts)

  ::continue::
end
