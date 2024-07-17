# NativeVim

![preview](https://github.com/boltlessengineer/nativevim/assets/60088301/7d0c6841-6e4c-43e0-8982-dc58328f484c)

> NativeVim is a Neovim config without plugins

NativeVim is **not**:
- a distro
- a plugin
- a package
- or something that tries to reinvent famous plugins

It is more similar to [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) instead.

NativeVim **doesn't** include:
- a package manager (e.g. `lazy.nvim` or `rocks.nvim`)
- some famous plugins like `nvim-lspconfig`, `nvim-cmp` and `nvim-treesitter`
- and any other vim/neovim plugins[^1]

## Why?

This is academical project to see Native Neovim's functionality without any external plugins.
So people can understand the Neovim plugin ecosystem more and know what exact plugins they really need.

## Requirement

- Neovim v0.11+
- [fzf](https://github.com/junegunn/fzf) (optional)

## Installation

NativeVim doesn't support any plugin manager by default.
Just clone it to `~/.config/nativevim` and use with `NVIM_APPNAME` environment variable.

```sh
# 1. clone it
git clone https://github.com/boltlessengineer/nativevim.git ~/.config/nativevim

# 2. use it with NVIM_APPNAME
NVIM_APPNAME=nativevim nvim
```

## TODOs

- [x] How to setup LSP without any plugins
- [x] How to setup snippets?
- [x] How to setup TreeSitter parsers without any plugins (git, luarocks)
  - [x] How to install TreeSitter parsers manually without plugin manager
- [ ] How to manually install plugin without plugin manager (git, luarocks)
- [x] Native solutions to famous plugins (e.g. `Comment.nvim`)

## References

[^1]: fzf is edge-case here but it is disabled by default

[kickstart.nvim]: https://github.com/nvim-lua/kickstart.nvim
