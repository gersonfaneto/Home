local base = require("utils.base")

local props = {
  options = {
    noremap = true,
    silent = true,
  },
  prefix = "Telescope: ",
}

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader><leader>",
    rhs = function()
      require("telescope.builtin").builtin()
    end,
    options = props.options,
    description = props.prefix .. "Broswe trough all Telescope builtins.",
  },
  {
    mode = { "n" },
    lhs = "<leader>fk",
    rhs = function()
      require("telescope.builtin").keymaps()
    end,
    options = props.options,
    description = props.prefix .. "Broswe trough all the registered mappings.",
  },
  {
    mode = { "n" },
    lhs = "<leader>ff",
    rhs = function()
      require("telescope.builtin").find_files()
    end,
    options = props.options,
    description = props.prefix .. "Find files in the current workspace.",
  },
  {
    mode = { "n" },
    lhs = "<leader>fg",
    rhs = function()
      require("telescope.builtin").git_files()
    end,
    options = props.options,
    description = props.prefix .. "Find files in the current repository.",
  },
  {
    mode = { "n" },
    lhs = "<leader>fo",
    rhs = function()
      require("telescope.builtin").oldfiles()
    end,
    options = props.options,
    description = props.prefix .. "Find files in the current workspace.",
  },
  {
    mode = { "n" },
    lhs = "<leader>lg",
    rhs = function()
      require("telescope.builtin").live_grep()
    end,
    options = props.options,
    description = props.prefix .. "Find a string in the current workspace.",
  },
  {
    mode = { "n" },
    lhs = "<leader>zl",
    rhs = function()
      require("telescope").extensions.zoxide.list()
    end,
    options = props.options,
    description = props.prefix .. "Jump to directories using zoxide.",
  },
  {
    mode = { "n" },
    lhs = "<leader><Tab>",
    rhs = function()
      require("telescope.builtin").buffers()
    end,
    options = props.options,
    description = props.prefix .. "Browse trough the open buffers.",
  },
  {
    mode = { "n" },
    lhs = "<leader>;",
    rhs = function()
      require("telescope.builtin").resume()
    end,
    options = props.options,
    description = props.prefix .. "Resume to last open picker.",
  },
  {
    mode = { "n" },
    lhs = "<leader>/",
    rhs = function()
      require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        previewer = false,
      }))
    end,
    options = props.options,
    description = props.prefix .. "Fuzzily search in current buffer.",
  },
  {
    mode = { "n" },
    lhs = "<leader>\\",
    rhs = function()
      require("telescope.builtin").spell_suggest(require("telescope.themes").get_cursor({
        previewer = false,
        layout_config = {
          width = 50,
          height = 15,
        },
      }))
    end,
    options = props.options,
    description = props.prefix .. "Get suggestions for spelling.",
  },
})

return M
