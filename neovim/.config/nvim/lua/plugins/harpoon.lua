return {
  "ThePrimeagen/harpoon",
  enabled = true,
  lazy = false,
  config = function()
    local api = require("utils.api")

    local harpoon = require("harpoon")
    local harpoon_ui = require("harpoon.ui")
    local harpoon_mark = require("harpoon.mark")

    harpoon.setup({
      excluded_filetypes = { "NvimTree" },
    })

    api.mappings.bulk_register({
      {
        mode = { "n" },
        lhs = "<leader>a",
        rhs = harpoon_mark.add_file,
        options = { noremap = true, silent = true },
        description = "Add current file to Harpoon.",
      },
      {
        mode = { "n" },
        lhs = "<leader>e",
        rhs = harpoon_ui.toggle_quick_menu,
        options = { noremap = true, silent = true },
        description = "Open Harpoon.",
      },
      {
        mode = { "n" },
        lhs = "<leader>1",
        rhs = function()
          return harpoon_ui.nav_file(1)
        end,
        options = { noremap = true, silent = true },
        description = "Go to file number 1.",
      },
      {
        mode = { "n" },
        lhs = "<leader>2",
        rhs = function()
          return harpoon_ui.nav_file(2)
        end,
        options = { noremap = true, silent = true },
        description = "Go to file number 2.",
      },
      {
        mode = { "n" },
        lhs = "<leader>3",
        rhs = function()
          return harpoon_ui.nav_file(3)
        end,
        options = { noremap = true, silent = true },
        description = "Go to file number 3.",
      },
      {
        mode = { "n" },
        lhs = "<leader>4",
        rhs = function()
          return harpoon_ui.nav_file(4)
        end,
        options = { noremap = true, silent = true },
        description = "Go to file number 4.",
      },
      {
        mode = { "n" },
        lhs = "<leader>5",
        rhs = function()
          return harpoon_ui.nav_file(5)
        end,
        options = { noremap = true, silent = true },
        description = "Go to file number 5.",
      },
      {
        mode = { "n" },
        lhs = "<leader>6",
        rhs = function()
          return harpoon_ui.nav_file(6)
        end,
        options = { noremap = true, silent = true },
        description = "Go to file number 6.",
      },
      {
        mode = { "n" },
        lhs = "<leader>7",
        rhs = function()
          return harpoon_ui.nav_file(7)
        end,
        options = { noremap = true, silent = true },
        description = "Go to file number 7.",
      },
      {
        mode = { "n" },
        lhs = "<leader>8",
        rhs = function()
          return harpoon_ui.nav_file(8)
        end,
        options = { noremap = true, silent = true },
        description = "Go to file number 8.",
      },
      {
        mode = { "n" },
        lhs = "<leader>9",
        rhs = function()
          return harpoon_ui.nav_file(9)
        end,
        options = { noremap = true, silent = true },
        description = "Go to file number 9.",
      },
      {
        mode = { "n" },
        lhs = "<leader>0",
        rhs = function()
          return harpoon_ui.nav_file(10)
        end,
        options = { noremap = true, silent = true },
        description = "Go to file number 10.",
      },
    })
  end,
}
