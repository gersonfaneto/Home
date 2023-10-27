return {
  "folke/noice.nvim",
  event = { "VeryLazy" },
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  cond = function()
    local types = require("utils.types")

    return types.get_settings("enhanced_ui")
  end,
  config = function()
    local base = require("utils.base")

    local noice = require("noice")
    local telescope = require("telescope")

    noice.setup({
      lsp = {
        progress = {
          enabled = false,
        },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = false,
        command_palette = false,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
    })

    telescope.load_extension("noice")

    base.mappings.bulk_register({
      {
        mode = { "n" },
        lhs = "<leader>nh",
        rhs = ":Noice telescope<CR>",
        options = { noremap = true, silent = true },
        description = "Noice - Open notification history.",
      },
      {
        mode = { "n" },
        lhs = "<leader>nc",
        rhs = ":Noice dismiss<CR>",
        options = { noremap = true, silent = true },
        description = "Noice - Clear all notifications.",
      },
      {
        mode = { "n" },
        lhs = "<leader>np",
        rhs = ":Noice last<CR>",
        options = { noremap = true, silent = true },
        description = "Noice - View last notification.",
      },
      {
        mode = { "n" },
        lhs = "<leader>nd",
        rhs = ":Noice disable<CR>",
        options = { noremap = true, silent = true },
        description = "Noice - Disable.",
      },
      {
        mode = { "n" },
        lhs = "<leader>ne",
        rhs = ":Noice enable<CR>",
        options = { noremap = true, silent = true },
        description = "Noice - Enable.",
      },
    })
  end,
}
