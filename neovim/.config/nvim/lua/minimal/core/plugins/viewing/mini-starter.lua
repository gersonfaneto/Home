local M = {
  "echasnovski/mini.starter",
  event = { "VimEnter" },
}

function M.config()
  local starter = require("mini.starter")

  starter.setup({
    autoopen = true,
    evaluate_single = true,
    silent = true,
    header = ""
        .. "Experience is the name everyone gives to their mistakes.\n"
        .. "                                         -- Oscar Wilde",
    footer = "",
    query_updaters = "abcdefghijklmnopqrstuvwxyz0123456789.",
    content_hooks = {
      starter.gen_hook.adding_bullet(),
      starter.gen_hook.aligning("center", "center"),
    },
    items = {
      --- Files...
      {
        name = "New File",
        action = "BufferCreate",
        section = "Files",
      },
      {
        name = "File Browser",
        action = "Oil --float",
        section = "Files",
      },
      {
        name = "Recent Files",
        action = "Telescope oldfiles",
        section = "Files",
      },
      {
        name = "Find Files",
        action = function()
          require("telescope.builtin").find_files({
            no_ignore = true,
          })
        end,
        section = "Files",
      },
      --- Search...
      {
        name = "Search Text",
        action = "Telescope live_grep",
        section = "Search",
      },
      --- Notes...
      {
        name = "Notes",
        action = function()
          require("telescope.builtin").find_files({
            no_ignore = true,
            prompt_title = " Notes ",
            cwd = "$HOME/Notes",
          })
        end,
        section = "Notes",
      },
      {
        name = "TODOs",
        action = "e $HOME/Notes/TODO.norg",
        section = "Notes",
      },
      {
        name = "New Note",
        action = "NewNote",
        section = "Notes",
      },
      -- Exit...
      {
        name = "Exit",
        action = "qa",
        section = "Exit",
      },
    },
  })
end

utils.base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "M",
    rhs = ":lua require('mini.starter').open()<CR>",
    description = "Open.",
  },
}, { options = { silent = true, noremap = true }, prefix = "Mini Starter: " })

return M
