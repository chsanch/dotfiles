# dotfiles

This repository contains my personal configuration files (dotfiles) for
various tools and applications.

## Setup

To use these dotfiles on a new system:

1. Clone this repository:

   ```bash
   git clone <your-repo-url> ~/dotfiles
   cd ~/dotfiles
   ```

2. Create symbolic links to the appropriate locations:

### Neovim Configuration

```bash
# Create .config directory if it doesn't exist
mkdir -p ~/.config

# Link nvim configuration
ln -sf ~/dotfiles/nvim ~/.config/nvim
```

## Contents

- `nvim/` - Neovim configuration with LazyVim setup

## Notes

- The symbolic links will point to the files in this repository, so any
  changes made to the configurations will be reflected in the repo
- Make sure to backup any existing configurations before creating the
  symlinks
