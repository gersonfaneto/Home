local hadSuccessI, MasonManager = pcall(require, "mason")
local hadSuccessII, MasonConfig = pcall(require, "mason-lspconfig")
local allSet = hadSuccessI and hadSuccessII

if not allSet then
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
  "rust_analyzer",
  "csharp_ls",
  "clangd",
  "cmake",
  "pyright",
  "lua_ls",
  "tsserver",
  "emmet_ls",
  "eslint",
  "cssls",
  "html",
  "tailwindcss",
  "jsonls",
  "taplo",
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
