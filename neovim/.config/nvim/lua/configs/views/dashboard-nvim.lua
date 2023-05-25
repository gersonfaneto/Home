local api = require("utils.api")

local M = {
  requires = {
    "dashboard",
  },
}

function M.before()
  M.register_key()
end

function M.load()
  M.dashboard.custom_header = {
    "                                                              ",
    "                                                              ",
    "                                                              ",
    "                                                              ",
    "                                                              ",
    "    ⢀⣀⣤⣤⣤⠤⢤⣤⣤⣤⣤⣄⣀⡀           ⢀⣠⣤⣄⡀            ⣀⣀⣀⣤⣤⣤⣤⣤⣤⣤⣤⣀⡀   ",
    " ⢀⣤⠚⠩⠁⡄ ⠠⣤⠒⠒⣂ ⢈⣨⣭⣿⠛⠶⣦⣤⣄⡀   ⢠⣾⡟⠉⠉⠝⠿⠇    ⢀⣠⡤⠔⠒⣻⠟⠋⠩⠉⢁⣀⡀  ⣶  ⠙⡛⠷  ",
    " ⠸⢟⡠⠒⢊⡤  ⠋⣠ ⠈⣉⣉⣉⣉⣀⣛⣿⡒⠭⡿⢿⣷⣤⣤⣀⣽⣇⣴⠆⣴⡃⢀⣠⣤⠴⣚⣫⡥ ⠒⠛⠁⣀⣉⣉⣙⢏⡉  ⢀⣼⣤⣜⠳⡦⠂  ",
    "   ⠐⠚⠫⣤⠖⢣⣤⡕ ⠉⣩⣤⠔ ⠂⣋⣭⣥⣤⠴⠛⣛⠈⢩⣿⠿⠛⢉  ⡐⠞⠫⢍⠙⣓⠢⠴⣥⣍⣙⠛⢓⡢⢤⣬⠉⠅ ⣤⡜⢛⠻⠛⠉⠁   ",
    "      ⠘⢔⢎⣡⡔⠂⣠⡿⠁⠒⢛⡻⢛⣩⠅  ⠉  ⠚⣯⣄⢠⣿⢀⣾⠇ ⠓ ⠁⠂⠈⠍⠐⠈⡉⣿⠛⣛⠛⠉⣤⣰⣿⣿⡟⠛⠁      ",
    "        ⠙⠛⠐⠚⠋ ⠒⣲⡿⠇⣋        ⢺⡏⠈⣀ ⠉⠈        ⠙⢿⠟⢰⣖⡢ ⠂⠒⠚⠉         ",
    "             ⣴⠛⠅⢀⣾⠟⢃       ⢹⠃⠠⠁⠈⠩         ⢠⣿ ⣀⢹⣿⡷             ",
    "             ⢿⣤⢚⣫⠅         ⢸⠇ ⢚ ⢀         ⣸⡇ ⠉⣿⣿⠇             ",
    "             ⠈⠛⢻⣥⡚⠔⣠⢣⣄⡀    ⢸⡇ ⢘ ⠈ ⠠⠈    ⣀⣰⡿⣧⣄⠾⠋⠁              ",
    "                ⠈⠑⠁        ⠘⣿⡀⣈⣀    ⠈  ⠈⠙⠁                    ",
    "                            ⠘⣷⠁                               ",
    "                             ⠙⣤                               ",
    "                              ⠛⠂                              ",
    "                                                              ",
    "                                                              ",
    "                                                              ",
  }

  M.dashboard.custom_center = {
    {
      icon = " ",
      desc = "        New File        ",
      action = "DashboardNewFile",
      shortcut = "  ",
    },
    {
      icon = " ",
      desc = "       Browse File      ",
      action = "Explore",
      shortcut = "  ",
    },
    {
      icon = " ",
      desc = "        Find File       ",
      action = "Telescope find_files",
      shortcut = "  ",
    },
    {
      icon = " ",
      desc = "       Exit Neovim      ",
      action = "quit",
      shortcut = "  ",
    },
  }

  M.dashboard.custom_footer = {
    " ",
  }
end

function M.after() end

function M.register_key()
  api.maps.bulk_register({
    {
      mode = { "n" },
      lhs = "<leader>o",
      rhs = ":DashboardNewFile<CR>",
      options = { noremap = true, silent = true },
      description = "open a new empty buffer.",
    },
    {
      mode = { "n" },
      lhs = "<leader>m",
      rhs = ":Dashboard<CR>",
      options = { noremap = true, silent = true },
      description = "Back to home.",
    },
  })
end

return M
