local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then return end

local opts = {
  ensure_installed = {
    "bash", "comment", "cpp", "css", "dockerfile", "fish", "go", "html", "java", "javascript",
    "jsdoc", "json", "lua", "markdown", "php", "python", "rust", "scss", "tsx", "typescript", "vim",
    "yaml"
  },
  highlight = {enable = true},
  indent = {enable = true},
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "ga",
      node_incremental = "g+",
      -- scope_incremental = "gaa",
      node_decremental = "g-"
    }
  },
  rainbow = {enable = true, disable = {"html"}, extended_mode = false, max_file_lines = nil},
  refactor = {highlight_definitions = {enable = true}, highlight_current_scope = {enable = false}},
  context_commentstring = {enable = true, enable_autocmd = false},
  autotag = {enable = true}
}

treesitter.setup(opts)
