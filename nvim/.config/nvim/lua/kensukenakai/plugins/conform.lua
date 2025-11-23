return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				markdown = { "prettier" },
				css = { "prettier" },
				yaml = { "prettier" },
				toml = { "prettier" },
				haskell = { "ormolu", "stylish-haskell" },
				zig = { "zig fmt" },
			},

			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})
	end,
}
