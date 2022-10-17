local M = {}

M.DEFAULT_OPTS = {
	render = {
		min_padding = 5,
		show_label = true,
		use_dither = true,
		foreground_color = false,
		background_color = false,
	},
	events = {
		update_on_nvim_resize = true,
	},
}

-- NOTE: There is no WinResized event yet. https://github.com/neovim/neovim/issues/11532
-- update_on_window_resize

-- NOTE: File changed shell not working
-- update_on_file_change

M.SUPPORTED_FILE_PATTERNS = {
	"*.jpeg",
	"*.jpg",
	"*.png",
	"*.bmp",
	"*.webp",
	"*.tiff",
	"*.tif",
	"*.gif",
}

return M
