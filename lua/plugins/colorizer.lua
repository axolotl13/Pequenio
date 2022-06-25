local ok, colorizer = pcall(require, "colorizer")
if not ok then return end

local opts = {
  filetypes = {"*"},
  user = {
    RGB = true,
    RRGGBB = true,
    names = true,
    RRGGBBAA = true,
    rgb_fn = true,
    hsl_fn = true,
    css = true,
    css_fn = true,
    mode = "background"
  }
}

colorizer.setup(opts["filetypes"], opts["user"])
