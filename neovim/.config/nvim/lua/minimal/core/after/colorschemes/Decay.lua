local types = require("minimal.utils.types")
local interface = require("minimal.utils.interface")

local style = "default"

local decay = require("decay")
local decay_highlights = require("decay.highlights")

local colors = interface.colors.get()
local colors_override = types.settings.transparent_background and "NONE" or colors.bg

local M = {}

decay.setup({
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
    background = colors_override,
  },
})

if types.settings.transparent_background then
  decay_highlights.bulk_hi({
    StatusLine = { bg = colors.bg, fg = colors.fg },
    StatusLineNC = { bg = colors.fg, fg = colors.bg },
    NvimTreeNormal = { bg = "NONE" },
    NvimTreeNormalNC = { bg = "NONE" },
    NvimTreeEndOfBuffer = { bg = "NONE", fg = colors.fg },
    NvimTreeEndOfBufferNC = { bg = "NONE", fg = colors.fg },
    NvimTreeVertSplit = { fg = "NONE", bg = colors.fg },
  })
end

return M
