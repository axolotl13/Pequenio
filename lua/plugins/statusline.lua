local heirline = require("heirline")
local conditions = require("heirline.conditions")
local utils = require("heirline.utils")
local navic = require("nvim-navic")
local icons = require("ui.icons")
local ui = require("ui.colors")

local gh = utils.get_highlight

local colors = {
  bg = gh(ui.colors.cursor).fg,
  fg = gh(ui.colors.cursor).bg,
  light = gh(ui.colors.light).fg,
  dark = gh(ui.colors.dark).bg,
  darker = gh(ui.colors.darker).bg,
  black = gh(ui.colors.black).bg,
  comment = gh(ui.colors.comment).fg,
  add = gh(ui.colors.add).fg,
  change = gh(ui.colors.change).fg,
  orange = gh(ui.colors.orange).fg,
  red = gh(ui.colors.red).fg,
  green = gh(ui.colors.green).fg,
  cyan = gh(ui.colors.cyan).fg,
  blue = gh(ui.colors.blue).fg,
  magenta = gh(ui.colors.magenta).fg,
  error = gh(ui.colors.error).fg
}

local Space = {provider = " "}
local Align = {provider = "%="}

local Git = {
  condition = conditions.is_git_repo,

  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
    self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0
                           or self.status_dict.changed ~= 0
  end,
  hl = {fg = colors.orange, bg = colors.black},
  Space,
  {
    provider = function(self)
      return icons.git.unmerged .. " " .. self.status_dict.head
    end,
    hl = {bold = true}
  },
  {
    condition = function(self)
      return self.has_changes
    end,
    provider = " "
  },
  {
    provider = function(self)
      local count = self.status_dict.added or 0
      return count > 0 and (icons.git.add .. " " .. count)
    end,
    hl = {fg = colors.add}
  },
  {
    provider = function(self)
      local count = self.status_dict.removed or 0
      return count > 0 and (" " .. icons.git.deleted .. " " .. count)
    end,
    hl = {fg = colors.red}
  },
  {
    provider = function(self)
      local count = self.status_dict.changed or 0
      return count > 0 and (" " .. icons.git.change .. count)
    end,
    hl = {fg = colors.change}
  },
  Space,
  {provider = icons.separator.right_fill, hl = {bg = colors.bg, fg = colors.black}}
}

local FileNameBlock = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,

  hl = {bg = colors.bg},
  Space
}

local FileIcon = {
  init = function(self)
    local filename = self.filename
    local extension = vim.fn.fnamemodify(filename, ":e")
    self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension,
                                                                             {default = true})
  end,

  provider = function(self)
    return self.icon and (self.icon .. " ")
  end,
  hl = function(self)
    return {fg = self.icon_color}
  end
}

