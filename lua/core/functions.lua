local M = {}

-- Instalar Packer
M.boostrap = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

  if fn.empty(fn.glob(install_path)) > 0 then
    print("Cloning packer ..")
    fn.system({
      "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path
    })

    print("Restart Neovim")
  end
end

-- Inicia packer en una ventana flotante
M.options = {
  auto_clean = true,
  compile_on_sync = true,
  git = {clone_timeout = 800},
  display = {
    working_sym = "",
    error_sym = "✗ ",
    done_sym = " ",
    removed_sym = " ",
    moved_sym = "",
    open_fn = function()
      return require("packer.util").float({border = "single"})
    end
  }
}

M.start = function(plugins)
  local ok, packer = pcall(require, "packer")
  if not ok then
    M.boostrap()
  else

    packer.init(M.options)

    packer.startup(function(use)
      for _, v in pairs(plugins) do use(v) end
    end)
  end
end

-- Neovide Config
M.neovide = function()
  local g = vim.g
  -- g.neovide_fullscreen = true
  -- g.neovide_transparency = 0.8
  g.neovide_no_idle = true
  -- g.neovide_profiler = true
  -- g.neovide_remember_window_size = true
  g.neovide_cursor_animation_length = 0.13
  g.neovide_cursor_trail_length = 0.8
  g.neovide_cursor_vfx_mode = "railgun"
end

-- Keymaps
M.register = function(group)
  local map = vim.keymap.set
  for _, key in pairs(group) do
    key.options.desc = key.desc
    map(key.mode, key.lhs, key.rhs, key.options)
  end
end

-- Colors
M.set = function(hi, colors)
  local command = "highlight! " .. hi
  for k, v in pairs(colors) do
    if k ~= "gui" then
      command = command .. " gui" .. k .. "=" .. v
    else
      command = command .. " " .. k .. "=" .. v
    end
  end
  vim.cmd(command)
end

M.get_highlight = function(hlname)
  local hl = vim.api.nvim_get_hl_by_name(hlname, true)
  local t = {}
  local hex = function(n)
    if n then return string.format("#%06x", n) end
  end
  t.fg = hex(hl.foreground)
  t.bg = hex(hl.background)
  return t
end

return M
