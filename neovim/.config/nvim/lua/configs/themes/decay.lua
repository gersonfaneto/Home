local settings = require("core.settings")

local style = "default"

local M = {
  requires = {
    "decay",
    "decay.core",
    "decay.highlights",
  },
}

function M.before() end

function M.load()
  if settings.transparent then
    local colors = M.decay_core.get_colors(style)

    M.decay_highlights.bulk_hi({
      NvimTreeNormal = { bg = "NONE" },
      NvimTreeNormalNC = { bg = "NONE" },
      NvimTreeEndOfBuffer = { bg = "NONE", fg = colors.contrast },
      NvimTreeEndOfBufferNC = { bg = "NONE", fg = colors.contrast },
      NvimTreeVertSplit = { fg = "NONE", bg = colors.background },
    })

    M.colors_override = settings.transparent and "NONE" or colors.background
  end

  M.decay.setup({
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
      background = M.colors_override,
    },
  })
end

function M.after() end

return M
