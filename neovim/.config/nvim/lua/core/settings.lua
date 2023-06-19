---@diagnostic disable: undefined-global

local api = require("utils.api")

local M = {
  transparent = true,
  dim_inactive = false,

  float_border = true,
  show_winbar = false,

  auto_save = false,
  auto_restore_cursor_position = false,
  auto_remove_new_lines_comments = true,

  storage_directory = api.paths.join(vim.fn.stdpath("data"), "store"),
  lazy_install_directory = api.paths.join(vim.fn.stdpath("data"), "lazy"),
  mason_install_directory = api.paths.join(vim.fn.stdpath("data"), "mason"),
  global_config_directory = api.paths.join(vim.fn.stdpath("config"), "config"),
}

return M
