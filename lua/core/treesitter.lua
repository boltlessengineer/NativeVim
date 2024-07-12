--[[
# How to install tree-sitter parsers manually?

There are two ways to install tree-sitter parsers

- download from git repository
    1. download parser from git repository (e.g. <https://github.com/serenadeai/tree-sitter-scss>)
    2. write needed queries manually (e.g. `highlights.scm`, `folds.scm`)
- install with luarocks
    1. install parser with luarocks (e.g. `tree-sitter-css`)
    2. symlink the installed parser to `'packpath'`

First way is how `nvim-treesitter`'s `:TSInstall scss` works. `nvim-treesitter` also includes all needed queries for supported languages at this point (09-Jul-2024.)

If we do all manually, second way is more convenient because we don't need to manually write all needed queries for each languages.

## 1. install parser with luarocks

```sh
luarocks \
    --force-lock \
    --lua-version=5.1 \
    --tree=~/.local/share/nvim/rocks
    --dev # you may not need `--dev` flag
    install tree-sitter-scss
```

We need to specify local install path with `--tree` flag. Here, we are using `rocks` folder in `stdpath("data")` (see `:h $XDG_DATA_HOME`.)

## 2. create a symlink in `'packpath'`

Installed parser will be in `~/.local/share/nvim/rocks/lib/luarocks/rocks-5.1/tree-sitter-scss/scm-1` where `scm-1` is the installed version.
Neovim searches tree-sitter parsers in `'packpath'`, so let's create a symlink there.

```sh
mkdir -p ~/.local/share/nvim/site/pack/treesitter/opt
ln -s ~/.local/share/nvim/rocks/lib/luarocks/rocks-5.1/tree-sitter-scss/scm-1 \
    ~/.local/share/nvim/site/pack/treesitter/opt/tree-sitter-scss
```

Any folder structure of `$XDG_DATA_HOME/nvim/site/pack/*/opt` is fine.

## 3. load the packages & start automatically

```lua
vim.cmd.packadd("tree-sitter-scss")

vim.api.nvim_create_autocmd("FileType", {
    callback = function(ev)
        pcall(vim.treesitter.start)
    end
})
```

Add this code in your config. Reopen the editor, and you are done.
--]]

local SERVERS = {
    "https://luarocks.org/manifests/neorocks",
    "https://nvim-neorocks.github.io/rocks-binaries",
    "https://nvim-neorocks.github.io/rocks-binaries-dev",
}
local luarocks_bin = "luarocks"
if vim.fn.executable(luarocks_bin) == 0 then
    return
end
local rocks_path = vim.fs.joinpath(vim.fn.stdpath("data") --[[@as string]], "rocks")
local site_path = vim.fs.joinpath(vim.fn.stdpath("data") --[[@as string]], "site")
vim.fn.mkdir(vim.fs.joinpath(site_path, "pack", "treesitter", "opt"), "p")

function _G.install(package_name, dev)
    local luarocks_cmd = {
        luarocks_bin,
        "--force-lock",
        "--lua-version=5.1",
        "--tree=/home/ubuntu/.local/share/nvim-noplugin/rocks",
    }
    local install_cmd = vim.list_extend(luarocks_cmd, { "install", package_name })
    if dev then
        table.insert(install_cmd, "--dev")
    end
    for _, server in pairs(SERVERS) do
        table.insert(install_cmd, ("--server='%s'"):format(server))
    end
    local obj = vim.system(install_cmd):wait()
    if obj.code ~= 0 and not dev then
        vim.print("failed, retrying with dev version")
        return _G.install(package_name, true)
    end
    vim.print(obj)
end

local obj = vim.system({
    luarocks_bin,
    "--force-lock",
    "--lua-version=5.1",
    "--tree=/home/ubuntu/.local/share/nvim-noplugin/rocks",
    "list",
    "--porcelain",
}):wait()
for name, version, target_version in obj.stdout:gmatch("(%S+)%s+(%S+)%s+(%S+)%s+%S+") do
    version = version:match("([^-]+)")
    target_version = target_version:match("([^-]+)")
    local target = vim.fn.glob(vim.fs.joinpath(rocks_path, "lib", "luarocks", "rocks-5.1", name, version .. "*"))
    ---@diagnostic disable-next-line: undefined-field
    vim.uv.fs_symlink(
        target,
        vim.fs.joinpath(site_path, "pack", "treesitter", "opt", name),
        function (err, success)
            vim.print(name, err, success)
        end
    )
    vim.opt.runtimepath:append(target)
end

-- local luarocks_path = {
--     vim.fs.joinpath(rocks_path, "share", "lua", "5.1", "?.lua"),
--     vim.fs.joinpath(rocks_path, "share", "lua", "5.1", "?", "init.lua"),
-- }
-- package.path = package.path .. ";" .. table.concat(luarocks_path, ";")

pcall(vim.cmd.packadd, "tree-sitter-javascript")
pcall(vim.cmd.packadd, "tree-sitter-ecma")
pcall(vim.cmd.packadd, "tree-sitter-gomod")

vim.api.nvim_create_autocmd("FileType", {
    callback = function(ev)
        pcall(vim.treesitter.start)
    end
})
