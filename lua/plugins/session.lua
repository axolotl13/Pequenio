local ok, session = pcall(require, "auto-session")
if not ok then return end

local opts = {
  pre_save_cmds = {"NvimTreeClose", "cclose", "lua vim.notify.dismiss()"},
  auto_session_root_dir = vim.fn.expand("$HOME") .. "/.config/nvim/sessions/",
  auto_session_enabled = true,
  auto_restore_enabled = true,
  auto_save_enabled = true
}

session.setup(opts)
