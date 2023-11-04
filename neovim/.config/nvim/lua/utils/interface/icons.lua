local M = {}

local icons = {
  kind = {
    Array = "",
    Boolean = "",
    Class = "",
    Color = "",
    Constant = "",
    Constructor = "",
    Enum = "",
    EnumMember = "",
    Event = "",
    Field = "",
    File = "",
    Folder = "",
    Function = "",
    Interface = "",
    Key = "",
    Keyword = "",
    Method = "",
    Module = "",
    Namespace = "",
    Null = "ﳠ",
    Number = "",
    Object = "",
    Operator = "",
    Package = "",
    Property = "",
    Reference = "",
    Snippet = "",
    String = "",
    Struct = "",
    Text = "",
    TypeParameter = "",
    Unit = "",
    Value = "",
    Variable = "",
  },

  git = {
    LineAdded = "",
    LineModified = "",
    LineRemoved = "",
    FileDeleted = "",
    FileIgnored = "◌",
    FileRenamed = "",
    FileStaged = "S",
    FileUnmerged = "",
    FileUnstaged = "",
    FileUntracked = "U",
    Diff = "",
    Repo = "",
    Octoface = "",
    Branch = "",
  },

  ui = {
    ArrowCircleDown = "",
    ArrowCircleLeft = "",
    ArrowCircleRight = "",
    ArrowCircleUp = "",
    BoldArrowDown = "",
    BoldArrowLeft = "",
    BoldArrowRight = "",
    BoldArrowUp = "",
    BoldClose = "",
    BoldDividerLeft = "",
    BoldDividerRight = "",
    BoldLineLeft = "▎",
    BookMark = "",
    BoxChecked = "",
    Bug = "",
    Stacks = "",
    Scopes = "",
    Watches = "",
    DebugConsole = "",
    Calendar = "",
    Check = "",
    ChevronRight = ">",
    ChevronShortDown = "",
    ChevronShortLeft = "",
    ChevronShortRight = "",
    ChevronShortUp = "",
    Circle = "",
    Close = "",
    CloudDownload = "",
    Code = "",
    Comment = "",
    Dashboard = "",
    DividerLeft = "",
    DividerRight = "",
    DoubleChevronRight = "»",
    Ellipsis = "",
    EmptyFolder = "",
    EmptyFolderOpen = "",
    File = "",
    FileSymlink = "",
    Files = "",
    FindFile = "",
    FindText = "",
    Fire = "",
    Folder = "",
    FolderOpen = "",
    FolderSymlink = "",
    Forward = "",
    Gear = "",
    History = "",
    Lightbulb = "",
    LineLeft = "▏",
    LineMiddle = "│",
    List = "",
    Lock = "",
    NewFile = "",
    Note = "",
    Package = "",
    Pencil = "",
    Plus = "",
    Project = "",
    Search = "",
    SignIn = "",
    SignOut = "",
    Tab = "",
    Table = "",
    Target = "󰀘",
    Telescope = "",
    Text = "",
    Tree = "",
    Triangle = "契",
    TriangleShortArrowDown = "",
    TriangleShortArrowLeft = "",
    TriangleShortArrowRight = "",
    TriangleShortArrowUp = "",
  },

  diagnostics = {
    BoldError = "",
    Error = "",
    BoldWarning = "",
    Warning = "",
    BoldInformation = "",
    Information = "",
    BoldQuestion = "",
    Question = "",
    BoldHint = "",
    Hint = "",
    Debug = "",
    Trace = "✎",
  },

  misc = {
    Robot = "ﮧ",
    Squirrel = "",
    Tag = "",
    Watch = "",
    Smiley = "",
    Package = "",
    CircuitBoard = "",
  },
}

-- Returns a table of a given icon category.
-- @param category string The category of the desired icons.
--- @return table icons The sub table of the given category.
M.get_icons = function(category)
  local table = vim.tbl_get(icons, category)

  if table == nil then
    return {}
  end

  return table
end

-- Returns an icon given it's name and category.
--- @param category string The category of the desired icon.
--- @param name string The name of the desired icon.
--- @return string icon The requested icon.
M.get_icon = function(category, name)
  local table = M.get_icons(category)

  if vim.tbl_isempty(table) then
    return ""
  end

  local icon = vim.tbl_get(table, name)

  if icon == nil then
    return ""
  end

  return icon
end

--- Get a specific icon group.
--- @param category "kind"|"git"|"ui"|"diagnostics"|"misc"
--- @param add_space? boolean Add a trailing space after the icon.
function M.get(category, add_space)
  if add_space then
    return setmetatable({}, {
      __index = function(_, key)
        return icons[category][key] .. " "
      end,
    })
  else
    return icons[category]
  end
end

return M
