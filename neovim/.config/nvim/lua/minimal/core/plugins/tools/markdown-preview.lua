local M = {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
}

function M.config()
  vim.g.mkdp_filetypes = { "markdown" }

  M.handlers.register_mappings()
end

M.handlers = {
  register_mappings = function()
    utils.base.mappings.bulk_register({
      {
        mode = { "n" },
        lhs = "<leader>sp",
        rhs = function()
          if utils.plugins.marp.is_marp() then
            utils.plugins.marp.start_server()
          else
            vim.cmd("MarkdownPreview")
          end
        end,
        description = "Start Preview.",
      },
      {
        mode = { "n" },
        lhs = "<leader>ep",
        rhs = function()
          if utils.plugins.marp.is_marp() then
            utils.plugins.marp.stop_server()
          else
            vim.cmd("MarkdownPreviewStop")
          end
        end,
        description = "End Preview.",
      },
    }, { options = { noremap = true, silent = true }, prefix = "Markdown: " })
  end,
}

return M
