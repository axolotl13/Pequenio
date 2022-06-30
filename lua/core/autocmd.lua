local autocmd = vim.api.nvim_create_autocmd

-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "html",
-- 	command = "setlocal shiftwidth=2 tabstop=2"
-- })

-- Auto save
-- autocmd({"InsertLeave", "TextChanged"}, {
--   pattern = { "*" },
--   command = "silent! wall",
-- })

-- Disable autocomment
autocmd("BufEnter", {pattern = "*", command = "set fo-=c fo-=r fo-=o"})
