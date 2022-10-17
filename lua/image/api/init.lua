local async = require "plenary.async"

local M = {}

M.get_ascii_data_sync = function(buf_path, ascii_width, ascii_height, opts, callback)
	local command = { "ascii-image-converter", buf_path, "-d", ascii_width .. "," .. ascii_height }

	if opts.render.use_dither then
		table.insert(command, 2, "-b")
		table.insert(command, 2, "--dither")
	end

	if opts.render.foreground_color then
		table.insert(command, 2, "-C")
	end

	if opts.render.background_color then
		table.insert(command, 2, "--color-bg")
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
