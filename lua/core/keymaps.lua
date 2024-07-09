vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspAttach", { clear = false }),
    callback = function(ev)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = ev.buf })
        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { buffer = ev.buf })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf })
        vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = ev.buf })
        vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { buffer = ev.buf })
        vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { buffer = ev.buf })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf })
        vim.keymap.set("i", "<c-k>", vim.lsp.buf.signature_help, { buffer = ev.buf })
        vim.keymap.set("i", "<c-s>", vim.lsp.buf.signature_help, { buffer = ev.buf })
    end,
})
