return {
	"williamboman/mason.nvim",
	-- { "mason-org/mason.nvim", version = "^1.0.0" },
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		-- { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},

	config = function()
		local mason = require("mason")
		local mason_lsp = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup()

		mason_lsp.setup({
			ensure_installed = {
				"bashls", -- bash
				"lua_ls", -- lua
				"marksman", -- markdown
				"taplo", -- toml
				"nil_ls", -- nix
				-- "hls", -- haskell
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"fourmolu",
				"nixfmt",
			},
		})
	end,
}
