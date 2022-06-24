local scroll_ok, scroll = pcall(require, "neoscroll")
local map_ok, scroll_map = pcall(require, "neoscroll.config")
if not scroll_ok and map_ok then return end

local opts = {
  mappings = {"<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb"},
  hide_cursor = true,
  stop_eof = true
  -- easing_function = "quadratic"
}

scroll.setup(opts)

local map = {
  ["<C-y>"] = {"scroll", {"-0.20", "false", "100"}},
  ["<C-e>"] = {"scroll", {"0.20", "false", "100"}},
  ["<PageUp>"] = {"scroll", {"-vim.wo.scroll", "true", "200"}},
  ["<PageDown>"] = {"scroll", {"vim.wo.scroll", "true", "200"}},
  ["<ScrollWheelUp>"] = {"scroll", {"-0.20", "true", "60"}},
  ["<ScrollWheelDown>"] = {"scroll", {"0.20", "true", "60"}},
  ["<A-ScrollWheelUp>"] = {"scroll", {"-vim.wo.scroll", "true", "100"}},
  ["<A-ScrollWheelDown>"] = {"scroll", {"vim.wo.scroll", "true", "100"}}
}

scroll_map.set_mappings(map)
