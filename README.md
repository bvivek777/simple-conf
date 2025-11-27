# Simple Neovim Configuration

A clean, modern Neovim configuration built with Lua. This configuration focuses on simplicity, performance, and developer productivity with essential plugins for code completion, LSP support, fuzzy finding, and more.

## ✨ Features

- **Plugin Management**: Uses [lazy.nvim](https://github.com/folke/lazy.nvim) for fast and efficient plugin loading
- **Language Server Protocol**: Full LSP support with auto-formatting on save
- **Code Completion**: Smart autocompletion with nvim-cmp and LuaSnip snippets
- **Fuzzy Finding**: Telescope integration for files, buffers, and live grep
- **Syntax Highlighting**: Tree-sitter for accurate syntax highlighting and parsing
- **Git Integration**: Fugitive for seamless Git workflow
- **Modern UI**: Tokyo Night color scheme with lualine statusline
- **Undo History**: Visual undo tree for better history navigation
- **Rainbow Delimiters**: Color-coded brackets and delimiters for better code readability

## 📋 Requirements

- Neovim 0.9+ (with Lua support)
- Git
- Python 3 (with venv support)
- Ripgrep (`rg`) - for Telescope live grep
- Node.js 22+ (for some LSP servers)
- Various language-specific tools (Go, Rust, Zig, etc.) depending on your needs

## 🚀 Installation

### Quick Setup

1. **Clone this repository** to your Neovim config directory:

```bash
# On Linux/macOS
git clone <repository-url> ~/.config/nvim

# Or if you prefer a different location, adjust accordingly
```

2. **Install system dependencies** (optional, but recommended):

```bash
# For Debian/Ubuntu systems
sudo bash script.sh

# Or use the dev script for additional development tools
sudo bash dev.sh
```

3. **Launch Neovim** - The plugin manager will automatically install all plugins on first launch:

```bash
nvim
```

On first launch, lazy.nvim will automatically:
- Clone itself if not present
- Install all configured plugins
- Set up the configuration

## 📁 Configuration Structure

```
.
├── init.lua                 # Main entry point
├── lua/
│   └── config/
│       ├── settings.lua     # Neovim options and settings
│       ├── keymaps.lua      # Custom key mappings
│       ├── lazy.lua         # Plugin manager configuration
│       └── plugins/
│           ├── cmp.lua      # Code completion
│           ├── telescope.lua # Fuzzy finder
│           ├── treesitter.lua # Syntax highlighting
│           ├── lualine.lua  # Statusline
│           ├── tokyonight.lua # Color scheme
│           ├── fugitive.lua # Git integration
│           ├── undotree.lua # Undo tree
│           └── lsp/
│               ├── lspconfig.lua # LSP configuration
│               └── mason.lua     # LSP installer (if present)
└── lazy-lock.json          # Plugin version lock file
```

## ⌨️ Key Mappings

### Leader Key
The leader key is set to `<Space>`.

### Navigation
- `<leader>e` - Open file explorer
- `<leader>n` - Next buffer
- `<leader>b` - Previous buffer

### Telescope (Fuzzy Finder)
- `<leader><leader>` - Find files
- `<leader>ff` - Live grep (search in files)
- `<leader>fb` - Find buffers
- `<leader>fh` - Find help tags
- `<leader>fi` - Interactive grep string

### Git (Fugitive)
- `<leader>gs` - Open Git status

### Undo Tree
- `<leader>u` - Toggle undo tree

### LSP
- `gD` - Go to declaration
- `gd` - Go to definition
- `gi` - Go to implementation
- `sig` - Show signature help

### Code Completion (nvim-cmp)
- `<C-Space>` - Trigger completion
- `<C-e>` - Close completion menu
- `<C-d>` - Scroll documentation up
- `<C-f>` - Scroll documentation down
- `<CR>` - Confirm selection

### Tree-sitter
- `<C-Space>` - Init incremental selection
- `<BS>` - Decrement selection

## 🔌 Plugins Included

### Core Plugins
- **[lazy.nvim](https://github.com/folke/lazy.nvim)** - Modern plugin manager
- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** - LSP configuration
- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** - Completion engine
- **[LuaSnip](https://github.com/L3MON4D3/LuaSnip)** - Snippet engine
- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** - Fuzzy finder

### UI & Appearance
- **[tokyonight.nvim](https://github.com/folke/tokyonight.nvim)** - Color scheme
- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)** - Statusline
- **[nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)** - Icons

### Language Support
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Syntax highlighting
- **[rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim)** - Rainbow brackets
- **[nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)** - Auto-close HTML/JSX tags

### Utilities
- **[vim-fugitive](https://github.com/tpope/vim-fugitive)** - Git integration
- **[undotree](https://github.com/mbbill/undotree)** - Visual undo history

## 🛠️ Language Server Support

The configuration includes LSP setup for:
- **Go** (gopls) - with inlay hints enabled
- **Python** (pyright)
- **JSON** (jsonls)
- **CSS** (cssls)
- **HTML** (html)

Additional LSP servers can be installed via Mason (if configured) or manually.

### Auto-formatting
Files are automatically formatted on save using the configured LSP formatter.

## 🎨 Customization

### Adding Plugins
Add new plugins by creating a file in `lua/config/plugins/` or adding them to an existing plugin file. The lazy.nvim manager will automatically pick them up.

Example:
```lua
-- lua/config/plugins/myplugin.lua
return {
    "username/myplugin",
    config = function()
        -- Plugin configuration
    end,
}
```

### Changing Color Scheme
Edit `lua/config/plugins/tokyonight.lua` to use a different color scheme, or add a new color scheme plugin.

### Modifying Settings
Edit `lua/config/settings.lua` to customize Neovim options like indentation, line numbers, etc.

### Key Mappings
Add or modify key mappings in `lua/config/keymaps.lua`.

## 📝 Notes

- The configuration uses lazy loading for optimal performance
- Plugins are automatically updated when you restart Neovim (if checker is enabled)
- The `lazy-lock.json` file ensures consistent plugin versions across installations

## 📄 License

This project is released into the public domain. See [LICENSE](LICENSE) for details.

## 🤝 Contributing

Feel free to fork this configuration and adapt it to your needs. If you have improvements or suggestions, contributions are welcome!

## 🙏 Acknowledgments

- All the amazing Neovim plugin developers
- The Neovim community for excellent documentation and support

---

**Happy coding!** 🚀
