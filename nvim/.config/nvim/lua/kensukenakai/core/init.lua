require("kensukenakai.core.options")
require("kensukenakai.core.keymaps")

-- work around the warning issue on telescope and llm-ls
local util = require("vim.lsp.util")
local old_make_position_params = util.make_position_params

util.make_position_params = function(window, offset_encoding)
	return old_make_position_params(window, offset_encoding or "utf-8")
end
