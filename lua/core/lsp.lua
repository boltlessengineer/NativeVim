-- :h lsp-defaults
--
-- NORMAL MODE
-- K        : hover
-- grn      : rename
-- gra      : code action
-- grr      : references
-- CTRL-]   : definition
-- CTRL-W_] : definition in new window
-- CTRL-W_} : definition in preview window
--
-- VISUAL MODE
-- gq : format
--
-- INSERT MODE
-- CTRL-S        : signature help
-- CTRL-X_CTRL-O : completion

---simple utility function to evaluate `vim.fs.root` on `FileType` events (#5)
---@see vim.fs.root
---@see lspconfig.util.root_pattern
local function root_pattern(marker)
    return function ()
        return vim.fs.root(0, marker)
    end
end

---server configurations copied from <https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md>
---@type table<string, vim.lsp.ClientConfig>
local servers = {
    lua_ls = {
        name = "lua-language-server",
        cmd = { "lua-language-server" },
        _root_dir = root_pattern({ ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" }),
        filetypes = { "lua" },
        on_init = require("util").lua_ls_on_init,
    },
    tsserver = {
        name = "typescript-language-server",
        cmd = { "typescript-language-server", "--stdio" },
        _root_dir = root_pattern({ "tsconfig.json", "jsconfig.json", "package.json", ".git" }),
        filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
        init_options = {
            hostInfo = "neovim",
        },
    },
    gopls = {
        name = "gopls",
        cmd = { "gopls" },
        _root_dir = root_pattern({ "go.work", "go.mod", ".git" }),
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
    },
}
local group = vim.api.nvim_create_augroup("UserLspStart", { clear = true })
for _, config in pairs(servers) do
    if vim.fn.executable(config.cmd[1]) ~= 0 then
        vim.api.nvim_create_autocmd("FileType", {
            group = group,
            pattern = config.filetypes,
            callback = function (ev)
                if config._root_dir then
                    config.root_dir = config._root_dir()
                end
                vim.lsp.start(config, { bufnr = ev.buf })
            end,
        })
    end
end
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspAttach", { clear = false }),
    callback = function(ev)
        vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, { autotrigger = false })
    end
})
