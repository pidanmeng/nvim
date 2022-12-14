return {
  on_setup = function(server)
    server:setup({
      init_options = {
        clientId = 'client_4tNhxRSGQvNtqcVkLmzW7A',
      },
      capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
      flags = {
        debounce_text_changes = 150,
      },
      on_attach = function(client, _)
        -- 禁用格式化功能，交给专门插件插件处理
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
      end,
    })
  end,
}
