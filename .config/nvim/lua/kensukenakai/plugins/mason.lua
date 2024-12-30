return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },

    config = function()
        local mason = require('mason')
        local mason_lsp = require('mason-lspconfig')

        mason.setup()
        mason_lsp.setup({
            ensure_installed = {
                'bashls',     -- bash
                'lua_ls',        -- lua
                'marksman',      -- markdown
                'taplo',         -- toml
            },
        })
    end
}
