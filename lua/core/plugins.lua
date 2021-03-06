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
      vim.g.tokyonight_style = "storm"
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
    after = {"nvim-treesitter", "nvim-web-devicons"},
    config = function()
      require("plugins.indentline")
    end
  },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    event = { "BufRead", "BufNewFile" },
    config = function()
      require("plugins.treesitter")
    end
  }, {"nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter"},
  {"p00f/nvim-ts-rainbow", after = "nvim-treesitter"},
  {"JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter"},
  -- LSP
  {
    "neovim/nvim-lspconfig",
    module = "lspconfig",
    after = "null-ls.nvim",
    config = function()
      require("plugins.lspconfig").start()
    end
  }, {
    "williamboman/nvim-lsp-installer",
    event = {"BufRead", "BufNewFile"}
  }, {
    "ray-x/lsp_signature.nvim",
    after = "nvim-lspconfig"
  }, {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lsp-installer",
    config = function()
      require("plugins.nulls")
    end
  }, {
    "SmiteshP/nvim-navic", module = "nvim-navic"
  },
  -- Autocomplete
  {"rafamadriz/friendly-snippets", event = "InsertEnter"}, {
    "hrsh7th/nvim-cmp",
    after = "friendly-snippets",
    config = function()
      require("plugins.cmp")
    end
  },
  {"L3MON4D3/LuaSnip", wants = "friendly-snippets", after = "nvim-cmp"},
  {"saadparwaiz1/cmp_luasnip", after = "LuaSnip"},
  {"hrsh7th/cmp-nvim-lua", after = "cmp_luasnip"},
  {"hrsh7th/cmp-nvim-lsp", module = "cmp_nvim_lsp", after = "cmp-nvim-lua"},
  {"hrsh7th/cmp-buffer", after = "cmp-nvim-lua"},
  {"hrsh7th/cmp-path", after = "cmp-buffer"}, {
    "windwp/nvim-autopairs",
    -- after = "nvim-cmp", after = "nvim-treesitter",
    keys = {{"i", "("}, {"i", "["}, {"i", "{"}, {"i", "'"}, {"i", '"'}},
    config = function()
      require("plugins.autopairs")
    end
  }, {
    "windwp/nvim-ts-autotag",
    -- after = "nvim-treesitter",
    ft = {"html", "javascriptreact", "typescriptreact", "tsx", "jsx", "xml", "php", "markdown"}
  }, {
    "numToStr/Comment.nvim",
    keys = {{"n", "gcc"}, {"n", "gbc"}, {"v", "gc"}, {"v", "gb"}},
    config = function()
      require("plugins.comment")
    end
  }, {
    "ggandor/lightspeed.nvim",
    keys = {"f", "F", "s", "S", "t", "T"},
    config = function()
      require("lightspeed").setup({substitute_chars = {["\r"] = "??"}}) -- Enter
    end
  },
  -- Recomendado
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    config = function()
      require("plugins.telescope")
    end
  }, {
    "lewis6991/gitsigns.nvim",
    event = {"BufRead", "BufNewFile"},
    config = function()
      require("plugins.gitsigns")
    end
  }, {
    "ahmedkhalf/project.nvim",
    event = "BufWinEnter",
    config = function()
      require("project_nvim").setup()
    end
  }, {
    "rmagatti/auto-session",
    after = "project.nvim",
    config = function()
      require("plugins.session")
    end
  }, {
    "ur4ltz/surround.nvim",
    keys = {"md", "ma", "mr"}, -- {ys, ds, cs}
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
    module = "jdtls"
  }, {
    "sindrets/diffview.nvim",
    cmd = {"DiffviewFileHistory", "DiffviewOpen", "DiffviewClose"},
    config = function()
      require("plugins.diffview")
    end
  }
}

packer.start(plugins)
