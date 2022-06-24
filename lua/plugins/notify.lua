local ok, notify = pcall(require, "notify")
if not ok then return end

local opts = {minimum_width = 40, stages = "fade", background_colour = "Normal"}

notify.setup(opts)

vim.notify = notify
