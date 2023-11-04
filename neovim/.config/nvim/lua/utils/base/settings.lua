local M = {}

local tables = require("utils.base.tables")

-- Function to extend existing core configs (settings, events, etc.)
---@param config table @The default config to be merged with
---@param user_config string @The module name used to require user config
---@return table @Extended config
function M.extend_settings(config, user_config)
	local ok, extras = pcall(require, user_config)
	if ok and type(extras) == "table" then
		config = tables.merge(config, extras)
	end
	return config
end

return M
