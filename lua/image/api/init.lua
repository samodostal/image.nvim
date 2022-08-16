local async = require "plenary.async"

local M = {}

M.get_ascii_data_sync = function(buf_path, ascii_width, ascii_height, opts, callback)
	local command = nil
	if opts.render_using_dither then
		command = { "ascii-image-converter", buf_path, "-b", "--dither", "-d", ascii_width .. "," .. ascii_height }
	else
		command = { "ascii-image-converter", buf_path, "-d", ascii_width .. "," .. ascii_height }
	end

	vim.fn.jobstart(command, {
		stdout_buffered = true,
		on_stdout = function(_, data)
			if data then
				table.remove(data) -- remove last element as it is an empty string
				callback(data)
			end
		end,
	})
end

M.get_ascii_data = function(...)
	return async.wrap(M.get_ascii_data_sync, 5)(...)
end

return M
