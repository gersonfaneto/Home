--- This module provides some functions for retrieving the values of the settings
--- defined in `utils.types.settings`.
--- @module "utils.types.types"
local M = require("utils.types.types")

--- Define the standard values for each of the available settings.
--- @module "utils.types.settings"
M.settings = require("utils.types.settings")

--- Provides a list of the language servers, linters and formatters to be
--- installed by some plugins, such as `mason`.
--- @module "utils.types.servers"
M.servers = require("utils.types.servers")

return M
