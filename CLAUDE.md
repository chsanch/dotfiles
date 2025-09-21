# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working
with code in this repository.

## Repository Overview

This is a personal dotfiles repository containing configuration files for
development tools, primarily focused on a comprehensive Neovim setup with LazyVim.

## Repository Structure

- `nvim/` - Complete Neovim configuration with LazyVim framework
  - `lua/config/` - Core LazyVim configuration (autocmds, keymaps, options,
    lazy.lua)
  - `lua/plugins/` - Custom plugin configurations and overrides
- `README.md` - Main repository documentation with setup instructions

## Installation and Setup

The repository uses symbolic linking for installation:

```bash
# Clone repository
git clone <repo-url> ~/dotfiles
cd ~/dotfiles

# Setup Neovim configuration
mkdir -p ~/.config
ln -sf ~/dotfiles/nvim ~/.config/nvim
```

No build commands, package managers, or test suites are present - this is a
configuration-only repository.

## Neovim Configuration Architecture

### Core Framework

- **Base**: LazyVim distribution with custom overrides
- **Plugin Manager**: lazy.nvim (automatically installs plugins on first
  launch)
- **Package Manager**: Mason (for LSP servers, formatters, linters)

### Custom Plugin Configurations

Key custom plugins in `lua/plugins/`:

- `claude-code.lua` - Claude Code integration (`greggh/claude-code.nvim`)
- `colorscheme.lua` - Oxocarbon theme configuration
- `dashboard.lua` - Custom ASCII art dashboard with image display
- `formatting.lua` - Prettier integration for web development
- `syntax.lua` - Comprehensive language support via Treesitter

### Language Support

Configured for comprehensive development across:

- Web technologies (JS/TS, HTML, CSS, React, Vue, Svelte)
- Systems languages (Rust, Go, Python, C)
- Configuration formats (TOML, YAML, JSON, Lua)
- Framework-specific (Glimmer, Astro)

### Dependencies

- **Required**: Neovim ≥0.8.0, Git, Nerd Font, Node.js
- **Optional**: `ascii-image-converter` for dashboard image display

## Development Workflow

When modifying configurations:

1. Edit files directly in the repository
2. Changes are immediately active due to symbolic linking
3. Plugin changes require Neovim restart
4. New plugins defined in `lua/plugins/` are auto-installed by lazy.nvim

## Claude Code Integration

The repository includes direct Claude Code integration via the
`claude-code.nvim` plugin, allowing seamless interaction with this AI assistant
from within the editor.
