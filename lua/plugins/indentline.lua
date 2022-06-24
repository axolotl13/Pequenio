local ok, blankline = pcall(require, "indent_blankline")
if not ok then return end

local opts = {
  char = "▏",
  -- char_list = {'|', '¦', '┆', '┊'},
  show_current_context = true,
  show_current_context_start = true,
  show_trailing_blankline_indent = false,
  -- show_end_of_line = true,
  use_treesitter = true,
  buftype_exclude = {"terminal", "help", "packes", "TelescopePrompt", "TelescopeResults", "lspinfo"},
  filetype_exclude = {
    "alpha", "help", "terminal", "packer", "sh", "markdown", "md", "txt", "css", "lsp-installer"
  },
  context_patterns = {
    "class", "function", "method", "try", "^if", "^while", "^for", "^switch", "^object", "^table",
    "block", "arguments", "return", "jsx_element", "if_statement", "else_clause", "jsx_element",
    "jsx_self_closing_element", "try_statement", "catch_clause", "import_statement",
    "operation_type", "export"
  }
}

blankline.setup(opts)
