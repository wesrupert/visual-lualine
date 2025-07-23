# Visual-lualine

A lualine plugin to show the current visual selection statistics.

## Requirements
- [x] [Neovim](https://neovim.io/)
- [x] [Lualine](https://github.com/nvim-lualine/lualine.nvim)

## Installation

### Using lazy.nvim
```lua
{ 'wesrupert/visual-lualine' }
```

### Using packer.nvim
```lua
use 'wesrupert/visual-lualine'
```

### Using vim-plug
```lua
Plug 'wesrupert/visual-lualine'
```

## Setup

Add the component `visual` to one of your lualine sections.

**Example:**

```lua
lualine.setup({
  tabline = {
    lualine_z = { 'filename', 'visual' },
  },
})
```

Customization is available. The default options are listed below.

**Example:**

```lua
lualine.setup({
  tabline = {
    lualine_z = {
      'filename',
      {
        'visual',
        char_count = true,        -- Show the number of selected characters
        word_count = true,        -- Show the number of selected words
        line_count = true,        -- Show the number of selected lines
        format = '[%dC:%dW:%dL]', -- The format string to customize the display
      }
    },
  },
})
```