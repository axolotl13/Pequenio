local ok, u = pcall(require, "core.functions")
if not ok then return end

local M = {}

M.colors = {
  cursor = "Cursor",
  black = "ColorColumn",
  darker = "CursorColumn",
  dark = "NormalFloat",
  comment = "Comment",
  light = "ModeMsg",
  error = "Error",
  green = "String",
  magenta = "Identifier",
  red = "diffRemoved",
  add = "diffAdded",
  change = "diffChanged",
  orange = "Constant",
  cyan = "Keyword",
  blue = "Directory"
}

M.ccolors = {
  bg = u.get_highlight(M.colors.cursor).fg,
  fg = u.get_highlight(M.colors.cursor).bg,
  dark = u.get_highlight(M.colors.dark).bg,
  black = u.get_highlight(M.colors.black).bg,
  error= u.get_highlight(M.colors.error).fg,
  comment = u.get_highlight(M.colors.comment).fg
}

M.bufferline = {
  fill = {
    guibg = {attribute = "bg", highlight = M.colors.dark},
    guifg = {attribute = "fg", highlight = M.colors.cursor}
  },
  background = {
    guibg = {attribute = "bg", highlight = M.colors.dark},
    guifg = {attribute = "fg", highlight = M.colors.comment}
  },
  tab = {
    guibg = {attribute = "bg", highlight = M.colors.dark},
    guifg = {attribute = "fg", highlight = M.colors.comment}
  },
  tab_selected = {
    guibg = {attribute = "bg", highlight = M.colors.dark},
    guifg = {attribute = "bg", highlight = M.colors.cursor}
  },
  tab_close = {
    guibg = {attribute = "bg", highlight = M.colors.dark},
    guifg = {attribute = "fg", highlight = M.colors.error}
  },
  buffer_selected = {
    guibg = {attribute = "fg", highlight = M.colors.cursor},
    guifg = {attribute = "bg", highlight = M.colors.cursor},
    gui = "bold"
  },
  buffer_visible = {
    guibg = {attribute = "bg", highlight = M.colors.dark},
    guifg = {attribute = "fg", highlight = M.colors.comment}
  },
  close_button = {
    guibg = {attribute = "bg", highlight = M.colors.dark},
    guifg = {attribute = "fg", highlight = M.colors.comment}
  },
  close_button_visible = {
    guibg = {attribute = "bg", highlight = M.colors.dark},
    guifg = {attribute = "fg", highlight = M.colors.comment}
  },
  close_button_selected = {
    guibg = {attribute = "fg", highlight = M.colors.cursor},
    guifg = {attribute = "fg", highlight = M.colors.error}
  },
  indicator_selected = {
    guibg = {attribute = "fg", highlight = M.colors.cursor},
    guifg = {attribute = "bg", highlight = M.colors.cursor}
  },
  modified = {
    guibg = {attribute = "bg", highlight = M.colors.dark},
    guifg = {attribute = "fg", highlight = M.colors.green}
  },
  modified_visible = {
    guibg = {attribute = "bg", highlight = M.colors.dark},
    guifg = {attribute = "fg", highlight = M.colors.green}
  },
  modified_selected = {
    guibg = {attribute = "fg", highlight = M.colors.cursor},
    guifg = {attribute = "fg", highlight = M.colors.green}
  },
  separator = {
    guibg = {attribute = "bg", highlight = M.colors.dark},
    guifg = {attribute = "bg", highlight = M.colors.dark}
  },
  separator_visible = {
    guibg = {attribute = "bg", highlight = M.colors.dark},
    guifg = {attribute = "bg", highlight = M.colors.dark}
  },
  separator_selected = {
    guibg = {attribute = "bg", highlight = M.colors.dark},
    guifg = {attribute = "bg", highlight = M.colors.dark}
  },
  pick = {
    guibg = {attribute = "bg", highlight = M.colors.dark},
    guifg = {attribute = "fg", highlight = M.colors.error}
  },
  pick_visible = {
    guibg = {attribute = "bg", highlight = M.colors.dark},
    guifg = {attribute = "fg", highlight = M.colors.error}
  },
  pick_selected = {
    guibg = {attribute = "fg", highlight = M.colors.cursor},
    guifg = {attribute = "fg", highlight = M.colors.error}
  },
  duplicate = {
    guibg = {attribute = "bg", highlight = M.colors.dark},
    guifg = {attribute = "fg", highlight = M.colors.comment},
    gui = "italic"
  }
}

-- M.notify = {
--   M.set("NotifyINFOBorder", {fg = M.colors.green}),
--   M.set("NotifyINFOTitle", { fg = M.colors.green }),
--   M.set("NotifyINFOIcon", { fg = M.colors.green }),
--   M.set("NotifyERRORBorder", { fg = "red" }),
--   M.set("NotifyERRORIcon", { fg = "blue" }),
--   M.set("NotifyERRORTitle", { fg = "black" }),
--   M.set("NotifyWARNBorder", { fg = "red" }),
--   M.set("NotifyWARNIcon", { fg = "white" }),
--   M.set("NotifyWARNTitle", { fg = "red" }),
-- }

M.telescope = {
  u.set("TelescopeBorder", {fg = M.ccolors.dark, bg = M.ccolors.dark}),
  u.set("TelescopePromptBorder", {fg = M.ccolors.black, bg = M.ccolors.black}),
  u.set("TelescopePromptNormal", {fg = M.ccolors.fg, bg = M.ccolors.black}),
  u.set("TelescopePromptPrefix", {fg = M.ccolors.error, bg = M.ccolors.black}),
  u.set("TelescopeNormal", {fg = M.ccolors.fg, bg = M.ccolors.dark}),
  u.set("TelescopePreviewTitle", {fg = M.ccolors.dark, bg = M.ccolors.dark}),
  u.set("TelescopePromptTitle", {fg = M.ccolors.black, bg = M.ccolors.black}),
  u.set("TelescopeResultsTitle", {fg = M.ccolors.dark, bg = M.ccolors.dark}),
  u.set("TelescopeSelection", {fg = M.ccolors.fg, bg = M.ccolors.comment})
}

return M
