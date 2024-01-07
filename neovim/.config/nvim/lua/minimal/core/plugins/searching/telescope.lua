local M = {
  "nvim-telescope/telescope.nvim",
  cmd = { "Telescope" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "jvgrootveld/telescope-zoxide",
  },
}

function M.config()
  local telescope = require("telescope")

  local actions = require("telescope.actions")

  telescope.setup({
    defaults = {
      previewer = false,
      prompt_prefix = "   ",
      file_ignore_patterns = { "node_modules", "package-lock.json" },
      initial_mode = "insert",
      select_strategy = "reset",
      sorting_strategy = "ascending",
      layout_config = {
        prompt_position = "top",
        preview_cutoff = 120,
      },
      mappings = {
        n = {
          ["<C-d>"] = actions.delete_buffer,
        },
        i = {
          ["<C-d>"] = actions.delete_buffer,
        },
      },
    },
    pickers = {
      find_files = {
        theme = "dropdown",
        previewer = false,
        layout_config = {
          width = 0.5,
          height = 0.4,
          prompt_position = "top",
          preview_cutoff = 120,
        },
      },
      git_files = {
        previewer = false,
        theme = "dropdown",
        layout_config = {
          width = 0.5,
          height = 0.4,
          prompt_position = "top",
          preview_cutoff = 120,
        },
      },
      buffers = {
        previewer = false,
        theme = "dropdown",
        layout_config = {
          width = 0.5,
          height = 0.4,
          prompt_position = "top",
          preview_cutoff = 120,
        },
      },
      live_grep = {
        only_sort_text = true,
        previewer = true,
        layout_config = {
          horizontal = {
            width = 0.9,
            height = 0.75,
            preview_width = 0.6,
          },
        },
      },
      grep_string = {
        only_sort_text = true,
        previewer = true,
        layout_config = {
          horizontal = {
            width = 0.9,
            height = 0.75,
            preview_width = 0.6,
          },
        },
      },
      lsp_references = {
        show_line = false,
        previewer = true,
        layout_config = {
          horizontal = {
            width = 0.9,
            height = 0.75,
            preview_width = 0.6,
          },
        },
      },
      treesitter = {
        show_line = false,
        previewer = true,
        layout_config = {
          horizontal = {
            width = 0.9,
            height = 0.75,
            preview_width = 0.6,
          },
        },
      },
    },
    extensions = {},
  })

  telescope.load_extension("zoxide")
end

utils.base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>fb",
    rhs = function()
      require("telescope.builtin").builtin()
    end,
    description = "Browse trough all Telescope builtins.",
  },
  {
    mode = { "n" },
    lhs = "<leader>fk",
    rhs = function()
      require("telescope.builtin").keymaps()
    end,
    description = "Browse trough all the registered mappings.",
  },
  {
    mode = { "n" },
    lhs = "<leader>fh",
    rhs = function()
      require("telescope.builtin").help_tags()
    end,
    description = "Browse through all the Help tags.",
  },
  {
    mode = { "n" },
    lhs = "<leader>ff",
    rhs = function()
      require("telescope.builtin").find_files({
        -- This will include .gitignore files in the search results.
        no_ignore = true,
      })
    end,
    description = "Find files in the current directory.",
  },
  {
    mode = { "n" },
    lhs = "<leader>fp",
    rhs = function()
      local was_called, _ = pcall(require("telescope.builtin").git_files)

      if not was_called then
        require("telescope.builtin").find_files()
      end
    end,
    description = "Find files in the current project.",
  },
  {
    mode = { "n" },
    lhs = "<leader>fr",
    rhs = function()
      require("telescope.builtin").oldfiles()
    end,
    description = "Find recent opened files.",
  },
  {
    mode = { "n" },
    lhs = "<leader>fn",
    rhs = function()
      require("telescope.builtin").find_files({
        no_ignore = true,
        prompt_title = " Notes ",
        cwd = "$HOME/Notes",
      })
    end,
    description = "Browse through the Notes.",
  },
  {
    mode = { "n" },
    lhs = "<leader>lg",
    rhs = function()
      require("telescope.builtin").live_grep()
    end,
    description = "Find matching strings in the current workspace.",
  },
  {
    mode = { "n" },
    lhs = "<leader>zl",
    rhs = function()
      require("telescope").extensions.zoxide.list()
    end,
    description = "Jump to directories using zoxide.",
  },
  {
    mode = { "n" },
    lhs = "<leader><Tab>",
    rhs = function()
      require("telescope.builtin").buffers()
    end,
    description = "Browse trough the open buffers.",
  },
  {
    mode = { "n" },
    lhs = "<leader>;",
    rhs = function()
      require("telescope.builtin").resume()
    end,
    description = "Resume to last open picker.",
  },
  {
    mode = { "n" },
    lhs = "<leader>/",
    rhs = function()
      require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        previewer = false,
      }))
    end,
    description = "Fuzzily search in current buffer.",
  },
  {
    mode = { "n" },
    lhs = "<leader>sm",
    rhs = function()
      require("telescope.builtin").spell_suggest(require("telescope.themes").get_cursor({
        previewer = false,
        layout_config = {
          width = 50,
          height = 15,
        },
      }))
    end,
    description = "Browse through the spell suggestions.",
  },
}, { options = { noremap = true, silent = true }, prefix = "Telescope: " })

return M
