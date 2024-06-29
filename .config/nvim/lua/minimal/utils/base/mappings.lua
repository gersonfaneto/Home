---@diagnostic disable: duplicate-doc-field, param-type-mismatch 

---@class Mapping
---@field mode string[] @ The mode(s) to map.
---@field lhs string @ The key sequence to map.
---@field rhs string | function @ The command or function to map to.
---@field description? string @ The description of the mapping.
---@field options? table @ The options for the mapping.

---@class Props
---@field options? table @ The options for the mapping.
---@field prefix? string @ The prefix for the mapping.

local M = {}

---Registers a single mapping.
---@param map Mapping @ The mapping to register.
function M.register(map)
  map.options.desc = map.description

  if type(map.rhs) == "function" or map.options.buffer then
    vim.keymap.set(map.mode, map.lhs, map.rhs, map.options)
    return
  end

  for _, mode in ipairs(map.mode) do
    vim.api.nvim_set_keymap(mode, map.lhs, map.rhs, map.options)
  end
end

---Registers multiple mappings.
---@param maps Mapping[] @ The list of mappings to register.
---@param props? Props @ The properties in common for all mappings.
function M.bulk_register(maps, props)
  for _, map in pairs(maps) do
    if props ~= nil then
      if props.prefix ~= nil then
        map.description = props.prefix .. map.description
      end

      if props.options ~= nil then
        map.options = vim.tbl_extend("keep", map.options or {}, props.options)
      end
    end

    M.register(map)
  end
end

return M
