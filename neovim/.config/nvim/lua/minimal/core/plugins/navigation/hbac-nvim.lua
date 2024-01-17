local M = {
  "axkirillov/hbac.nvim",
  event = { "UIEnter" },
  opts = {},
  dependencies = {
    {
      "nvim-lualine/lualine.nvim",
      opts = {
        sections = {
          lualine_c = {
            {
              function()
                local cur_buf = vim.api.nvim_get_current_buf()
                return require("hbac.state").is_pinned(cur_buf) and "📍" or ""
              end,
              color = { fg = "#EF5F6B", gui = "bold" },
            },
          },
        },
      },
    },
  },
}

function M.config()
  require("hbac").setup({
    threshold = 3,
  })

  require("telescope").load_extension("hbac")

  M.helpers.regiter_mappings()
end

M.helpers = {
  custom_format = function(_, entry)
    local tail = vim.fs.basename(entry)
    local parent = vim.fs.dirname(entry)

    if parent == "." then
      return tail
    end

    return string.format("%s\t\t%s", tail, parent)
  end,
  regiter_mappings = function()
    utils.base.mappings.register({
      mode = { "n" },
      lhs = "<leader><Tab>",
      rhs = function()
        require("telescope").extensions.hbac.buffers({
          theme = "dropdown",
          previewer = true,
          prompt_title = " Buffers ",
          path_display = M.helpers.custom_format,
          layout_config = {
            width = 0.5,
            height = 0.4,
            prompt_position = "top",
            preview_cutoff = 120,
          },
        })
      end,
      options = { noremap = true, silent = true },
      description = "Telescope :: Buffers",
    })
  end,
}

return M
