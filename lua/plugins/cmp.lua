local mods = {"cmp", "cmp.utils.window", "luasnip", "luasnip/loaders/from_vscode", "ui.icons"}
local l, ok = {}, nil

for _, mod in ipairs(mods) do
  ok, l[_] = pcall(require, mod)
  if not ok then return end
end

local cmp, luasnip, icons = l[1], l[3], l[5]

-- local has_words_before = function()
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col)
--              :match "%s" == nil
-- end

local border = function(hl)
  return {
    {"╭", hl}, {"─", hl}, {"╮", hl}, {"│", hl}, {"╯", hl}, {"─", hl}, {"╰", hl},
    {"│", hl}
  }
end

l[4].lazy_load()

local cmp_window = l[2]

cmp_window.info_ = cmp_window.info
cmp_window.info = function(self)
  local info = self:info_()
  info.scrollable = false
  return info
end

local opts = {
  -- preselect = cmp.PreselectMode.None,
  formatting = {
    -- fields = { "kind", "abbr", "menu" },
    format = function(_, vim_item)
      vim_item.kind = string.format("%s %s", icons.kinds_icons[vim_item.kind], vim_item.kind)
      return vim_item
    end
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  duplicates = {nvim_lsp = 1, luasnip = 1, buffer = 1, path = 1},
  sources = {
    {name = "luasnip"}, {name = "nvim_lsp"}, {name = "buffer"}, {name = "nvim_lua"}, {name = "path"}
  },
  confirm_opts = {behavior = cmp.ConfirmBehavior.Replace, select = false},
  experimental = {ghost_text = true},
  window = {
    completion = {
      border = border("CmpBorder"),
      winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None"
    },
    documentation = {border = border("CmpDocBorder")}
  },
  mapping = {
    ["<Up>"] = cmp.mapping.select_prev_item(),
    ["<Down>"] = cmp.mapping.select_next_item(),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-j>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), {"i", "c"}),
    ["<C-k>"] = cmp.mapping(cmp.mapping.scroll_docs(1), {"i", "c"}),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
    -- ["<C-y>"] = cmp.config.disable,
    ["<C-e>"] = cmp.mapping {i = cmp.mapping.abort(), c = cmp.mapping.close()},
    ["<CR>"] = cmp.mapping.confirm {behavior = cmp.ConfirmBehavior.Replace, select = true},
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
        -- elseif has_words_before() then
        --   cmp.complete()
      else
        fallback()
      end
    end, {"i", "s"}),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {"i", "s"})
  }
}

cmp.setup(opts)
