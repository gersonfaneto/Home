---@class Packages
local M = {}

---List of parsers that will be installed by `TreeSitter`.
---
---[Supported Languages](https://github.com/nvim-treesitter/nvim-treesitter#supported-languages)
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

---Table of language servers that can be installed through `Mason` and will be configured by the
---native `LSP` client. Note that the `key-value` pairs, representing respectively a language
---server supported by `nvim-lspconfig` and a package available on the `mason` registry, **don't**
---always match.
---
---[Supported Language Servers](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
---[Mason Registry](https://mason-registry.dev/registry/list)
---@type table<string, string>
M.base_languages = {
  lua_ls = "lua-language-server", -- Lua
  marksman = "marksman", -- Markdown
  clangd = "clangd", -- C/C++
  jdtls = "jdtls",
  bashls = "bash-language-server", -- Bash
  taplo = "taplo", -- TOML
  jsonls = "json-lsp", -- JSON
  yamlls = "yaml-language-server", -- YAML
}

---List of language servers that can't be installed through `Mason`, but will also be configured by
---the native `LSP` client.
---
---[Supported Language Servers](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
---@type string[]
M.extra_languages = {}

---List of linters that can be installed through `Mason` and configured by `NoneLS`.
---
---**NOTE**: These **need** to be configured manually in the `NoneLS` configuration file.
---
---[Supported Linters](https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md)
---@type table<string, string[]>
M.linters = {}

---List of formatters that can be installed through `Mason` and configured by `NoneLS`.
---
---**NOTE**: These **need** to be configured manually in the `NoneLS` configuration file.
---
---[Support Formatters](https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md)
---@type table<string, string[]>
M.formatters = {
  c = { "clang-format" },
  cpp = { "clang-format" },
  lua = { "stylua" },
  java = { "google-java-format" },
  markdown = { "prettier" },
}

return require("minimal.utils.base.settings").extend_settings(M, "custom.servers")
