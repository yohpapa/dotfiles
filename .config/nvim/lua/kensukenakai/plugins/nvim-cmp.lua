return {
	"hrsh7th/nvim-cmp",
	-- intentionally commented out the below to enable this even during th command mode
	-- event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
		local vscode = require("luasnip.loaders.from_vscode")
		local function border(hl_name)
			return {
				-- { "╭", hl_name },
				{ "┌", hl_name },
				{ "─", hl_name },
				-- { "╮", hl_name },
				{ "┐", hl_name },
				{ "│", hl_name },
				-- { "╯", hl_name },
				{ "┘", hl_name },
				{ "─", hl_name },
				-- { "╰", hl_name },
				{ "└", hl_name },
				{ "│", hl_name },
			}
		end

		vscode.lazy_load()
		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered({
					border = border("CmpDocBorder"),
				}),
				documentation = cmp.config.window.bordered({
					border = border("CmpDocBorder"),
				}),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-e>"] = cmp.mapping.complete(),
				["<C-x>"] = cmp.mapping.abort(),
				-- Accept currently selected item. Set `select` to
				-- 'false' to only confirm explicitly selected items.
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
			-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
			-- Set configuration for specific filetype.
			--[[ cmp.setup.filetype('gitcommit', {
              sources = cmp.config.sources({
                { name = 'git' },
              }, {
                { name = 'buffer' },
              })
            })
            require("cmp_git").setup() ]]
			--
			formatting = {
				expandable_indicator = true,
				fields = { cmp.ItemField.Abbr, cmp.ItemField.Kind },
				format = lspkind.cmp_format({
					ellipsis_char = "...",
				}),
			},
			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			}),
			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
				matching = { disallow_symbol_nonprefix_matching = false },
			}),
		})
	end,
}
