local ok, diffview = pcall(require, "diffview")
local ok_icons, icons = pcall(require, "ui.icons")
if not ok and ok_icons then return end

local opts = {
  icons = {folder_closed = icons.folder.default, folder_open = icons.folder.open},
  signs = {fold_closed = "", fold_open = ""},
  file_panel = {
    listing_style = "list",
    win_config = {position = "left", width = 32}
  },
  file_history_panel = {
    log_options = {
      single_file = {diff_merges = "combined"},
      multi_file = {diff_merges = "first-parent"}
    },
    win_config = {position = "bottom", height = 16}
  },
  commit_log_panel = {win_config = {}},
  default_args = {DiffviewOpen = {}, DiffviewFileHistory = {}},
  keymaps = {disable_defaults = false}
}

diffview.setup(opts)
