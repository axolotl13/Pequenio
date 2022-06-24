local ok_buffer, buffer = pcall(require, "bufferline")
local ok_icons, icons = pcall(require, "ui.icons")
if not ok_buffer and ok_icons then return end

local opts = {
  options = {
    middle_mouse_command = "vertical sbuffer %d",
    indicator_icon = icons.buffer.indicator,
    buffer_close_icon = icons.buffer.tab_close,
    modified_icon = icons.buffer.modified,
    close_icon = icons.buffer.close,
    left_trunc_marker = icons.buffer.left,
    right_trunc_marker = icons.buffer.right,
    max_name_length = 20,
    max_prefix_length = 20,
    tab_size = 20,
    offsets = {{filetype = "NvimTree", text = ""}}, -- padding = "1"
    show_close_icon = false,
    persist_buffer_sort = true,
    separator_style = "thin",
    enforce_regular_tabs = false,
    always_show_bufferline = true
  },
  highlights = require("ui.colors").bufferline
}

buffer.setup(opts)
