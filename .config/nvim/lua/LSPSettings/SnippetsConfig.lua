local hadSuccessI, LuaSnipVS = pcall(require, "luasnip/loaders/from_vscode")
local hadSuccessII, LuaSnip = pcall(require, "luasnip")
if not hadSuccessI or not hadSuccessII then
  return
end

LuaSnipVS.lazy_load()

LuaSnip.filetype_extend("javascriptreact", { "html" })
LuaSnip.filetype_extend("typescriptreact", { "html" })
