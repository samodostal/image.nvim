local M = {}

M.set_options_before_render = function(buf_id)
	vim.api.nvim_buf_set_option(buf_id, "modifiable", true)
end

M.set_options_after_render = function(buf_id)
	vim.api.nvim_buf_set_option(buf_id, "modifiable", false)
	vim.api.nvim_buf_set_option(buf_id, "buftype", "nowrite")
end

return M
