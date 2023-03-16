local pCall = require("Utils.ProtectedCall")

local Telescope = pCall("telescope")

local Actions = require("telescope.actions")
local Sorters = require("telescope.sorters")
local Themes = require("telescope.themes")
local Previewers = require("telescope.previewers")

Telescope.setup({
  defaults = {
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
        prompt_position = "top",
        preview_width = 0.4,
      },
      vertical = { mirror = false },
      width = 0.8,
      height = 0.9,
      preview_cutoff = 80,
    },

    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    use_less = true,
    set_env = { ["COLORTERM"] = "truecolor" },
    path_display = { "truncate" },
    prompt_prefix = " 🔎 ",
    selection_caret = " ➤ ",
    entry_prefix = " ",

    mappings = {
      n = {
        ["h"] = Actions.select_horizontal,
        ["v"] = Actions.select_vertical,
      },
      i = {
        ["<A-h>"] = Actions.select_horizontal,
        ["<A-v>"] = Actions.select_vertical,
      },
    },

    file_ignore_patterns = {
      "__pycache__/",
      "__pycache__/*",

      "build/",
      "gradle/",
      "node_modules/",
      "node_modules/*",
      "obj/Debug",
      "smalljre_*/*",
      "target/",
      "vendor/*",
      "bin/Debug",
      "venv/",

      ".dart_tool/",
      ".git/",
      ".github/",
      ".gradle/",
      ".idea/",
      ".vscode/",

      "%.sqlite3",
      "%.ipynb",
      "%.lock",
      "%.pdb",
      "%.so",
      "%.dll",
      "%.class",
      "%.exe",
      "%.cache",
      "%.pdf",
      "%.dylib",
      "%.jar",
      "%.docx",
      "%.met",
      "%.burp",
      "%.mp4",
      "%.mkv",
      "%.rar",
      "%.zip",
      "%.7z",
      "%.tar",
      "%.bz2",
      "%.epub",
      "%.flac",
      "%.tar.gz",
    },

    preview = {
      msg_bg_fillchar = " ",
      treesitter = false,
    },

    live_grep = {
      preview = {
        treesitter = false,
      },
    },

    buffer_previewer_maker = Previewers.buffer_previewer_maker,
  },

  file_sorter = Sorters.get_fuzzy_file,
  generic_sorter = Sorters.get_generic_fuzzy_sorter,

  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },

    file_browser = {
      theme = "ivy",
      hijack_netrw = true,
    },

    ["ui-select"] = {
      Themes.get_dropdown({
        winblend = 0,
        layout_config = {
          prompt_position = "top",
          width = 64,
          height = 15,
        },
        border = {},
        previewer = false,
        shorten_path = false,
      }),
    },
  },
})

Telescope.load_extension("file_browser")
Telescope.load_extension("ui-select")

require("PluginsSettings.KeyBindings").TelescopeKeys()
