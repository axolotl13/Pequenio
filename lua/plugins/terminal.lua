local ok, terminal = pcall(require, "toggleterm")
if not ok then return end

local opts = {
  size = function(term)
    if term.direction == "horizontal" then
      return 10
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.5
    end
  end,
  direction = "horizontal",
  float_opts = {border = "curved"}
}

terminal.setup(opts)
