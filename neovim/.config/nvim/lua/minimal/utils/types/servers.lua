---@class Servers
local M = {}

---List of parsers that will be installed by `TreeSitter`.
---See: https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
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

---List of language servers that can be installed through `Mason` and will be configured by the
---native `LSP` client.
---See: https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations
---@type string[]
M.base_languages = {
  "bashls",        -- Bash
  "clangd",        -- C/C++
  "cssls",         -- CSS
  "emmet_ls",      -- HTML
  "gopls",         -- Go
  "html",          -- HTML
  "jdtls",         -- Java
  "jsonls",        -- JSON
  "lua_ls",        -- Lua
  "ocamllsp",      -- OCaml
  "pyright",       -- Python
  "rust_analyzer", -- Rust
  "texlab",        -- LaTeX
  "tsserver",      -- TypeScript / JavaScript
  "yamlls",        -- YAML
}

---List of language servers that can't be installed through `Mason`, but will also be configured by
---the native `LSP` client.
---See: https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations
---@type string[]
M.extra_languages = {
}

---List of linters that can be installed through `Mason` and configured by `NoneLS`.
---NOTE: This **need** to be configured manually in the `NoneLS` configuration file.
---See: https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
---@type string[]
M.linters = {
  "eslint_d",   -- TypeScript / JavaScript
  "pylint",     -- Python
}

---List of formatters that can be installed through `Mason` and configured by `NoneLS`.
---NOTE: This **need** to be configured manually in the `NoneLS` configuration file.
---See: https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
---@type string[]
M.formatters = {
  "black",        -- Python
  "clang-format", -- C/C++
  "isort",        -- Python
  "ocamlformat",  -- OCaml
  "prettier",     -- *
  "stylua",       -- Lua
}

return require("minimal.utils.base.settings").extend_settings(M, "custom.servers")
