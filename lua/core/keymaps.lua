local ok, keymaps = pcall(require, "core.functions")
if not ok then return end

vim.g.mapleader = " "

keymaps.register({
  -- Desasignar
  {mode = {""}, lhs = "<space>", rhs = "<nop>", options = {silent = true}, desc = ""},
  {mode = {"n"}, lhs = "<C-z>", rhs = "<nop>", options = {silent = true}, desc = ""},
  {mode = {"n"}, lhs = "<esc>", rhs = "<cmd>noh<cr>", options = {silent = true}, desc = ""},
  {
    mode = {"n"},
    lhs = "|",
    rhs = "^",
    options = {silent = true},
    desc = "Poner el cursor al inicio"
  }, {
    mode = {"i"},
    lhs = "<C-b>",
    rhs = "<ESC>^i",
    options = {silent = true},
    desc = "Mover Cursor al inicio"
  }, {
    mode = {"i"},
    lhs = "<C-e>",
    rhs = "<End>",
    options = {silent = true},
    desc = "Mover Cursor al final"
  }, -- Spell
  {
    mode = {"n"},
    lhs = "<leader>es",
    rhs = "<cmd>set spell<cr>",
    options = {silent = true},
    desc = "Habilitar idioma español"
  }, {
    mode = {"n"},
    lhs = "<leader>en",
    rhs = "<cmd>set nospell<cr>",
    options = {silent = true},
    desc = "Deshabilitar idioma"
  }, -- Diffs
  {
    mode = {"n"},
    lhs = "<A-e>",
    rhs = "<cmd>diffthis<cr>",
    options = {silent = true},
    desc = "Habilitar diferencias en el archivo actual"
  }, {
    mode = {"n"},
    lhs = "<A-q>",
    rhs = "<cmd>diffoff<cr>",
    options = {silent = true},
    desc = "Deshabilitar diferencias en el archivo actual"
  }, {
    mode = {"n"},
    lhs = "<A-w>",
    rhs = "<cmd>diffput<cr>",
    options = {silent = true},
    desc = "Copiar diferencia"
  }, -- Mover texto
  {
    mode = {"n"},
    lhs = "<A-up>",
    rhs = ":m .-2<cr>==",
    options = {silent = true},
    desc = "Mover línea hacía arriba"
  }, {
    mode = {"n"},
    lhs = "<A-down>",
    rhs = ":m .+1<cr>==",
    options = {silent = true},
    desc = "Mover línea hacía abajo"
  }, {
    mode = {"x"},
    lhs = "<A-up>",
    rhs = ":m \'<-2<CR>gv-gv",
    options = {silent = true},
    desc = "Mover líneas hacía arriba"
  }, {
    mode = {"x"},
    lhs = "<A-down>",
    rhs = ":m \'>+1<CR>gv-gv",
    options = {silent = true},
    desc = "Mover líneas hacía abajo"
  }, -- Indent
  {mode = {"v"}, lhs = "<", rhs = "<gv", options = {silent = true}, desc = ""},
  {mode = {"v"}, lhs = ">", rhs = ">gv", options = {silent = true}, desc = ""},
  -- Buffers Navigation
  {
    mode = {"n"},
    lhs = "<tab>",
    rhs = "<cmd>bnext<cr>",
    options = {silent = true},
    desc = "Moverse a la anterior pestaña"
  }, {
    mode = {"n"},
    lhs = "<S-tab>",
    rhs = "<cmd>bprevious<cr>",
    options = {silent = true},
    desc = "Moverse a siguiente pestaña"
  }, {
    mode = {"n"},
    lhs = "<C-s>",
    rhs = "<cmd>w<cr>",
    options = {silent = true},
    desc = "Guarda Archivo"
  }, {
    mode = {"n"},
    lhs = "<leader>ba",
    rhs = "<cmd>%y+<cr>",
    options = {silent = true},
    desc = "Copiar todo el contenido"
  }, {
    mode = {"n"},
    lhs = "<leader>q",
    rhs = "<cmd>bd!<cr>",
    options = {silent = true},
    desc = "Cerrar pestaña"
  }, {
    mode = {"n"},
    lhs = "<leader>bn",
    rhs = "<cmd>enew<cr>",
    options = {silent = true},
    desc = "Nuevo Archivo"
  }, {
    mode = {"n"},
    lhs = "<C-x>",
    rhs = "<cmd>qa!<cr>",
    options = {silent = true},
    desc = "Cerrar todas las pestañas"
  }, -- Tab Navigation
  {
    mode = {"n"},
    lhs = "<leader>tn",
    rhs = "<cmd>tabnew<cr>",
    options = {silent = true},
    desc = "Añadir nueva super pestaña"
  }, {
    mode = {"n"},
    lhs = "<leader>tj",
    rhs = "<cmd>tabprevious<cr>",
    options = {silent = true},
    desc = "Moverse a la anterior super pestaña"
  }, {
    mode = {"n"},
    lhs = "<leader>tk",
    rhs = "<cmd>tabnext<cr>",
    options = {silent = true},
    desc = "Moverse a la siguiente super pestaña"
  }, {
    mode = {"n"},
    lhs = "<leader>tq",
    rhs = "<cmd>tabclose<cr>",
    options = {silent = true},
    desc = "Cerrar super pestaña"
  }, -- Terminal
  {
    mode = {"n"},
    lhs = "<C-t>",
    rhs = "<cmd>ToggleTerm<cr>",
    options = {silent = true},
    desc = "Iniciar Terminal"
  }, {
    mode = {"n"},
    lhs = "<leader>tf",
    rhs = "<cmd>ToggleTerm direction=float<cr>",
    options = {silent = true},
    desc = "Iniciar Terminal en una ventana flotante"
  }, {
    mode = {"n"},
    lhs = "<leader>tt",
    rhs = "<cmd>ToggleTerm direction=tab<cr>",
    options = {silent = true},
    desc = "Iniciar Terminal en una pestaña"
  }, {
    mode = {"n"},
    lhs = "<A-t>",
    rhs = "<cmd>ToggleTerm direction=vertical<cr>",
    options = {silent = true},
    desc = "Iniciar Terminal verticalmente"
  }, {
    mode = {"t"},
    lhs = "<esc>",
    rhs = "<C-\\><C-n>",
    options = {silent = true},
    desc = "Escape de la terminal"
  }, -- Packer Manager
  {
    mode = {"n"},
    lhs = "<leader>pl",
    rhs = "<cmd>PackerStatus<cr>",
    options = {silent = true},
    desc = "Plugins Cargados"
  }, {
    mode = {"n"},
    lhs = "<leader>ps",
    rhs = "<cmd>PackerSync<cr>",
    options = {silent = true},
    desc = "Actualizar Plugins"
  }, -- Nvim-tree
  {
    mode = {"n"},
    lhs = "ñ",
    rhs = "<cmd>NvimTreeToggle<cr>",
    options = {silent = true},
    desc = "Explorador de Achivos"
  }, -- ColorizerToggle
  {
    mode = {"n"},
    lhs = "<leader>cc",
    rhs = "<cmd>ColorizerToggle<cr>",
    options = {silent = true},
    desc = "Habilitar ColorizerToggle"
  }, -- Bufferline
  {
    mode = {"n"},
    lhs = "<leader>bi",
    rhs = "<cmd>BufferLineSortByDirectory<cr>",
    options = {silent = true},
    desc = "Ordernar Pestañas por Directorio"
  }, {
    mode = {"n"},
    lhs = "<leader>be",
    rhs = "<cmd>BufferLineSortByExtension<cr>",
    options = {silent = true},
    desc = "Ordernar Pestaña por Extensiones"
  }, {
    mode = {"n"},
    lhs = "<A-right>",
    rhs = "<cmd>BufferLineMoveNext<cr>",
    options = {silent = true},
    desc = "Mover la pestaña hacía la derecha"
  }, {
    mode = {"n"},
    lhs = "<A-left>",
    rhs = "<cmd>BufferLineMovePrev<cr>",
    options = {silent = true},
    desc = "Mover la pestaña hacía la izquierda"
  }, {
    mode = {"n"},
    lhs = "<C-z>",
    rhs = function()
      vim.cmd("BufferLineCloseRight")
      vim.cmd("BufferLineCloseLeft")
    end,
    options = {silent = true},
    desc = "Cerrar todas las pestañas excepto la actual"
  }, {
    mode = {"n"},
    lhs = "<A-1>",
    rhs = "<cmd>BufferLineGoToBuffer 1<cr>",
    options = {silent = true},
    desc = "Moverse a la primera pestaña"
  }, {
    mode = {"n"},
    lhs = "Ñ",
    rhs = "<cmd>BufferLinePick<cr>",
    options = {silent = true},
    desc = "Pickear en las pestañas"
  }, -- Gitsigns
  {
    mode = {"n"},
    lhs = "<leader>gr",
    rhs = "<cmd>Gitsigns reset_buffer<cr>",
    options = {silent = true},
    desc = "Resetear cambios de la pestaña actual git"
  }, {
    mode = {"n"},
    lhs = "<leader>gw",
    rhs = "<cmd>Gitsigns stage_hunk<cr>",
    options = {silent = true},
    desc = "Asignar cambios git"
  }, {
    mode = {"n"},
    lhs = "<leader>gu",
    rhs = "<cmd>Gitsigns reset_hunk<cr>",
    options = {silent = true},
    desc = "Deshacer cambios del git"
  }, {
    mode = {"n"},
    lhs = "<leader>gp",
    rhs = "<cmd>Gitsigns preview_hunk<cr>",
    options = {silent = true},
    desc = "Previsualizar cambios que se han hecho"
  }, {
    mode = {"n"},
    lhs = "<leader>gj",
    rhs = "<cmd>Gitsigns next_hunk<cr>",
    options = {silent = true},
    desc = "Moverse hacía el siguiente cambio que se ha realizado"
  }, {
    mode = {"n"},
    lhs = "<leader>gk",
    rhs = "<cmd>Gitsigns prev_hunk<cr>",
    options = {silent = true},
    desc = "Moverse hacía el anterior cambio que se ha realizado"
  }, {
    mode = {"n"},
    lhs = "<leader>gd",
    rhs = "<cmd>Gitsigns diffthis<cr>",
    options = {silent = true},
    desc = "Ver los cambios posteriores que se habían hecho"
  }, {
    mode = {"n"},
    lhs = "<leader>gq",
    rhs = "<cmd>Gitsigns undo_stage_hunk<cr>",
    options = {silent = true},
    desc = "Deshacer cambios"
  }, {
    mode = {"n"},
    lhs = "<leader>gl",
    rhs = "<cmd>Gitsigns toggle_current_line_blame<cr>",
    options = {silent = true},
    desc = "Habilitar línea de cambios por usuario"
  }, -- LSP
  {
    mode = {"n"},
    lhs = "gf",
    rhs = function()
      vim.diagnostic.open_float()
    end,
    options = {silent = true},
    desc = "Diagnosticos Flotantes"
  }, {
    mode = {"n"},
    lhs = "g}",
    rhs = function()
      vim.diagnostic.goto_prev()
    end,
    options = {silent = true},
    desc = "Ir al interior error LSP"
  }, {
    mode = {"n"},
    lhs = "g{",
    rhs = function()
      vim.diagnostic.goto_next()
    end,
    options = {silent = true},
    desc = "Ir al siguiente error LSP"
  }, {
    mode = {"n"},
    lhs = "gs",
    rhs = function()
      vim.diagnostic.setloclist()
    end,
    options = {silent = true},
    desc = ""
  }, -- Telescope
  {
    mode = {"n"},
    lhs = "<leader>sb",
    rhs = "<cmd>Telescope current_buffer_fuzzy_find<cr>",
    options = {silent = true},
    desc = "Buscar dentro del buffer"
  }, {
    mode = {"n"},
    lhs = "<leader>ss",
    rhs = "<cmd>Telescope live_grep<cr>",
    options = {silent = true},
    desc = "Buscar Palabras"
  }, {
    mode = {"n"},
    lhs = "<leader>sf",
    rhs = "<cmd>Telescope find_files<cr>",
    options = {silent = true},
    desc = "Buscar Archivos"
  }, {
    mode = {"n"},
    lhs = "<leader>sg",
    rhs = "<cmd>Telescope diagnostics<cr>",
    options = {silent = true},
    desc = "Buscar Diagnosticos"
  }, {
    mode = {"n"},
    lhs = "<leader>sc",
    rhs = "<cmd>Telescope git_commits<cr>",
    options = {silent = true},
    desc = "Buscar Commits"
  }, {
    mode = {"n"},
    lhs = "<leader>sk",
    rhs = "<cmd>Telescope keymaps<cr>",
    options = {silent = true},
    desc = "Buscar keymaps"
  }, {
    mode = {"n"},
    lhs = "<leader>sh",
    rhs = "<cmd>Telescope oldfiles<cr>",
    options = {silent = true},
    desc = "Buscar en archivos historicos"
  }, {
    mode = {"n"},
    lhs = "<leader>st",
    rhs = "<cmd>Telescope git_status<cr>",
    options = {silent = true},
    desc = "Buscar estados en git"
  }, {
    mode = {"n"},
    lhs = "<leader>sn",
    rhs = "<cmd>Telescope git_branches<cr>",
    options = {silent = true},
    desc = "Buscar branchs en git"
  }, {
    mode = {"n"},
    lhs = "<leader>se",
    rhs = "<cmd>Telescope fd cwd=$HOME<cr>",
    options = {silent = true},
    desc = "Buscar en HOME"
  }, -- Notify
  {
    mode = {"n"},
    lhs = "<leader>sy",
    rhs = "<cmd>Telescope notify<cr>",
    options = {silent = true},
    desc = "Buscar últimas notificaciones"
  }, -- Projects
  {
    mode = {"n"},
    lhs = "<A-z>",
    rhs = "<cmd>Telescope projects<cr>",
    options = {silent = true},
    desc = "Buscar en proyectos"
  }, -- Session
  -- {
  --   mode = { "n" },
  --   lhs = "<leader>sz",
  --   rhs = "<cmd>Telescope session-lens search_session<cr>",
  --   options = { silent = true },
  --   desc = "Buscar en sessiones"
  -- }
  -- SnipRun
  {
    mode = {"n"},
    lhs = "<leader>re",
    rhs = "<cmd>SnipRun<cr>",
    options = {silent = true},
    desc = "Ejecutar línea de código"
  }, {
    mode = {"v"},
    lhs = "<leader>re",
    rhs = ":\'<,\'>SnipRun<cr>",
    options = {silent = true},
    desc = "Ejecutar bloque de código"
  }, {
    mode = {"n"},
    lhs = "<leader>rr",
    rhs = "<cmd>SnipReset<cr>",
    options = {silent = true},
    desc = "Reiniciar SnipRun"
  }, {
    mode = {"n"},
    lhs = "<leader>rq",
    rhs = "<cmd>SnipClose<cr>",
    options = {silent = true},
    desc = "Cerrar SnipRun"
  }
  -- WhichKey
  -- {
  --   mode = {"n"},
  --   lhs = "<leader>wk",
  --   rhs = "<cmd>WhichKey<cr>",
  --   options = {silent = true},
  --   desc = "Ver todos los atajos"
  -- }
})

-- -- Move Buffers
-- map("n", "<C-h>", "<C-w>h")
-- map("n", "<C-l>", "<C-w>l")
-- map("n", "<C-k>", "<C-w>k")
-- map("n", "<C-j>", "<C-w>j")

-- -- Resize Buffers
-- -- map("n", "<C-UP>", "<C-w>-2")
-- -- map("n", "<C-DOWN>", "<C-w>+2")
-- -- map("n", "<C-LEFT>", "<C-w>>")
-- -- map("n", "<C-RIGHT>", "<C-w><")
