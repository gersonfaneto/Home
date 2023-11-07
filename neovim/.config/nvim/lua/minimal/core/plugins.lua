local types = require("minimal.utils.types")

local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazy_path) then
  vim.notify("Downloading lazy.nvim ...", "INFO", { title = "Lazy" })
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazy_path,
  })
end

vim.opt.rtp:prepend(lazy_path)

local ok, lazy = pcall(require, "lazy")

if not ok then
  vim.notify("Failed to download lazy.nvim ...", "ERROR", { title = "Lazy" })
  return
end

local include_directories = {
  { import = "minimal.plugins.coding" },
  { import = "minimal.plugins.coding.copilot" },
  { import = "minimal.plugins.coding.extras" },
  { import = "minimal.plugins.editing" },
  { import = "minimal.plugins.exploring" },
  { import = "minimal.plugins.spelling" },
  { import = "minimal.plugins.tooling" },
  { import = "minimal.plugins.viewing" },
}

local lazy_options = {
  install = {
    missing = true,
    colorscheme = {
      "habamax",
    },
  },
  ui = {
    border = types.settings.transparent_floats and "double" or "none",
  },
  checker = {
    enabled = false,
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        -- "netrw",
        -- "netrwPlugin",
        -- "netrwSettings",
        -- "netrwFileHandlers",
        "2html_plugin",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
      },
    },
  },
}

lazy.setup(include_directories, lazy_options)
