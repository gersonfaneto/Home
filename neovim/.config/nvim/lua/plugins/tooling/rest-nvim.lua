return {
  "rest-nvim/rest.nvim",
  commit = "8b62563",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = { "VeryLazy" },
  cond = function()
    local types = require("utils.types")

    return types.get_settings("http_tools")
  end,
  config = function()
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
  end,
}
