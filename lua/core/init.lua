local mods = {"core.disable", "core.settings", "core.plugins", "core.autocmd", "core.keymaps"}

for _, mod in ipairs(mods) do
  local ok, core = pcall(require, mod)
  if not ok then error(("Error loading core...\n\n%s"):format(core)) end
end
