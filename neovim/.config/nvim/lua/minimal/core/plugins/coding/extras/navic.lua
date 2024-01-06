return {
  "SmiteshP/nvim-navic",
  event = { "LspAttach" },
  config = function()
    local navic = require("nvim-navic")

    local icons = {
      ui = utils.interface.icons.get("ui"),
      kind = utils.interface.icons.get("kind", true),
    }

    navic.setup({
      lsp = {
        auto_attach = true,
      },
      click = true,
      highlight = true,
      icons = icons.kind,
      separator = " " .. icons.ui.ChevronRight .. " ",
    })
  end,
}
