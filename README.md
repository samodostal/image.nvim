# image.nvim
**Image Viewer as ASCII Art for Neovim**

<p align="center">
  <img src="assets/demo.gif" alt="animated" width="100%" />
</p>

## Features
- Supports many file formats (.png, .jpg, .jpeg, .bmp, .webp, ...)
- Almost **no code** runs on startup
- Rendering with a [dither](https://en.wikipedia.org/wiki/Dither) method makes images more visible than traditional ascii art
- Images are centered and have labels!

## How does it work?
When you open an image file (e.g. `portrait.png`, the open buffer becomes non-editable and non-saveable to ensure the file won't be overwritten. Then the buffer is filled with the ascii art generated by [ascii-image-converter](https://github.com/TheZoraiz/ascii-image-converter). I found out that plugin similiar to this was already implemented for vim in vimscript: [image.vim](https://github.com/ashisha/image.vim), so you can consider this a modern, lua version.

## Prerequisites
- Install [ascii-image-converter](https://github.com/TheZoraiz/ascii-image-converter) and make sure it is in your path
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) (See Install section)
- Neovim 0.7+

## Install 
With packer
```lua
use {
  'samodostal/image.nvim',
  requires = {
    'nvim-lua/plenary.nvim'
  },
},
```
With vim.plug
```lua
Plug 'samodostal/image.nvim'
Plug 'nvim-lua/plenary.nvim'
```

## Setup
```lua
-- Require and call setup function somewhere in your init.lua
require('image').setup {
  min_padding = 5,
  show_label = true,
  render_using_dither = true,
}
```

## TODO
- [ ] Support for gifs
