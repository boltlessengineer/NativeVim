# NativeVim

![preview](https://github.com/boltlessengineer/nativevim/assets/60088301/7d0c6841-6e4c-43e0-8982-dc58328f484c)

> NativeVim is a Neovim config without plugins

NativeVim is **not**:
- a distro[^1]
- a plugin/package
- or something that tries to reinvent famous plugins

NativeVim **doesn't** include:
- a package manager (e.g. `lazy.nvim` or `rocks.nvim`)
- famous plugins like `nvim-lspconfig`, `nvim-cmp` and `nvim-treesitter`
- and any other vim/neovim plugins[^2]

NativeVim has features like:

- basic LSP functionalities
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

- Neovim v0.10+
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

## Lines of Code

```
--------------------------------------------------------------------------------
 Language             Files        Lines        Blank      Comment         Code
--------------------------------------------------------------------------------
 Lua                     10          324           48          108          168
 Markdown                 1           71           21            0           50
--------------------------------------------------------------------------------
 Total                   11          395           69          108          218
--------------------------------------------------------------------------------
```

[^1]: unless you call [kickstart.nvim] a Neovim distro
[^2]: fzf is edge-case here but it is disabled by default

[kickstart.nvim]: https://github.com/nvim-lua/kickstart.nvim
