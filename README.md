# Neovim101-config

This configuration is designed to be easily usable and taught in a workshop. It supports TypeScript, Python, C/C++, and Rust capabilities.

## Installation

To install, run:

```bash
git clone https://github.com/EwenSellitto/neovim101-config.git ~/.config/nvim && nvim
````

After installation, you may need to run:

```vim
:MasonInstallAll
```

to install the various LSP servers and debuggers.

## Mappings

Custom key mappings can be found in `lua/mappings.lua`.

## Plugins

Plugins are declared in `lua/plugins/init.lua`, and each plugin's configuration typically lives in `lua/configs/<plugin-name>.lua`. Plugins requiring more extensive setup are organized into their own subfolders.

## Credits

1. **NvChad** starter: [https://nvchad.com/](https://nvchad.com/)
2. **LazyVim**: [https://www.lazyvim.org/](https://www.lazyvim.org/)
