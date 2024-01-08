---@class Servers
local M = {}

---List of parsers that will be installed by `TreeSitter`.
---
---[Supported Languages](https://github.com/nvim-treesitter/nvim-treesitter#supported-languages)
---@type string[]
M.parsers = {
  "bash",
  "c",
  "cpp",
  "css",
  "dart",
  "fish",
  "git_rebase",
  "gitcommit",
  "gitignore",
  "go",
  "html",
  "java",
  "javascript",
  "json",
  "lua",
  "make",
  "markdown",
  "markdown_inline",
  "ocaml",
  "python",
  "rust",
  "sql",
  "toml",
  "typescript",
  "yaml",
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
  bashls = "bash-language-server", -- Bash
  clangd = "clangd", -- C/C++
  cssls = "css-lsp", -- CSS
  emmet_ls = "emmet-ls", -- HTML
  gopls = "gopls", -- Go
  html = "html-lsp", -- HTML
  jdtls = "jdtls", -- Java
  jsonls = "json-lsp", -- JSON
  lua_ls = "lua-language-server", -- Lua
  ocamllsp = "ocaml-lsp", -- OCaml
  phpactor = "phpactor", -- PHP
  pyright = "pyright", -- Python
  rust_analyzer = "rust-analyzer", -- Rust
  solargraph = "solargraph", -- Ruby
  texlab = "texlab", -- LaTeX
  tsserver = "typescript-language-server", -- TypeScript / JavaScript
  yamlls = "yaml-language-server", -- YAML
}

---List of language servers that can't be installed through `Mason`, but will also be configured by
---the native `LSP` client.
---
---[Supported Language Servers](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
---@type string[]
M.extra_languages = {
  "dartls", -- Dart
}

---List of linters that can be installed through `Mason` and configured by `NoneLS`.
---
---**NOTE**: These **need** to be configured manually in the `NoneLS` configuration file.
---
---[Supported Linters](https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md)
---@type string[]
M.linters = {
  "eslint_d", -- JavaScript | TypeScript
}

---List of formatters that can be installed through `Mason` and configured by `NoneLS`.
---
---**NOTE**: These **need** to be configured manually in the `NoneLS` configuration file.
---
---[Support Formatters](https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md)
---@type string[]
M.formatters = {
  "black", -- Python
  "clang-format", -- C/C++
  "google-java-format", -- Java
  "isort", -- Python
  "ocamlformat", -- OCaml
  "prettier", -- JavaScript | TypeScript | Markdown ...
  "stylua", -- Lua
}

return require("minimal.utils.base.settings").extend_settings(M, "custom.servers")
