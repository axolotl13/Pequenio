local ok, sniprun = pcall(require, "sniprun")
if not ok then return end

local opts = {
  interpreter_options = {JS_original = {use_on_filetypes = {"javascriptreact"}}},
  display = {"VirtualTextOK", "NvimNotify"},
  display_options = {notification_timeout = 5}
}

sniprun.setup(opts)
