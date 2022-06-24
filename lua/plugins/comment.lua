local ok, comment = pcall(require, "Comment")
local utils_ok, utils = pcall(require, "Comment.utils")
if not ok and utils_ok then return end

local opts = {
  padding = true,
  ignore = "^$",
  mapping = {basic = true, extra = false},
  toggler = {line = "gcc", block = "gbc"},

  pre_hook = function(ctx)
    local U = utils

    local location = nil
    if ctx.ctype == U.ctype.block then
      location = require("ts_context_commentstring.utils").get_cursor_location()
    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
      location = require("ts_context_commentstring.utils").get_visual_start_location()
    end

    return require("ts_context_commentstring.internal").calculate_commentstring {
      key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
      location = location
    }
  end
}

comment.setup(opts)
