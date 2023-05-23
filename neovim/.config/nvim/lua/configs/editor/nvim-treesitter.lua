local M = {
  requires = {
    "nvim-treesitter.configs",
    "nvim-treesitter.install",
  },
}

function M.before() end

function M.load()
  M.nvim_treesitter_install.prefer_git = true
  M.nvim_treesitter_configs.setup({
    ensure_installed = {
      "c",
      "cpp",
      "c_sharp",
      "rust",
      "lua",
      "python",
      "html",
      "css",
      "tsx",
      "javascript",
      "typescript",
      "fish",
      "json",
      "toml",
      "gitcommit",
      "gitignore",
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = false,
      -- disable = { "yaml", "python", "html", "vue" },
    },
    incremental_selection = {
      enable = false,
      keymaps = {
        init_selection = "<cr>",
        node_incremental = "<cr>",
        node_decremental = "<bs>",
        scope_incremental = "<tab>",
      },
    },
    rainbow = {
      enable = true,
      disable = { "jsx", "html" },
    },
    autotag = {
      enable = true,
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  })
end

function M.after() end

return M
