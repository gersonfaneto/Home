local base = require("utils.base")

local harpoon_ui = require("harpoon.ui")
local harpoon_mark = require("harpoon.mark")

local props = {
  options = {
    silent = true,
    noremap = true,
  },
  prefix = "Harpoon: ",
}

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>hf",
    rhs = harpoon_mark.add_file,
    options = props.options,
    description = props.prefix .. "Add current file to Harpoon.",
  },
  {
    mode = { "n" },
    lhs = "<leader>hm",
    rhs = harpoon_ui.toggle_quick_menu,
    options = props.options,
    description = props.prefix .. "Open.",
  },
  {
    mode = { "n" },
    lhs = "<leader>1",
    rhs = function()
      return harpoon_ui.nav_file(1)
    end,
    options = props.options,
    description = props.prefix .. "Go to file number 1.",
  },
  {
    mode = { "n" },
    lhs = "<leader>2",
    rhs = function()
      return harpoon_ui.nav_file(2)
    end,
    options = props.options,
    description = props.prefix .. "Go to file number 2.",
  },
  {
    mode = { "n" },
    lhs = "<leader>3",
    rhs = function()
      return harpoon_ui.nav_file(3)
    end,
    options = props.options,
    description = props.prefix .. "Go to file number 3.",
  },
  {
    mode = { "n" },
    lhs = "<leader>4",
    rhs = function()
      return harpoon_ui.nav_file(4)
    end,
    options = props.options,
    description = props.prefix .. "Go to file number 4.",
  },
  {
    mode = { "n" },
    lhs = "<leader>5",
    rhs = function()
      return harpoon_ui.nav_file(5)
    end,
    options = props.options,
    description = props.prefix .. "Go to file number 5.",
  },
  {
    mode = { "n" },
    lhs = "<leader>6",
    rhs = function()
      return harpoon_ui.nav_file(6)
    end,
    options = props.options,
    description = props.prefix .. "Go to file number 6.",
  },
  {
    mode = { "n" },
    lhs = "<leader>7",
    rhs = function()
      return harpoon_ui.nav_file(7)
    end,
    options = props.options,
    description = props.prefix .. "Go to file number 7.",
  },
  {
    mode = { "n" },
    lhs = "<leader>8",
    rhs = function()
      return harpoon_ui.nav_file(8)
    end,
    options = props.options,
    description = props.prefix .. "Go to file number 8.",
  },
  {
    mode = { "n" },
    lhs = "<leader>9",
    rhs = function()
      return harpoon_ui.nav_file(9)
    end,
    options = props.options,
    description = props.prefix .. "Go to file number 9.",
  },
  {
    mode = { "n" },
    lhs = "<leader>0",
    rhs = function()
      return harpoon_ui.nav_file(10)
    end,
    options = props.options,
    description = props.prefix .. "Go to file number 10.",
  },
})

return M
