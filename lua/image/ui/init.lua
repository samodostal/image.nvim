local M = {}

M.create_label = function(buf_path, ascii_width, horizontal_padding, show_image_dimensions, img_width, img_height)
	local label = buf_path:match "^.+/(.+)$"
	local win_width = ascii_width + horizontal_padding * 2

	if label then
		if show_image_dimensions then
			label = label .. " - " .. img_width .. "x" .. img_height .. " pixels"
		end
		local padding_left_size = math.floor((win_width - #label) / 2)
		return string.rep(" ", padding_left_size) .. label
	else
		return ""
	end
end

M.buf_clear = function(buf_id)
	vim.api.nvim_buf_set_lines(buf_id, 0, -1, true, { "" })
end

local insert_blank_lines = function(data, i)
	for _ = 1, i do
		table.insert(data, "")
	end
end

M.buf_insert_data_with_padding = function(buf_id, data, horizontal_padding, vertical_padding, label, opts)
	local data_with_padding = {}

	local horizontal_string = string.rep(" ", horizontal_padding)

	insert_blank_lines(data_with_padding, vertical_padding)
	for _, line in ipairs(data) do
		table.insert(data_with_padding, horizontal_string .. line)
	end

	table.insert(data_with_padding, "")

	if opts.render.show_label then
		table.insert(data_with_padding, label)
	else
		table.insert(data_with_padding, "")
	end

	insert_blank_lines(data_with_padding, vertical_padding - 2)

	if opts.render.foreground_color or opts.render.background_color then
		local baleia = require("baleia").setup()
		baleia.buf_set_lines(buf_id, 0, -1, false, data_with_padding)
	else
		vim.api.nvim_buf_set_lines(buf_id, 0, -1, false, data_with_padding)
	end
end

return M
