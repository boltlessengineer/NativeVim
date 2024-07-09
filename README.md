# NativeVim

NativeVim is **not**
- a distro
- a plugin
- a package

It is more similar `kickstart.nvim`

NativeVim **doesn't** include
- `lazy.nvim` or `rocks.nvim`
- `nvim-lspconfig`
- `nvim-cmp`
- `nvim-treesitter`
- and any other external neovim plugins

## Why?

This is academical project to see Native Neovim's functionality without any external plugins.
So people can understand the Neovim plugin ecosystem more and know what exact plugins they really need.

## Installation

NativeVim doesn't support any plugin manager by default.
Just clone it to `$XDG_CONFIG_HOME/nativevim` and use with `NVIM_APPNAME` environment variable.

```sh
# 1. clone it
git clone https://github.com/boltlessengineer/nativevim.git ~/.config/nativvim

# 2. use it with NVIM_APPNAME
NVIM_APPNAME=nativvim nvim
```

## TODOs

- [x] How to setup LSP without any plugins
- [ ] How to setup TreeSitter parsers without any plugins
    - [ ] How to install TreeSitter parsers manually without plugin manager
- [ ] How to manually install plugin without plugin manager
- [ ] Native solutions to famous plugins (e.g. `Comment.nvim`)
