local opts = { buffer = nil, silent = true, noremap = true }

local mappings = require("utils.api").mappings

local M = {}

mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>rj",
    rhs = ":lua require('rust-tools').join_lines.join_lines()<CR>",
    options = opts,
    description = "Rust - Join Lines.",
  },
  {
    mode = { "n" },
    lhs = "<leader>rr",
    rhs = ":RustRunnables<CR>",
    options = opts,
    description = "Rust - Runnables",
  },
  {
    mode = { "n" },
    lhs = "<leader>ha",
    rhs = ":RustHoverAction<CR>",
    options = opts,
    description = "Rust - Hover Action.",
  },
  {
    mode = { "n" },
    lhs = "<leader>ro",
    rhs = ":RustOpenCargo<CR>",
    options = opts,
    description = "Rust - Open Cargo.",
  },
  {
    mode = { "n" },
    lhs = "<leader>rw",
    rhs = ":lua require('rust-tools/workspace_refresh')._reload_workspace_from_cargo_toml()<CR>",
    options = opts,
    description = "Rust - Reload Workspace.",
  },
  {
    mode = { "n" },
    lhs = "<leader>uc",
    rhs = function()
      require("crates").upgrade_all_crates()
    end,
    options = opts,
    description = "Rust - Upgrade Crates.",
  },
})

return M
