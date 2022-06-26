local ok, autopairs = pcall(require, "nvim-autopairs")
if not ok then return end

local opts = {
  check_ts = true,
  ts_config = {lua = {"string", "source"}, javascript = {"string", "template_string"}},
  disable_filetype = {"TelescopePrompt", "vim"},
  fast_wrap = {
    map = "<M-e>", -- M = Alt
    chars = {"{", "[", "(", '"', "'"},
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0,
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "PmenuSel",
    highlight_grey = "LineNr"
  }
}

autopairs.setup(opts)

-- Rule AstroNvim

require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done(
                            {map_char = {tex = ""}}))
