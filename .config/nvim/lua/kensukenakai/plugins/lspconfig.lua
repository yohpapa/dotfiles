return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},

	config = function()
		local lspconfig = require("lspconfig")
		local mason_lsp = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap
		local capabilities = cmp_nvim_lsp.default_capabilities()
		local severity = vim.diagnostic.severity

		-- diagnostic icons
		vim.diagnostic.config({
			signs = {
				text = {
					[severity.ERROR] = "", -- ' ',
					[severity.WARN] = "", -- ' ',
					[severity.HINT] = "", -- '󰠠 ',
					[severity.INFO] = "", -- ' ',
				},
			},
		})

		-- keybindings
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
			end,
		})

		mason_lsp.setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["bashls"] = function()
				lspconfig["bashls"].setup({
					capabilities = capabilities,
					filetypes = { "sh", "bash", "zsh" },
				})
			end,
			["marksman"] = function()
				lspconfig["bashls"].setup({
					capabilities = capabilities,
					filetypes = { "markdown", "markdown.mdx", "md" },
				})
			end,
		})
	end,
}
