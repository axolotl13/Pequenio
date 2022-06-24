local opt = vim.opt

local opts = {
  -- Opciones de Sangría
  expandtab = true,
  shiftwidth = 2,
  smartindent = true,
  -- Opciones de Búsqueda
  smartcase = true,
  -- Opciones de Renderizado de Texto
  encoding = "utf-8",
  -- syntax = "enable",
  guifont = "Victor Mono:h15",
  -- Menu
  completeopt = "menuone,noselect",
  pumheight = 10,
  -- Interfaz de Usuario
  -- background = "dark",
  cursorcolumn = false,
  cursorline = true,
  fillchars = "eob: ",
  foldenable = false,
  list = true,
  listchars = "eol:↩,trail:·,lead:·,tab:..",
  mouse = "a",
  number = true,
  relativenumber = true,
  showmode = false,
  termguicolors = true,
  title = true,
  wrap = false,
  -- Misceláneas
  backup = false,
  -- conceallevel = 0,
  clipboard = "unnamedplus",
  hidden = true,
  iskeyword ="@,48-57,_,192-255,-",
  splitbelow = true,
  splitright = true,
  -- spell = true,
  spelllang = "en,es",
  swapfile = false,
  scrolloff = 12,
  sidescrolloff = 10,
  undofile = true,
  writebackup = false,
  whichwrap = "b,s,<,>,[,],h,l",
  sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize",
  -- Opciones de Rendimiento
  -- redrawtime = 1500,
  timeoutlen = 300,
  -- ttimeoutlen = 10,
  updatetime = 100,
}

opt.shortmess:append("sI")
opt.shortmess = opt.shortmess + { c = true }

for _, value in pairs(opts) do
  opt[_] = value
end
