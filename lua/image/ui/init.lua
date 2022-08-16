local M = {}

M.buf_clear = function(buf_id)
	vim.api.nvim_buf_set_lines(buf_id, 0, -1, true, { "" })
end

M.buf_insert_data_with_padding = function(buf_id, data, horizontal_padding, vertical_padding)
	local horizontal_string = string.rep(" ", horizontal_padding)

	local processed_data = {}

	for i = 1, vertical_padding do
		table.insert(processed_data, "")
	end

	for _, line in ipairs(data) do
		table.insert(processed_data, horizontal_string .. line)
	end

	for i = 1, vertical_padding do
		table.insert(processed_data, "")
	end

	vim.api.nvim_buf_set_lines(buf_id, 0, -1, false, processed_data)
end

return M
