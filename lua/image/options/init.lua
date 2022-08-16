local M = {}

M.set_options_before_render = function(buf_id)
	vim.api.nvim_buf_set_option(buf_id, "modifiable", true)
end

M.set_options_after_render = function(buf_id)
	vim.api.nvim_buf_set_option(buf_id, "modifiable", false)
	vim.api.nvim_buf_set_option(buf_id, "buftype", "nowrite")

	vim.cmd [[ setlocal nonumber ]]
	vim.cmd [[ setlocal norelativenumber ]]
	vim.cmd [[ setlocal colorcolumn=0 ]]
	vim.cmd [[ setlocal signcolumn=no ]]
	vim.cmd [[ setlocal nolist ]]
end

return M
