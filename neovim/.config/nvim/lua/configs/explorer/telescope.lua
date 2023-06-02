---@diagnostic disable: undefined-global

local api = require("utils.api")

local M = {
  requires = {
    "telescope",
  },
}

function M.before()
  M.register_key()
end

function M.load()
  M.telescope.setup({
    defaults = {
      prompt_prefix = " ",
      selection_caret = "  ",
      entry_prefix = " ",
      multi_icon = " ",
      color_devicons = true,
      file_ignore_patterns = { "node_modules" },
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          mirror = false,
          prompt_position = "top",
          preview_width = 0.4,
        },
        vertical = { mirror = false },
        width = 0.8,
        height = 0.8,
        preview_cutoff = 80,
      },
    },
    pickers = {
      buffers = {
        mappings = {
          i = {
            ["<c-d>"] = "delete_buffer",
          },
          n = {
            ["dd"] = "delete_buffer",
          },
        },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
  })
end

function M.after()
  M.telescope.load_extension("fzf")

  vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*" },
    command = "normal zx",
  })
end

function M.register_key()
  api.maps.bulk_register({
    {
      mode = { "n" },
      lhs = "<leader><leader>",
      rhs = function()
        require("telescope.builtin").builtin()
      end,
      options = { noremap = true, silent = true },
      description = "Broswe trough all Telescope builtins.",
    },
    {
      mode = { "n" },
      lhs = "<leader>fk",
      rhs = function()
        require("telescope.builtin").keymaps()
      end,
      options = { noremap = true, silent = true },
      description = "Broswe trough all the registered mappings.",
    },
    {
      mode = { "n" },
      lhs = "<leader>ff",
      rhs = function()
        require("telescope.builtin").find_files()
      end,
      options = { noremap = true, silent = true },
      description = "Find files in the current workspace.",
    },
    {
      mode = { "n" },
      lhs = "<leader>lg",
      rhs = function()
        require("telescope.builtin").live_grep()
      end,
      options = { noremap = true, silent = true },
      description = "Find a string in the current workspace.",
    },
    {
      mode = { "n" },
      lhs = "<leader><Tab>",
      rhs = function()
        require("telescope.builtin").buffers()
      end,
      options = { noremap = true, silent = true },
      description = "Browse trough the open buffers.",
    },
    {
      mode = { "n" },
      lhs = "<leader>;",
      rhs = function()
        require("telescope.builtin").resume()
      end,
      options = { noremap = true, silent = true },
      description = "Resume to last open picker.",
    },
  })
end

return M
