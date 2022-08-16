local M = {}

M.buf_clear = function(buf_id)
	vim.api.nvim_buf_set_lines(buf_id, 0, -1, true, { "" })
end

M.buf_insert_data = function(buf_id, data)
	vim.api.nvim_buf_set_lines(buf_id, 0, -1, false, data)
end

return M
