local ok, packer = pcall(require, "core.functions")
if not ok then return end

local plugins = {
  -- Optimizar
  {"lewis6991/impatient.nvim"},
  -- Dependencies
  {"nvim-lua/plenary.nvim"},
  {"tweekmonster/startuptime.vim", cmd = "StartupTime"},
  {
    "kyazdani42/nvim-web-devicons",
    after = "tokyonight.nvim",
    config = function()
      require("plugins.devicons")
    end
  },
  -- Plugins Manager
  {"wbthomason/packer.nvim"},
  -- Interfaz de Usuario
  {
    "rcarriga/nvim-notify",
    module = "vim",
    config = function()
      require("plugins.notify")
    end
  }, {
    "folke/tokyonight.nvim",
    after = "plenary.nvim",
    config = function()
      vim.g.tokyonight_style = "night"
      vim.g.tokyonight_sidebars = {"qf", "vista_kind", "packer"}
      vim.cmd [[colorscheme tokyonight]]
    end
  }, {
    "kyazdani42/nvim-tree.lua",
    cmd = {"NvimTreeToggle", "NvimTreeClose"},
    config = function()
      require("plugins.explorer")
    end
  }, {
    "akinsho/bufferline.nvim",
    after = "nvim-web-devicons",
    config = function()
      require("plugins.bufferline")
    end
  }, {
    "rebelot/heirline.nvim",
    after = {"nvim-web-devicons", "nvim-lspconfig"},
    config = function()
      require("plugins.statusline")
    end
  }, {
    "lukas-reineke/indent-blankline.nvim",
    after = "nvim-web-devicons",
    config = function()
      require("plugins.indentline")
    end
  }, {
    "karb94/neoscroll.nvim",
    event = {"BufRead", "BufNewFile"},
    config = function()
      require("plugins.neoscroll")
    end
  },
  -- {
  --   "beauwilliams/focus.nvim",
  --   config = function()
  --     require("focus").setup({excluded_filetypes = {"toggleterm"}, signcolumn = false})
  --   end
  -- },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    module = "nvim-treesitter",
    -- event = { "BufRead", "BufNewFile" },
    run = ":TSUpdate",
    config = function()
      require("plugins.treesitter")
    end
  }, {"nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter"},
  {"p00f/nvim-ts-rainbow", after = "nvim-treesitter"},
  {"JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter"},
  -- LSP
  {
    "neovim/nvim-lspconfig",
    after = "lsp_signature.nvim",
    config = function()
      require("plugins.lspconfig").start()
    end
  }, {"williamboman/nvim-lsp-installer", after = "plenary.nvim"},
  {"ray-x/lsp_signature.nvim", after = "nvim-lsp-installer"}, {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("plugins.nulls")
    end
  }, {"SmiteshP/nvim-navic", after = "nvim-lsp-installer"},
  -- Autocomplete
  {"rafamadriz/friendly-snippets", event = "InsertEnter"}, {
    "hrsh7th/nvim-cmp",
    after = "friendly-snippets",
    config = function()
      require("plugins.cmp")
    end
  }, {"L3MON4D3/LuaSnip", wants = "friendly-snippets", after = "nvim-cmp"},
  {"saadparwaiz1/cmp_luasnip", after = "LuaSnip"}, {"hrsh7th/cmp-nvim-lua", after = "cmp_luasnip"},
  {"hrsh7th/cmp-nvim-lsp", after = "cmp-nvim-lua"}, {"hrsh7th/cmp-buffer", after = "cmp-nvim-lsp"},
  {"hrsh7th/cmp-path", after = "cmp-buffer"}, {
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    config = function()
      require("plugins.autopairs")
    end
  }, {
    "windwp/nvim-ts-autotag",
    -- after = "nvim-treesitter",
    ft = {"html", "javascriptreact", "typescriptreact", "tsx", "jsx", "xml", "php", "markdown"}
  }, {
    "numToStr/Comment.nvim",
    after = "nvim-ts-context-commentstring",
    keys = {"gc", "gb"},
    config = function()
      require("plugins.comment")
    end
  }, {
    "ggandor/leap.nvim",
    keys = {"s", "S"}, -- { "f", "F", "s", "S", "t", "T" },
    config = function()
      require("leap").set_default_keymaps()
    end
  },
  -- Recomendado
  {
    "nvim-telescope/telescope.nvim",
    -- after = {"session-lens", "project.nvim"},
    cmd = "Telescope",
    config = function()
      require("plugins.telescope")
    end
  }, {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = function()
      require("plugins.gitsigns")
    end
  }, {
    "ahmedkhalf/project.nvim",
    event = "BufWinEnter",
    config = function()
      require("project_nvim").setup({detection_methods = {"lsp", "pattern"}})
    end
  }, {
    "rmagatti/auto-session",
    after = "project.nvim",
    config = function()
      require("plugins.session")
    end
  }, -- {
  --   "rmagatti/session-lens",
  --   after = "auto-session",
  --   config = function()
  --     require("session-lens").setup({
  --       path_display = {"shorten"},
  --     })
  --   end
  -- },
  {
    "ur4ltz/surround.nvim",
    keys = { "md", "ma", "mr" }, -- {ys, ds, cs}
    -- event = {"BufRead", "BufNewFile"},
    config = function()
      require("surround").setup({mappings_style = "sandwich", prefix = "m"})
    end
  }, {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    config = function()
      require("plugins.terminal")
    end
  }, {
    "norcalli/nvim-colorizer.lua",
    cmd = {"ColorizerToggle"},
    config = function()
      require("plugins.colorizer")
    end
  }, {
    "mg979/vim-visual-multi",
    keys = {"<C-n>", "<C-Down>", "<C-Up>", "<S-Left>", "<S-Right>"} -- , n, N, q, Q
  }, {
    "michaelb/sniprun",
    run = "bash ./install.sh",
    cmd = "SnipRun",
    config = function()
      require("plugins.sniprun")
    end
  }, {
    "mfussenegger/nvim-jdtls",
    after = "nvim-lspconfig"
    -- ft = "java"
  },
  -- {
  --   "folke/which-key.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("which-key").setup()
  --   end
  -- },
  -- test
  -- mattn/emmet-vim
  -- "abecodes/tabout.nvim",
  -- goolord/alpha-nvim
  -- tpope/vim-fugitive
  -- tzachar/cmp-tabnine
  -- github/copilot.vim
  -- lewis6991/spellsitter.nvim
  -- junegunn/vim-easy-align
  -- declancm/cinnamon.nvim
  -- petertriho/nvim-scrollbar
-- lewis6991/satellite.nvim
  -- nvim-pack/nvim-spectre
  -- f3fora/cmp-spell
  -- yamatsum/nvim-cursorline
  -- xiyaowong/nvim-cursorword
}

packer.start(plugins)
