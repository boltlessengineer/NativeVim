-- :h lsp-config

-- enable lsp completion
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
    callback = function(ev)
        vim.lsp.completion.enable(true, ev.data.client_id, ev.buf)
    end,
})

-- enable configured language servers
-- you can find server configurations from lsp/*.lua files
vim.lsp.enable('gopls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('ts_ls')
