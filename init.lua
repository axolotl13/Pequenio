-- Comprueba la version de Neovim
if vim.fn.has("nvim-0.7") == 0 then
  error("Necesitas Neovim v0.7+ para funcionar correctamente.")
end

local ok, impatient = pcall(require, "impatient")
if ok then
  impatient.enable_profile()
end

if vim.g.neovide then
  require("core.functions").neovide()
end

require("core")
