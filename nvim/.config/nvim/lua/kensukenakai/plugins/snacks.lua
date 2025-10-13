return {
	"folke/snacks.nvim",
	priority = 1000,
	opts = {
		dashboard = {
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
				{
					section = "terminal",
					cmd = "pokeget random --hide-name; sleep .1",
					random = 10,
					pane = 2,
					indent = 4,
					height = 30,
				},
			},
		},
		animate = {},
		indent = {},
		scroll = {
			-- snaks scroll feature causes a performan issue with high repeat rate in hyprland,
			-- (stuttering upon scrolling up/down), thus disabled.
			enabled = false,
		},
	},
}
