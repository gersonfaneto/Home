---@diagnostic disable: undefined-global

local api = require("utils.api")
local settings = require("core.settings")

local M = {
  plugin_config_root_directory = "configs",
}

function M.get_opts()
  return {
    root = settings.storage_directory,
    install = {
      colorscheme = { "habamax" },
    },
    ui = {
      border = settings.float_border and "double" or "none",
    },
    performance = {
      disabled_plugins = {
        -- "netrw",
        -- "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
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
  }
end

function M.before()
  local lazy_install_path = api.paths.join(settings.storage_directory, "lazy.nvim")

  if not vim.loop.fs_stat(lazy_install_path) then
    vim.notify("Downloading lazy.nvim ...", "INFO", { title = "Lazy" })
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      lazy_install_path,
    })
  end

  vim.opt.runtimepath:prepend(lazy_install_path)
  M.lazy = require("lazy")
end

function M.load(plugins)
  local requires_moduls = {}

  for plugin_kind_name, plugin_kind_tbl in pairs(plugins) do
    for _, plugin_opts in ipairs(plugin_kind_tbl) do
      if not plugin_opts.dir then
        local require_file_name = (plugin_opts.name or plugin_opts[1]:match("/([%w%-_]+).?")):lower()

        local require_file_path = api.paths.join(M.plugin_config_root_directory, plugin_kind_name, require_file_name)
        local ok, module = pcall(require, require_file_path)

        if ok then
          plugin_opts.init = plugin_opts.init or function()
            module.before()
          end

          plugin_opts.config = plugin_opts.config
            or function()
              api.require_all_package(module)
              module.load()
              module.after()
            end
        end
      end
      table.insert(requires_moduls, plugin_opts)
    end
  end

  M.lazy.setup(requires_moduls, M.get_opts())
end

function M.after()
  M.register_key()
end

function M.entry(plugins)
  M.before()
  M.load(plugins)
  M.after()
end

function M.register_key()
  api.maps.register({
    mode = { "n" },
    lhs = "<leader>lh",
    rhs = ":Lazy<CR>",
    options = { silent = true },
    description = "Open Lazy.",
  })
end

return M
