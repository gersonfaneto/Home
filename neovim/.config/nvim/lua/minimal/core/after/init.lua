local interface = require("minimal.utils.interface")


local M = {}

require("minimal.core.after.autocommands")
require("minimal.core.after.usercommands")
require("minimal.core.after.mappings")

interface.theme.set()

return M
