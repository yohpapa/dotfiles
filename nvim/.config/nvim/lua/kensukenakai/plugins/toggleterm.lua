return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		options = {
			mode = "tabs",
			separator_style = "thin",
		},
	},

	config = function()
		local toggleterm = require("toggleterm")
		toggleterm.setup({
			direction = "horizontal",
			open_mapping = [[<C-\>]],
			shell = "zsh",
		})

		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit_term = Terminal:new({
			cmd = "lazygit",
			direction = "float",
			hidden = true,
		})

		function lazygit_toggle()
			lazygit_term:toggle()
		end

		vim.keymap.set("n", "<leader>lg", "<cmd>lua lazygit_toggle()<CR>", { desc = "Open LazyGit in Terminal" })
	end,
}
