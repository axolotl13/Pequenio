local ok_icons, icons = pcall(require, "ui.icons")
local ok_cmp, cmp = pcall(require, "cmp_nvim_lsp")
if not ok_icons and ok_cmp then return end

local M = {}

M.float_settings = function()
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "double"})
  vim.lsp.handlers["textDocument/signatureHelp"] =
      vim.lsp.with(vim.lsp.handlers.signature_help, {border = "single"})
end

M.diagnostics = function()
  local opts = {
    virtual_text = {prefix = icons.prefix},
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
    }
  }

  vim.diagnostic.config(opts)

  local signs = {
    Error = icons.diagnostics.info,
    Warn = icons.diagnostics.info,
    Hint = icons.diagnostics.hint,
    Info = icons.diagnostics.info
  }

  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
  end
end

M.navic = function(client, bufnr)
  local ok, navic = pcall(require, "nvim-navic")
  if not ok then return end

  local clients = {"tsserver", "pyright", "sumneko_lua", "clangd", "jdtls", "gopls"}

  for _, name in ipairs(clients) do if client.name == name then navic.attach(client, bufnr) end end
end

M.on_attach = function(client, bufnr)
  local ok, signature = pcall(require, "lsp_signature")
  if not ok then return end

  signature.on_attach({
    bind = true,
      handler_opts = {
        border = "rounded"
    },
    floating_window = true,
    floating_window_above_cur_line = true,
    floating_window_off_x = 20,
    floating_window_off_y = -1
  }, bufnr)

  M.navic(client, bufnr)

  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  M.maps(bufnr)

end

M.maps = function(bufnr)
  local ok, keymaps = pcall(require, "core.functions")
  if not ok then return end

  keymaps.register({
    {
      mode = {"n"},
      lhs = "gd",
      rhs = vim.lsp.buf.definition,
      options = {silent = true, buffer = bufnr},
      desc = "Ir a Definiciones"
    }, {
      mode = {"n"},
      lhs = "K",
      rhs = vim.lsp.buf.hover,
      options = {silent = true, buffer = bufnr},
      desc = ""
    }, {
      mode = {"n"},
      lhs = "gu",
      rhs = vim.lsp.buf.type_definition,
      options = {silent = true, buffer = bufnr},
      desc = ""
    }, {
      mode = {"n"},
      lhs = "gr",
      rhs = vim.lsp.buf.rename,
      options = {silent = true, buffer = bufnr},
      desc = "Renombrar Parametro"
    }, {
      mode = {"n"},
      lhs = "gp",
      rhs = vim.lsp.buf.code_action,
      options = {silent = true, buffer = bufnr},
      desc = "Show code action"
    }, {
      mode = {"n"},
      lhs = "gl",
      rhs = vim.lsp.buf.references,
      options = {silent = true, buffer = bufnr},
      desc = "Ir a Referencias"
    },
    -- {
    --   mode = {"n"},
    --   lhs = "<leader>ff",
    --   rhs = vim.lsp.buf.formatting_sync,
    --   options = {silent = true, buffer = bufnr},
    --   desc = "Formatear Código"
    -- },
    {
      mode = {"x"},
      lhs = "<leader>ff",
      rhs = vim.lsp.buf.range_formatting,
      options = {silent = true, buffer = bufnr},
      desc = "Formatear Código"
    }, {
      mode = {"n"},
      lhs = "gs",
      rhs = vim.lsp.buf.signature_help,
      options = {silent = true, buffer = bufnr},
      desc = "Ir a Referencias"
    }
  })
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
-- cmp_nvim_lsp
M.capabilities = cmp.update_capabilities(M.capabilities)

M.capabilities.textDocument.completion.completionItem = {
  -- documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true
  -- preselectSupport = true,
  -- insertReplaceSupport = true,
  -- labelDetailsSupport = true,
  -- deprecatedSupport = true,
  -- commitCharactersSupport = true,
  -- tagSupport = { valueSet = { 1 } },
  -- resolveSupport = {
  --   properties = {
  --     "documentation",
  --     "detail",
  --     "additionalTextEdits",
  --   },
  -- },
}

M.start = function()
  local ok_lspconfig, lspconfig = pcall(require, "lspconfig")
  local ok_lspinstall, lspinstall = pcall(require, "nvim-lsp-installer")
  if not ok_lspconfig and ok_lspinstall then return end

  M.float_settings()
  M.diagnostics()

  local install_opts = {
    automatic_installation = false,
    ui = {
      check_outdated_servers_on_open = true,
      icons = {
        server_installed = icons.lsp.install,
        server_pending = icons.lsp.uninstall,
        server_uninstalled = icons.lsp.pending
      },
      keymaps = {
        toggle_server_expand = "<CR>",
        install_server = "i",
        update_server = "u",
        update_all_servers = "U",
        uninstall_server = "d"
      }
    }
  }

  lspinstall.setup(install_opts)

  local servers = lspinstall.get_installed_servers()

  local opts = {}
  local extend = vim.tbl_deep_extend

  for _, server in pairs(servers) do
    opts = {
      on_attach = M.on_attach,
      capabilities = M.capabilities,
      flags = {debounce_text_changes = 150}
    }
    if server.name == "clangd" then
      local clangd_opts = require("lsp.clangd")
      opts = extend("force", clangd_opts, opts)
    end

    if server.name == "sqlls" then
      local sqlls_opts = require("lsp.sqlls")
      opts = extend("force", sqlls_opts, opts)
    end

    if server.name == "sumneko_lua" then
      local sumneko_lua_opts = require("lsp.sumneko_lua")
      opts = extend("force", sumneko_lua_opts, opts)
    end

    if server.name == "tsserver" then
      local tsserver_opts = require("lsp.tsserver")
      opts = extend("force", tsserver_opts, opts)
    end

    lspconfig[server.name].setup(opts)
  end
end

return M
