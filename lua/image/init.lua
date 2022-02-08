local M = {}

local config = require("config")

function M.setup(opts)
	opts = opts or {}
	opts = vim.tbl_deep_extend("force", config.DEFAULT_OPTS, opts)

	print("Image.nvim plugin set-up with opts: ", opts)
end

return M
