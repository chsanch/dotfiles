# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working
with code in this repository.

## Repository Overview

This is a personal dotfiles repository containing configuration files for
various development tools and applications.

## Repository Structure

- Configuration directories for each tool (e.g., `nvim/`, `ghostty/`)
- Each directory contains tool-specific configuration files and documentation
- `README.md` - Main repository documentation with setup instructions

## Installation and Setup

The repository uses symbolic linking for installation:

```bash
# Clone repository
git clone <repo-url> ~/dotfiles
cd ~/dotfiles

# Example: Setup Neovim configuration
mkdir -p ~/.config
ln -sf ~/dotfiles/nvim ~/.config/nvim
```

Each configuration directory may have specific setup instructions in its
respective README.md file.

No build commands, package managers, or test suites are present - this is a
configuration-only repository.

## Development Workflow

When modifying configurations:

1. Edit files directly in the repository
2. Changes are immediately active due to symbolic linking
3. Tool-specific changes may require application restart
4. Check individual configuration READMEs for specific requirements
