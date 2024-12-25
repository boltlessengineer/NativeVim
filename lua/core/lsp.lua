-- :h lsp-config

---server configurations copied from <https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md>
---See `:h vim.lsp.ClientConfig`
---@type table<string, vim.lsp.ClientConfig>
local server_configs = {
    lua_ls = {
        ---name field is used to identify and reuse clients
        ---see `reuse_client` field from `:h vim.lsp.start()`
        name = "lua-language-server",
        ---cmd is the command that is executed to run a language server
        cmd = { "lua-language-server" },
        ---root_markers is custom field to match root directory later
        root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" },
        ---filetypes is custom field to define filetypes the client will attach to
        filetypes = { "lua" },
        on_init = require("util").lua_ls_on_init,
    },
    ts_ls = {
        name = "typescript-language-server",
        cmd = { "typescript-language-server", "--stdio" },
        root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
        filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
        init_options = {
            hostInfo = "neovim",
        },
    },
    gopls = {
        name = "gopls",
        cmd = { "gopls" },
        root_markers = { "go.work", "go.mod", ".git" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
    },
}

-- TODO: remove codes below when Neovim 0.11 is stable
local group = vim.api.nvim_create_augroup("UserLspStart", { clear = true })
for _, config in pairs(server_configs) do
    if vim.fn.executable(config.cmd[1]) ~= 0 then
        vim.api.nvim_create_autocmd("FileType", {
            group = group,
            pattern = config.filetypes,
            callback = function (ev)
                if config.root_markers then
                    config.root_dir = vim.fs.root(ev.buf, config.root_markers)
                end
                vim.lsp.start(config, { bufnr = ev.buf })
            end,
        })
    end
end
-- setup missing lsp defaults
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        vim.keymap.set("n", "grn", vim.lsp.buf.rename, { buffer = ev.buf })
        vim.keymap.set("n", "gra", vim.lsp.buf.code_action, { buffer = ev.buf })
        vim.keymap.set("n", "grr", vim.lsp.buf.references, { buffer = ev.buf })
        vim.keymap.set("n", "gri", vim.lsp.buf.implementation, { buffer = ev.buf })
        vim.keymap.set("n", "gO", vim.lsp.buf.document_symbol, { buffer = ev.buf })
        vim.keymap.set("i", "<c-s>", vim.lsp.buf.signature_help, { buffer = ev.buf })
    end,
})
