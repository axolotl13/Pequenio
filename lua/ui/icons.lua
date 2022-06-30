local icons = {
  default = "",
  prefix = "",
  symlink = "",
  symlink_arrow = "  ",
  -- border = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
  border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"},
  folder = {
    -- arrow_closed = "",
    -- arrow_open = "",
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
    symlink_open = "",
  },
  git = {
    add = "",
    change = "柳",
    unstaged = "✗",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = "",
    deleted = "",
    ignored = "◌",
  },
  signs = {
    add = "┃", -- ┃ │
    -- delete = "━",
    -- top_delete = "🭶",
    -- change_delete = "═",
  },
  diagnostics = {
    hint = "", -- 
    info = "", -- 
    -- warning = "",
    -- error = "", 
  },
  buffer = {
    indicator = " ", -- ▎
    tab_close = "",
    modified = "●",
    close = "",
    left = "",
    right = "",
  },
  lsp = {
    install = "",
    uninstall = "ﮊ",
    pending = "",
  },
  statusline = {
    edit = "",
    readonly = "",
    line_number = "",
    line_percent = "",
    lsp_client = "",
    sbar = {"▁", "▂", "▃", "▄", "▅", "▆", "▇", "█"},
    sbar2 = { '🭶', '🭷', '🭸', '🭹', '🭺', '🭻' }
  },
  os = {
    linux = "", -- 
    macos = "",
    windows = "",
  },
  kinds_icons = {
    Array = "",
    Boolean = "",
    Class = "",
    Color = "",
    Constant = "",
    Constructor = "",
    Enum = "練",
    EnumMember = "",
    Event = "🗲",
    Field = "",
    File = "",
    Folder = "",
    Function = "",
    Interface = "ﰮ",
    Keyword = "",
    Null = "ﳠ",
    Namespace = "",
    Number = "",
    Method = "",
    Module = "",
    Object = "",
    Operator = "",
    Package = "ﰪ",
    Property = "",
    Reference = "",
    Snippet = "",
    String = "",
    Struct = "פּ",
    Text = "",
    TypeParameter = "",
    Unit = "",
    Value = "",
    Variable = ""
  },
  separator = {
    left = "",
    right = "",
    block = "█",
    block2 = "▓",
    block3 = "▒",
    block4 = "░",
    left_fill = "",
    right_fill = "",
    slant_left = "",
    slant_right = "",
    slant_right2 = "",
    slant_left2 = "",
    left_round = "",
    right_round = "",
    left_roundt = "",
    right_roundt = "",
  }
}

return icons
