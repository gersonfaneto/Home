return {
  "dnlhc/glance.nvim",
  event = { "LspAttach" },
  config = function()
    local glance = require("glance")

    glance.setup({
      hooks = {
        before_open = function(results, open, jump, _)
          if #results == 1 then
            jump(results[1])
          else
            open(results)
          end
        end,
      },
    })
  end,
}
