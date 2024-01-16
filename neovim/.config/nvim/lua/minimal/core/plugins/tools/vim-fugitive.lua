local M = {
  "tpope/vim-fugitive",
  cmd = {
    "G",
    "Git",
    "GBrowse",
  },
  dependencies = {
    "tpope/vim-rhubarb",
  },
}

function M.init()
  M.helpers.register_mappings()
  M.helpers.register_autocmds()
end

M.helpers = {
  register_mappings = function()
    utils.base.mappings.bulk_register({
      {
        mode = { "n" },
        lhs = "<leader>gg",
        rhs = ":Git<CR>",
        description = "Open Fugitive.",
      },
      {
        mode = { "n", "x" },
        lhs = "<leader>gb",
        rhs = ":GBrowse<CR>",
        description = "Open File/Selection in Browser.",
      },
    }, { prefix = "Fugitive: ", options = { silent = true, noremap = true } })
  end,
  register_autocmds = function()
    vim.api.nvim_create_autocmd("BufWinEnter", {
      group = vim.api.nvim_create_augroup("FugitiveMappings", {}),
      pattern = "*",
      callback = function()
        if vim.bo.ft ~= "fugitive" then
          return
        end

        local bufnr = vim.api.nvim_get_current_buf()

        utils.base.mappings.bulk_register({
          {
            mode = { "n" },
            lhs = "<leader>p",
            rhs = ":Git push<CR>",
            description = "Push.",
          },
          {
            mode = { "n" },
            lhs = "<leader>P",
            rhs = ":Git pull --rebase<CR>",
            description = "Pull.",
          },
          {
            mode = { "n" },
            lhs = "<leader>t",
            rhs = ":Git push -u origin ",
            description = "Push with tracking.",
          },
        }, { prefix = "Fugitive: ", options = { buffer = bufnr, silent = true, noremap = true } })
      end,
    })
  end,
}

return M
