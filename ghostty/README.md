# Ghostty Configuration

This directory contains configuration files for [Ghostty], a fast,
feature-rich terminal emulator.

## Prerequisites

Ghostty must be installed first. Follow the [installation instructions].

## Setup on macOS

After installation, Ghostty loads a default config file by default. To use
this custom configuration:

1. Clear or remove the default config file:

   ```bash
   rm "$HOME/Library/Application Support/com.mitchellh.ghostty/config"
   ```

2. Ghostty will then load your user-defined config from
   `$XDG_CONFIG_HOME/ghostty/config`

For more details, see [this discussion].

[Ghostty]: https://ghostty.org/docs/install/binary
[installation instructions]: https://ghostty.org/docs/install/binary
[this discussion]: https://github.com/ghostty-org/ghostty/discussions/5687
