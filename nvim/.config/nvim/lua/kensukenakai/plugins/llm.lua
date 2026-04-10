return {
	"huggingface/llm.nvim",
	enabled = true,
	event = { "BufReadPost", "BufNewFile", "InsertEnter", "VeryLazy" },
	keys = {
		{
			"<c-j>",
			function()
				require("llm.completion").complete()
			end,
			mode = "i",
			desc = "complete",
		},
	},
	opts = {
		lsp = {
			enabled = true,
			bin_path = "/run/current-system/sw/bin/llm-ls",
			on_init = function(client)
				client.offset_encoding = "utf-8"
			end,
		},
		backend = "ollama",
		-- model = "qwen2.5-coder:7b",
		-- model = "deepseek-coder:1.3b",
		-- model = "starcoder2:3b",
		-- model = "starcoder2:15b",
		-- model = "starcoder2:7b",
		model = "starcoder2-gpu",
		url = "http://localhost:11434",

		fim = {
			enabled = true,
			prefix = "<fim_prefix>",
			middle = "<fim_middle>",
			suffix = "<fim_suffix>",
		},

		request_body = {
			raw = true,
			stream = false,
			options = {
				temperature = 0,
				num_predict = 32,
				stop = {
					"<fim_prefix>",
					"<fim_middle>",
					"<fim_suffix>",
					"<file_sep>",
					"<file_separator>",
					"<|end_of_text|>",
					"<|end_of_function|>",
					"```",
				},
			},
		},

		enable_suggestions_auto_complete = true,
		debounce_ms = 200,
		context_window = 1024,
		display_automatically = true,
		tokenizer_path = nil,
		accept_keymap = "<C-A>",
	},
}
