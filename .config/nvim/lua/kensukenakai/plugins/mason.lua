return {
  "williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
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
				"hls", -- haskell
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"fourmolu",
			},
		})
	end,
}
