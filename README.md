# NativeVim

![preview](https://github.com/boltlessengineer/nativevim/assets/60088301/7d0c6841-6e4c-43e0-8982-dc58328f484c)

> NativeVim is a Neovim config without plugins

NativeVim is **not**:
- a distro (unless you call [kickstart.nvim] a neovim distro)
- a plugin/package
- or something that tries to reinvent famous plugins

NativeVim **doesn't** include:
- a package manager (e.g. `lazy.nvim` or `rocks.nvim`)
- some famous plugins like `nvim-lspconfig`, `nvim-cmp` and `nvim-treesitter`
- and any other vim/neovim plugins[^1]

NativeVim(pure Neovim) has features like:

- basic LSP features
- TreeSitter Highlighting
- completions
- snippets (including LSP and user defined ones)

and more!

> [!CAUTION]
> Since this config was developed to demonstrate the most native method, it may be slower or lack features than other configs.

## Why?

This is an academical project to see if I can write Neovim config from scratch without any external plugins.
So people can understand the Neovim plugin ecosystem more and know what exact plugins they really need.

> [!NOTE]
> I'm not saying "you don't need any of those plugins". Most plugins out there have their own reasons to be used.
> But if you're curious about the solution without them, this project is for you.

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

## LoC

```
--------------------------------------------------------------------------------
 Language             Files        Lines        Blank      Comment         Code
--------------------------------------------------------------------------------
 Lua                     10          280           27           84          169
 Markdown                 1           80           23            0           57
--------------------------------------------------------------------------------
 Total                   11          360           50           84          226
--------------------------------------------------------------------------------
```

## TODOs

- [x] How to setup LSP without any plugins
- [x] How to setup snippets?
- [x] How to setup TreeSitter parsers without any plugins (git, luarocks)
  - [x] How to install TreeSitter parsers manually without plugin manager
- [x] Native solutions to famous plugins (e.g. `Comment.nvim`)

[^1]: fzf is edge-case here but it is disabled by default

[kickstart.nvim]: https://github.com/nvim-lua/kickstart.nvim
