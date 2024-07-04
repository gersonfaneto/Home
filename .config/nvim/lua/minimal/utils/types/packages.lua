---@class Packages
local M = {}

---@type string[]
M.parsers = {
  "c",
  "cpp",
  "lua",
  "bash",
  "java",
  "vim",
  "vimdoc",
  "markdown",
  "markdown_inline",
  "yaml",
  "json",
  "toml",
}

---@type table<string, string>
M.servers = {
  lua_ls = "lua-language-server",
  marksman = "marksman",
  clangd = "clangd",
  jdtls = "jdtls",
  bashls = "bash-language-server",
  taplo = "taplo",
  jsonls = "json-lsp",
  yamlls = "yaml-language-server",
}

M.external_servers = {}

---@type table<string, table<string, string[]>>
M.extensions = {
  linters = {},
  formatters = {
    sh = { "shfmt" },
  },
}

-- TODO: This isn't working properly anymore.
-- return require("minimal.utils.base.settings").extend_settings(M, "custom.packages")
return vim.tbl_deep_extend('keep', M, require("custom.packages"))
