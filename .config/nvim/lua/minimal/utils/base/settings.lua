local M = {}

local tables = require("minimal.utils.base.tables")

---Function to extend existing core settings|servers...
---@param config table @ The default config to be merged with.
---@param user_config string @ The module name used to require user settings|servers.
---@return table @ The extend settings|servers.
function M.extend_settings(config, user_config)
	local has_extras, extras = pcall(require, user_config)

	if has_extras and type(extras) == "table" then
		config = tables.merge(config, extras)
	end

	return config
end

return M
