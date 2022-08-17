local M = {}

local async = require "plenary.async"

local config = require "image.config"
local ui = require "image.ui"
local dimensions = require "image.dimensions"
local api = require "image.api"
local options = require "image.options"

local global_opts = nil

local on_image_open = function()
	local buf_id = 0
	local buf_path = vim.api.nvim_buf_get_name(buf_id)

	local ascii_width, ascii_height, horizontal_padding, vertical_padding =
		dimensions.calculate_ascii_width_height(buf_id, buf_path, global_opts)

	options.set_options_before_render(buf_id)
	ui.buf_clear(buf_id)

	local label = ui.create_label(buf_path, ascii_width, horizontal_padding)

	local ascii_data = api.get_ascii_data(buf_path, ascii_width, ascii_height, global_opts)
	ui.buf_insert_data_with_padding(buf_id, ascii_data, horizontal_padding, vertical_padding, label, global_opts)

	options.set_options_after_render(buf_id)
end

function M.setup(user_opts)
	user_opts = user_opts or {}
	global_opts = vim.tbl_deep_extend("force", config.DEFAULT_OPTS, user_opts)

	local autocmds = { "BufRead" }
	if global_opts.events.update_on_nvim_resize then
		table.insert(autocmds, "VimResized")
	end

	vim.api.nvim_create_autocmd(autocmds, {
		group = vim.api.nvim_create_augroup("ImageOpen", { clear = false }),
		pattern = config.SUPPORTED_FILE_PATTERNS,
		callback = function()
			async.run(on_image_open)
		end,
	})
end

return M
