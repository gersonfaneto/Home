local interface = require("utils.interface")


local M = {}

require("core.after.autocommands")
require("core.after.usercommands")
require("core.after.mappings")

interface.theme.set()

return M
