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

---server configurations copied from <https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md>
---@type table<string, vim.lsp.ClientConfig>
local servers = {
    lua_ls = {
        name = "lua-language-server",
        cmd = { "lua-language-server" },
        root_dir = vim.fs.root(0, { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" }),
        filetypes = { "lua" },
        single_file_support = true,
        on_init = require("util").lua_ls_on_init,
    },
    tsserver = {
        name = "typescript-language-server",
        cmd = { "typescript-language-server", "--stdio" },
        root_dir = vim.fs.root(0, { "tsconfig.json", "jsconfig.json", "package.json", ".git" }),
        filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
        init_options = {
            hostInfo = "neovim",
        },
        single_file_support = true,
    },
}
local group = vim.api.nvim_create_augroup("UserLspStart", { clear = true })
for name, config in pairs(servers) do
    if vim.fn.executable(servers[name].cmd[1]) ~= 0 then
        vim.api.nvim_create_autocmd("FileType", {
            group = group,
            pattern = config.filetypes,
            callback = function (ev)
                local client_id = vim.lsp.start(servers[name])
                if not client_id then
                    vim.notify("failed to start server " .. name, vim.log.levels.ERROR)
                    return
                end
                vim.lsp.buf_attach_client(ev.bufnr, client_id)
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