local FileName = {
  provider = function(self)
    local filename = vim.fn.fnamemodify(self.filename, ":.")
    if filename == "" then return "No Name " end
    if not conditions.width_percent_below(#filename, 0.25) then
      filename = vim.fn.pathshorten(filename)
    end
    return filename .. " "
  end,
  hl = {fg = colors.blue}
}

local FileFlags = {
  {
    provider = function()
      if vim.bo.modified then return icons.statusline.edit .. " " end
    end,
    hl = {fg = colors.green}

  }, {
    provider = function()
      if (not vim.bo.modifiable) or vim.bo.readonly then
        return icons.statusline.readonly .. " "
      end
    end,
    hl = {fg = colors.error}
  }
}

local FileNameModifer = {
  hl = function()
    if vim.bo.modified then return {fg = colors.green, bold = true, force = true} end
  end
}

FileNameBlock = utils.insert(FileNameBlock, FileIcon, utils.insert(FileNameModifer, FileName),
                             unpack(FileFlags), {
  provider = icons.separator.right_fill,
  hl = {fg = colors.bg, bg = colors.dark}
})

local Diagnostics = {
  condition = conditions.has_diagnostics,

  static = {
    error_icon = vim.fn.sign_getdefined("DiagnosticSignError")[1].text,
    warn_icon = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text,
    info_icon = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text,
    hint_icon = vim.fn.sign_getdefined("DiagnosticSignHint")[1].text
  },

  init = function(self)
    self.errors = #vim.diagnostic.get(0, {severity = vim.diagnostic.severity.ERROR})
    self.warnings = #vim.diagnostic.get(0, {severity = vim.diagnostic.severity.WARN})
    self.hints = #vim.diagnostic.get(0, {severity = vim.diagnostic.severity.HINT})
    self.info = #vim.diagnostic.get(0, {severity = vim.diagnostic.severity.INFO})
  end,

  update = {"DiagnosticChanged", "BufEnter"},

  hl = {bg = colors.dark},
  Space,
  {
    provider = function(self)
      return self.errors > 0 and (self.error_icon .. self.errors .. " ")
    end,
    hl = {fg = colors.error}
  },
  {
    provider = function(self)
      return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
    end,
    hl = {fg = colors.orange}
  },
  {
    provider = function(self)
      return self.info > 0 and (self.info_icon .. self.info .. " ")
    end,
    hl = {fg = colors.fg}
  },
  {
    provider = function(self)
      return self.hints > 0 and (self.hint_icon .. self.hints)
    end,
    hl = {fg = colors.add}
  },
  Space
  -- {provider = icons.separator.right_fill, hl = {fg = colors.black, bg = colors.dark}}
}

local lsp_names = {["null-ls"] = "ok", sumneko_lua = "sumneko"}

local lsp_client_names = function()
  local clients = {}

  for _, client in pairs(vim.lsp.buf_get_clients(0)) do
    local name = lsp_names[client.name] or client.name
    clients[#clients + 1] = name
  end

  return table.concat(clients, " ")
end

local LSPActive = {
  hl = {fg = colors.add, bold = true},
  condition = conditions.lsp_attached,
  provider = function()
    return icons.statusline.lsp_client .. " " .. lsp_client_names()
  end,
  Space
}

local FileType = {
  hl = {fg = colors.cyan, bold = true},
  provider = function()
    return string.upper(vim.bo.filetype)
  end
}

local Shiftab = {
  hl = {fg = colors.comment},
  provider = function()
    return " " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
  end,
  Space
}

local FileFormat = {
  hl = {fg = colors.fg, bg = colors.darker},
  {provider = icons.separator.left_fill, hl = {fg = colors.darker, bg = colors.dark}},
  Space,
  {provider = vim.bo.fileformat, hl = {bg = colors.darker, bold = true}},
  Space
}

local FileEncoding = {
  hl = {fg = colors.fg, bg = colors.bg},
  {provider = icons.separator.left_fill, hl = {fg = colors.bg, bg = colors.darker}},
  Space,
  {
    provider = function()
      local enc = (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc
      return enc
    end
  },
  Space
}

local Ruler = {
  hl = {fg = colors.fg, bg = colors.black},
  {provider = icons.separator.left_fill, hl = {fg = colors.black, bg = colors.bg}},
  {provider = " " .. icons.statusline.line_number .. " %2l:%3L:%2c"},
  Space
}

local ScrollBar = {
  static = {sbar = icons.statusline.sbar2},
  provider = function(self)
    local curr_line = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_line_count(0)
    local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
    return string.rep(self.sbar[i], 2)
  end,
  hl = {fg = colors.comment, bg = colors.black}
}

local TerminalName = {
  provider = function()
    local tname, _ = vim.api.nvim_buf_get_name(0):gsub(".*:", "")
    return icons.kinds_icons.Number .. " " .. tname
  end,
  hl = {fg = colors.comment, bold = true}
}

local Navic = {condition = navic.is_available, provider = navic.get_location}
--[[ local Navic = {
  condition = navic.is_available,
  static = {
    type_hl = {
      File = "Directory",
      Module = "diffOldfile",
      Namespace = "TSNamespace",
      Package = "Include",
      Class = "Struct",
      Method = "Method",
      Property = "TSProperty",
      Field = "TSField",
      Constructor = "TSConstructor ",
      Enum = "TSField",
      Interface = "Type",
      Function = "Function",
      Variable = "TSVariable",
      Constant = "Constant",
      String = "String",
      Number = "Number",
      Boolean = "Boolean",
      Array = "TSField",
      Object = "Type",
      Key = "TSKeyword",
      Null = "Comment",
      EnumMember = "TSField",
      Struct = "Struct",
      Event = "Keyword",
      Operator = "Operator",
      TypeParameter = "Type"
    }
  },
  init = function(self)
    local data = navic.get_data() or {}
    local children = {}
    for i, d in ipairs(data) do
      local child = {
        {provider = d.icon, hl = self.type_hl[d.type]},
        {provider = d.name, hl = self.type_hl[d.type]}
      }
      if #data > 1 and i < #data then table.insert(child, {provider = " > "}) end
      table.insert(children, child)
    end
    self[1] = self:new(children, 1)
  end,
  hl = {fg = colors.fg}
} ]]

local Left = {Git, FileNameBlock, Diagnostics}

local Center = {Navic}

local Right = {LSPActive, Shiftab, FileFormat, FileEncoding, Ruler, ScrollBar}

local statusline = {Left, Align, Center, Align, Right}

local DefaultStatusline = {
  hl = {bg = colors.bg},
  Space,
  static = {
    mode_colors = {
      n = colors.green,
      i = colors.error,
      v = colors.cyan,
      V = colors.cyan,
      ["\22"] = colors.cyan,
      c = colors.orange,
      s = colors.magenta,
      S = colors.magenta,
      ["\19"] = colors.magenta,
      R = colors.orange,
      r = colors.orange,
      ["!"] = colors.red,
      t = colors.fg
    },
    mode_color = function(self)
      local mode = conditions.is_active() and vim.fn.mode() or "n"
      return self.mode_colors[mode]
    end
  },
  utils.surround({icons.separator.block, icons.separator.block}, function(self)
    return self:mode_color()
  end, {statusline, hl = {bg = colors.dark}}),
  Space
}

local SpecialStatusline = {
  condition = function()
    return conditions.buffer_matches({
      buftype = {"nofile", "prompt", "help", "quickfix"},
      filetype = {"^git.*", "fugitive"}
    })
  end,
  Space,
  FileType,
  Align
}

local TerminalStatusline = {
  condition = function()
    return conditions.buffer_matches({buftype = {"terminal"}, filetype = {"toggleterm"}})
  end,
  hl = {bg = colors.black},

  {condition = conditions.is_active},
  Space,
  TerminalName,
  Align
}

local InactiveStatusline = {
  condition = function()
    return not conditions.is_active()
  end,
  Space,
  FileType,
  Align
}

local Statusline = {
  hl = function()
    if conditions.is_active() then
      return "StatusLine"
    else
      return "StatusLineNC"
    end
  end,

  init = utils.pick_child_on_condition,

  SpecialStatusline,
  TerminalStatusline,
  InactiveStatusline,
  DefaultStatusline
}

heirline.setup(Statusline)
