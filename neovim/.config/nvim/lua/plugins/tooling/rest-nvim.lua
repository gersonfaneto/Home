return {
  "rest-nvim/rest.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = { "VeryLazy" },
  cond = function()
    local types = require("utils.types")

    return types.get_settings("http_tools")
  end,
  config = function()
    local base = require("utils.base")

    local rest_nvim = require("rest-nvim")

    rest_nvim.setup({
      result_split_horizontal = true,
      result_split_in_place = true,
      skip_ssl_verification = false,
      encode_url = true,
      highlight = {
        enabled = true,
        timeout = 150,
      },
      result = {
        show_url = true,
        show_curl_command = true,
        show_http_info = true,
        show_headers = true,
        formatters = {
          json = "jq",
          html = function(body)
            return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
          end,
        },
      },
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "http",
      callback = function()
        local buffer = tonumber(vim.fn.expand("<abuf>"), 10)

        base.mappings.bulk_register({
          {

            mode = "n",
            lhs = "<leader>hx",
            rhs = rest_nvim.run,
            options = { noremap = true, silent = true, buffer = buffer },
            description = "REST - Run request under cursor.",
          },
          {

            mode = "n",
            lhs = "<leader>hl",
            rhs = rest_nvim.last,
            options = { noremap = true, silent = true, buffer = buffer },
            description = "REST - Run last request.",
          },
          {

            mode = "n",
            lhs = "<leader>hp",
            rhs = function()
              rest_nvim.run(true)
            end,
            options = { noremap = true, silent = true, buffer = buffer },
            description = "REST - Preview request under cursor.",
          },
        })
      end,
    })
  end,
}
