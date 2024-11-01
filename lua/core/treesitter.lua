--[[
# How to install tree-sitter parsers manually?

There are two ways to install tree-sitter parsers

- download from git repository
    1. download parser to `'runtimepath'` from git repository (e.g. clone <https://github.com/serenadeai/tree-sitter-rust> to `~/.local/share/nvim/site/pack/*/start/tree-sitter-rust`)
    2. write needed queries manually (e.g. `highlights.scm`, `folds.scm`)
- install with luarocks
    1. install parser with luarocks (e.g. `tree-sitter-css`)
    2. add installed path to `'runtimepath'`

First way is how `nvim-treesitter`'s `:TSInstall rust` works. `nvim-treesitter` also includes all needed queries for supported languages at this point (09-Jul-2024.)

If we do all manually, second way is more convenient because we don't need to manually write all needed queries for each languages.

## 1. install parser with luarocks

```console
luarocks \
    --lua-version=5.1 \
    --tree=$HOME/.local/share/nvim/rocks \
    install tree-sitter-rust
```

We need to specify local install path with `--tree` flag. Here, we are using `rocks` folder in `stdpath("data")` (see `:h $XDG_DATA_HOME`.)

## 2. add installed rock to `'packpath'`

Installed parser will be in `~/.local/share/nvim/rocks/lib/luarocks/rocks-5.1/tree-sitter-rust/0.0.27-1` where `0.0.27-1` is the installed version.

Add this path to `'packpath'` so that Neovim can recognize and register the parser and bundled queries.

```console
# create target packpath directory (`treesitter` is arbitrary)
mkdir -p $HOME/.local/share/nvim/site/pack/treesitter/start

# symlink installed rock to packpath
ln -sf $HOME/.local/share/nvim/rocks/lib/luarocks/rocks-5.1/tree-sitter-rust/0.0.27-1 $HOME/.local/share/nvim/site/pack/treesitter/start/tree-sitter-rust
```

## 3. start the parser in `FileType` AutoCommand

```lua
vim.api.nvim_create_autocmd("FileType", {
    callback = function(ev)
        pcall(vim.treesitter.start)
    end
})
```

Add this code in your config. Reopen the editor, and you are done.
--]]

vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        pcall(vim.treesitter.start)
    end
})
