return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "keymaps",
		},
	},

	config = function()
		local whichkey = require("which-key")
		whichkey.add({
			{ "<leader>s", group = "window" },
			{ "<leader>t", group = "tab" },
		})
	end,
}
