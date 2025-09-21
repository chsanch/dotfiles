# 💤 Personal Neovim Configuration

A customized [LazyVim](https://github.com/LazyVim/LazyVim) setup with
additional plugins and configurations tailored for web development and general
programming.

## Features

- **Custom Dashboard**: ASCII art dashboard with terminal-based image display
- **Enhanced Syntax Support**: Comprehensive language support including web frameworks
- **Claude Code Integration**: Direct integration with Anthropic's Claude Code
- **Oxocarbon Theme**: Modern, low-contrast colorscheme
- **Auto-formatting**: Prettier integration for web development
- **Auto-closing Tags**: Smart tag completion for web languages

## Prerequisites

### Required Dependencies

1. **Neovim** (>= 0.8.0)
2. **Git**
3. **A Nerd Font** (for icons)
4. **Node.js** (for language servers and formatters)

### Optional Dependencies (for enhanced dashboard)

- **ascii-image-converter**: For displaying images in the dashboard

  ```bash
  # macOS
  brew install ascii-image-converter

  # Linux (using go)
  go install github.com/TheZoraiz/ascii-image-converter@latest

  # Or download from releases: https://github.com/TheZoraiz/ascii-image-converter/releases
  ```

## Installation

1. **Backup existing config** (if any):

   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone this configuration**:

   ```bash
   git clone <your-repo-url> ~/.config/nvim
   ```

3. **Start Neovim**:

   ```bash
   nvim
   ```

   LazyVim will automatically install all plugins on first launch.

## Configuration Structure

```text
lua/
├── config/
│   ├── autocmds.lua    # Auto commands
│   ├── keymaps.lua     # Custom key mappings
│   ├── lazy.lua        # Lazy plugin manager setup
│   └── options.lua     # Neovim options
└── plugins/
    ├── claude-code.lua     # Claude Code integration
    ├── colorscheme.lua     # Oxocarbon theme configuration
    ├── dashboard.lua       # Custom dashboard with ASCII art
    ├── formatting.lua      # Prettier formatting setup
    └── syntax.lua          # Enhanced syntax highlighting
```

## Custom Plugins

### 🤖 Claude Code Integration

- **Plugin**: `greggh/claude-code.nvim`
- **Purpose**: Direct integration with Anthropic's Claude Code
- **Dependencies**: `nvim-lua/plenary.nvim`

### 🎨 Oxocarbon Theme

- **Plugin**: `nyoom-engineering/oxocarbon.nvim`
- **Purpose**: Modern, low-contrast colorscheme
- **Note**: Replaces default LazyVim themes

### 🖼️ Custom Dashboard

- **Plugin**: Built on `snacks.nvim`
- **Features**:
  - ASCII art header
  - Terminal-based image display using `ascii-image-converter`
  - Recent files display
  - Custom layout with dual panes

### 🏷️ Enhanced Auto-tagging

- **Plugin**: `windwp/nvim-ts-autotag`
- **Supported Languages**: HTML, JavaScript, TypeScript, React, Vue, Svelte, Glimmer

### 🎯 Comprehensive Language Support

Treesitter parsers for:

- **Web**: JavaScript, TypeScript, HTML, CSS
- **Frameworks**: Glimmer, Svelte, Astro
- **Systems**: Rust, Go, Python, C, Ruby
- **Config**: TOML, YAML, JSON, Lua
- **Documentation**: Markdown, JSDoc

## Formatting Configuration

- **Primary Formatter**: Prettier
- **Supported Languages**: JavaScript, TypeScript, HTML, Glimmer templates
- **Note**: Requires project-local prettier installation (no global dependency)

## Customization

### Adding New Languages

Edit `lua/plugins/syntax.lua` to add new Treesitter parsers:

```lua
ensure_installed = {
  "your_language_here",
  -- ... existing languages
}
```

### Changing Colorscheme

Edit `lua/plugins/colorscheme.lua`:

```lua
opts = {
  colorscheme = "your_preferred_theme",
}
```

### Custom Key Mappings

Add your mappings to `lua/config/keymaps.lua`

## Troubleshooting

### Dashboard Image Not Showing

1. Ensure `ascii-image-converter` is installed and in PATH
2. Verify the image path: `~/.config/nvim/nvim.png`
3. Check terminal compatibility for color output

### Formatting Not Working

1. Ensure prettier is installed in your project: `npm install prettier`
2. Check for prettier config file in your project root
3. Verify the file type is supported in `formatting.lua`

## Resources

- [LazyVim Documentation](https://lazyvim.github.io/)
- [Neovim Documentation](https://neovim.io/doc/)
- [ascii-image-converter](https://github.com/TheZoraiz/ascii-image-converter)
