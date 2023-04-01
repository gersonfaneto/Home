local pCall = require("Utils.ProtectedCall")

local LuaSnipVS = pCall("luasnip/loaders/from_vscode")
local LuaSnip = pCall("luasnip")

LuaSnipVS.lazy_load()

LuaSnip.filetype_extend("javascriptreact", { "html" })
LuaSnip.filetype_extend("typescriptreact", { "html" })
