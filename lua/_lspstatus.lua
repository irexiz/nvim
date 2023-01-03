local lsp_status = require('lsp-status')
  lsp_status.config({
    status_symbol = '',
  })
lsp_status.register_progress()

local lspconfig = require('lspconfig')

local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },
}

require('rust-tools').setup(opts)

-- Some arbitrary servers
lspconfig.rust_analyzer.setup({
  on_attach = lsp_status.on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    enable = true,
                    command = "check",
                    extraArgs = { "--target-dir", "/tmp/rust-analyzer-check"}
                },
                cargo = {
                    allFeatures = true,
                }
            }
        },
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_actions = {
          -- the border that is used for the hover window
          -- see vim.api.nvim_open_win()
          border = {
            { "╭", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╮", "FloatBorder" },
            { "│", "FloatBorder" },
            { "╯", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╰", "FloatBorder" },
            { "│", "FloatBorder" },
          },

          -- whether the hover action window gets automatically focused
          -- default: false
          auto_focus = false,
        },

        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },
  capabilities = lsp_status.capabilities
})
