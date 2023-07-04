require("core.settings")
require("core.options")
require("core.mappings")
require("core.plugins")
require("core.after")

-- TODO: Move into proper cofiguration file. 

local style = "default"

local colors = require("decay.core").get_colors(style)
local highlights = require("decay.highlights")

highlights.bulk_hi({
  NvimTreeNormal = { bg = "NONE" },
  NvimTreeNormalNC = { bg = "NONE" },
  NvimTreeEndOfBuffer = { bg = "NONE", fg = colors.contrast },
  NvimTreeEndOfBufferNC = { bg = "NONE", fg = colors.contrast },
  NvimTreeVertSplit = { fg = "NONE", bg = colors.background },
})

require("decay").setup({
  style = style,
  cmp = {
    block_kind = false,
  },
  nvim_tree = {
    contrast = false,
  },
  italics = {
    code = true,
    comments = true,
  },
  palette_overrides = {
    background = "NONE",
  },
})
