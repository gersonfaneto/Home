local M = {
  "folke/trouble.nvim",
  cmd = {
    "Trouble",
    "TroubleClose",
    "TroubleToggle",
    "TroubleRefresh",
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope.nvim",
  },
}

function M.config()
  local trouble = require("trouble")
  local telescope = require("telescope")

  trouble.setup({
    mode = "quickfix",
  })

  telescope.setup({
    defaults = {
      mappings = {
        n = {
          ["<C-q>"] = trouble.smart_open_with_trouble,
        },
        i = {
          ["<C-q>"] = trouble.smart_open_with_trouble,
        },
      },
    },
  })
end

utils.base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>xx",
    rhs = ":TroubleToggle<CR>",
    description = "Toggle.",
  },
  {
    mode = { "n" },
    lhs = "<leader>xw",
    rhs = ":TroubleToggle workspace_diagnostics<CR>",
    description = "Browse workspace diagnostics.",
  },
  {
    mode = { "n" },
    lhs = "<leader>xd",
    rhs = ":TroubleToggle document_diagnostics<CR>",
    description = "Browse document diagnostics.",
  },
  {
    mode = { "n" },
    lhs = "<leader>xq",
    rhs = ":TroubleToggle quickfix<CR>",
    description = "Browse quick fix list.",
  },
  {
    mode = { "n" },
    lhs = "<leader>xl",
    rhs = ":TroubleToggle loclist<CR>",
    description = "Browse location list.",
  },
  {
    mode = { "n" },
    lhs = "<leader>xr",
    rhs = ":TroubleToggle lsp_references<CR>",
    description = "Browse LSP references.",
  },
  {
    mode = { "n" },
    lhs = "]t",
    rhs = function()
      require("trouble").next({
        skip_groups = true,
        jump = true,
      })
    end,
    description = "Foward.",
  },
  {
    mode = { "n" },
    lhs = "[t",
    rhs = function()
      require("trouble").previous({
        skip_groups = true,
        jump = true,
      })
    end,
    description = "Backwards.",
  },
  {
    mode = { "n" },
    lhs = "[T",
    rhs = function()
      require("trouble").first({
        skip_groups = true,
        jump = true,
      })
    end,
    description = "First.",
  },
  {
    mode = { "n" },
    lhs = "]T",
    rhs = function()
      require("trouble").last({
        skip_groups = true,
        jump = true,
      })
    end,
    description = "Last.",
  },
}, { options = { silent = true, noremap = true }, prefix = "Trouble: " })

return M
