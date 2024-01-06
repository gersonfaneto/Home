local M = {}

utils.base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>co",
    rhs = ":lua require('crates').show_popup()<CR>",
    description = "Show popup.",
  },
  {
    mode = { "n" },
    lhs = "<leader>cr",
    rhs = ":lua require('crates').reload()<CR>",
    description = "Reload.",
  },
  {
    mode = { "n" },
    lhs = "<leader>cv",
    rhs = ":lua require('crates').show_versions_popup()<CR>",
    description = "Show versions.",
  },
  {
    mode = { "n" },
    lhs = "<leader>cf",
    rhs = ":lua require('crates').show_features_popup()<CR>",
    description = "Show features.",
  },
  {
    mode = { "n" },
    lhs = "<leader>cu",
    rhs = ":lua require('crates').update_crate()<CR>",
    description = "Update crate.",
  },
  {
    mode = { "n" },
    lhs = "<leader>cU",
    rhs = ":lua require('crates').update_all_crates()<CR>",
    description = "Update all crates.",
  },
  {
    mode = { "n" },
    lhs = "<leader>ca",
    rhs = ":lua require('crates').upgrade_crate()<CR>",
    description = "Upgrade crate.",
  },
  {
    mode = { "n" },
    lhs = "<leader>cA",
    rhs = ":lua require('crates').upgrade_all_crates()<CR>",
    description = "Upgrade all crates.",
  },
  {
    mode = { "n" },
    lhs = "<leader>cH",
    rhs = ":lua require('crates').open_homepage()<CR>",
    description = "Open Homepage.",
  },
  {
    mode = { "n" },
    lhs = "<leader>cR",
    rhs = ":lua require('crates').open_repository()<CR>",
    description = "Open Repository.",
  },
  {
    mode = { "n" },
    lhs = "<leader>cD",
    rhs = ":lua require('crates').open_documentation()<CR>",
    description = "Open Documentation.",
  },
  {
    mode = { "n" },
    lhs = "<leader>cC",
    rhs = ":lua require('crates').open_crates_io()<CR>",
    description = "Open Registry.",
  },
}, { prefix = "Crates: ", options = { silent = true, noremap = true } })

return M
