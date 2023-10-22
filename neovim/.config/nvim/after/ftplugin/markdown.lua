local jobid = 0

local function start_server()
  if vim.fn.executable("marp") ~= 1 then
    print("Marp: Marp CLI executable not found.")
    return
  end

  if jobid ~= 0 then
    vim.fn.jobstop(jobid)
    return
  end

  local port = os.getenv("PORT")
  if port == nil then
    port = "8005"
    vim.fn.setenv("PORT", port)
  end

  print("Marp: Started server on http://localhost:" .. port .. ".")
  jobid = vim.fn.jobstart({ "marp", "--server", "--preview", "--html", vim.fn.getcwd() }, {
    on_exit = function(_, code)
      jobid = 0
      if code ~= 143 then
        print("marp: exit", code)
      end
    end,
  })
end

local function stop_server()
  vim.fn.jobstop(jobid)
  jobid = 0
  print("Marp: Server stopped.")
end

vim.api.nvim_create_user_command("MarpStartServer", start_server, {})
vim.api.nvim_create_user_command("MarpStopServer", stop_server, {})

local base = require("utils.base")

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>sm",
    rhs = ":MarpStartServer<CR>",
    options = { noremap = true, silent = true },
    description = "Marp: Start server.",
  },
  {
    mode = { "n" },
    lhs = "<leader>Sm",
    rhs = ":MarpStopServer<CR>",
    options = { noremap = true, silent = true },
    description = "Marp: Stop server.",
  },
})

return M
