local nvimtree_ok, nvimtree = pcall(require, "nvim-tree")
local icons_ok, icons = pcall(require, "ui.icons")
if not nvimtree_ok and icons_ok then return end

local opts = {
  disable_netrw = true,
  hijack_cursor = true,
  ignore_buffer_on_setup = false,
  update_cwd = true,
  respect_buf_cwd = true,
  view = {
    width = 32,
    height = 30,
    mappings = {
      custom_only = false,
      list = {},
    },
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    root_folder_modifier = table.concat{":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??"},
    indent_markers = {
      enable = false,
      icons = {
        corner ="└ ",
        edge = "│ ",
        item = "│ ",
        none = "  ",
      },
    },
    icons = {
      symlink_arrow = icons.symlink_arrow,
      show = {
        file = true,
        folder = true,
        folder_arrow = false,
        git = true,
      },
      glyphs = {
        default = icons.default,
        symlink = icons.symlink,
        folder = {
          -- arrow_open = icons.folder.arrow_open,
          -- arrow_closed = icons.folder.arrow_closed,
          default = icons.folder.default,
          open = icons.folder.open,
          empty = icons.folder.empty,
          empty_open = icons.folder.empty_open,
          symlink = icons.folder.symlink,
          symlink_open = icons.folder.symlink_open,
        },
        git = {
          unstaged = icons.git.unstaged,
          staged = icons.git.staged,
          unmerged = icons.git.unmerged,
          renamed = icons.git.renamed,
          untracked = icons.git.untracked,
          deleted = icons.git.deleted,
          ignored = icons.git.ignored,
        },
      },
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  ignore_ft_on_setup = {},
  system_open = {
    cmd = nil,
    args = {},
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    icons = {
      hint = icons.diagnostics.hint,
      info = icons.diagnostics.info,
      warning = icons.diagnostics.info,
      error = icons.diagnostics.info,
    },
  },
  filters = {
    dotfiles = false,
    custom = {".git","node_modules", ".cache"},
    exclude = {".gitignore", "gitsigns"},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = true,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = false,
      window_picker = {
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame", "toggleterm" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
    remove_file = {
      close_window = true,
    },
  },
  trash = {
    require_confirm = false,
  },
}

nvimtree.setup(opts)

vim.api.nvim_create_autocmd('BufEnter', {
  command = [[if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]],
  nested = true,
})
