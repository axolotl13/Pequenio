return {
  cmd = {"typescript-language-server", "--stdio"},
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end
}
