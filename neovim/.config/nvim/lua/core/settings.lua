---@diagnostic disable: undefined-global

local api = require("utils.api")

local M = {
  transparent = false,
  dim_inactive = false,

  float_border = true,
  show_winbar = true,

  auto_save = true,
  auto_restore_cursor_position = true,

  storage_directory = api.paths.join(vim.fn.stdpath("data"), "store"),
  lazy_install_directory = api.paths.join(vim.fn.stdpath("data"), "lazy"),
  mason_install_directory = api.paths.join(vim.fn.stdpath("data"), "mason"),
  global_config_directory = api.paths.join(vim.fn.stdpath("config"), "config"),
}

return M
