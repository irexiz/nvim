require'lspconfig'.rust_analyzer.setup({})

local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    extraArgs = { 
                        "--target-dir", "/tmp/rust-analyzer-check"
                    }
                },
            }
        }
    },
}

require('nvim-autopairs').setup{}

-- Get signatures (and _only_ signatures) when in argument lists.
require "lsp_signature".on_attach({
  doc_lines = 0,
  handler_opts = {
    border = "none"
  },
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig').rust_analyzer.setup {
  capabilities = capabilities
}

require('rust-tools').setup(opts)

