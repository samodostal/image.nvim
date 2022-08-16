local M = {}

M.DEFAULT_OPTS = {
	min_padding = 5,
	show_label = true,
	render_using_dither = true,
}

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
