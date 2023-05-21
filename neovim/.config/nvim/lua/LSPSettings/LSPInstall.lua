local pCall = require("Utils.ProtectedCall")

local MasonManager = pCall("mason")
local MasonConfig = pCall("mason-lspconfig")

local defaultLSPPreview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "single"
  opts.max_width = opts.max_width or 80
  return defaultLSPPreview(contents, syntax, opts, ...)
end

local mainServers = {
  "rust_analyzer",
  "csharp_ls",
  "clangd",
  "jdtls",
  "cmake",
  "pyright",
  "lua_ls",
  "html",
  "cssls",
  "tailwindcss",
  "tsserver",
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
