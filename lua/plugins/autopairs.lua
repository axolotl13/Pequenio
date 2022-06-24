local ok, autopairs = pcall(require, "nvim-autopairs")
if not ok then return end

local opts = {
  check_ts = true,
  ts_config = {lua = {"string", "source"}, javascript = {"string", "template_string"}},
  disable_filetype = {"TelescopePrompt", "vim"}
}

autopairs.setup(opts)

require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done(
                            {map_char = {tex = ""}}))
