---@type vim.lsp.Config
return {
    cmd = { "lua-language-server" },
    root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" },
    filetypes = { "lua" },
    on_init = require("util").lua_ls_on_init,
}
