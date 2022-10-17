local M = {}

M.SUPPORTED_FILE_PATTERNS = {
	"*.jpeg",
	"*.jpg",
	"*.png",
	"*.bmp",
	"*.webp",
	"*.tiff",
	"*.tif",
}

M.BUFFER_OPTIONS_BEFORE = {}

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

return M
