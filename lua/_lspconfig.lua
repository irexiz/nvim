require'lspconfig'.rust_analyzer.setup({})

require('nvim-autopairs').setup{}

-- Get signatures (and _only_ signatures) when in argument lists.
require "lsp_signature".on_attach({
  doc_lines = 0,
  handler_opts = {
    border = "none"
  },
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig').rust_analyzer.setup {
  capabilities = capabilities
}

require('rust-tools').setup(opts)

