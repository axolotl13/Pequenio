local ok, nulls = pcall(require, "null-ls")
local ok_util, util = pcall(require, "vim.lsp.util")
if not ok and ok_util then return end

local formatting = nulls.builtins.formatting

local opts = {
  sources = {
    formatting.prettier, formatting.black, formatting.shfmt,
    formatting.clang_format.with({filetypes = {"c", "cpp", "cs"}}), formatting.cmake_format,
    formatting.lua_format.with({
      extra_args = {
        "--no-keep-simple-function-one-line", "--no-break-after-operator", "--column-limit=100",
        "--break-after-table-lb", "--indent-width=2"
      }
    }), formatting.isort, formatting.codespell.with({filetypes = {"markdown"}})
    -- formatting.sqlformat.with({command = {"sqlformat -k='upper' -i='lower'"}})
  },
  on_attach = function(client, buffer)
    if client.resolved_capabilities.document_formatting then
      vim.keymap.set("n", "<leader>ff", function()
        local params = util.make_formatting_params({})
        client.request("textDocument/formatting", params, nil, buffer)
      end, {buffer = buffer})
    end
  end
  -- on_attach = function(client)
  --   if client.resolved_capabilities.document_formatting then
  --     vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()")
  --     if client.resolved_capabilities.document_highlight then
  --       vim.api.nvim_exec([[
  --     augroup document_highlight
  --       autocmd! * <buffer>
  --       autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
  --       autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
  --     augroup END
  --   ]], false)
  --     end
  --   end
  -- end
}

nulls.setup(opts)
