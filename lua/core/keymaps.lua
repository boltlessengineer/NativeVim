vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspAttach", { clear = false }),
    callback = function(ev)
        vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { buffer = ev.buf })
        vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { buffer = ev.buf })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf })
    end,
})

vim.keymap.set("n", "-", "<cmd>e %:h<cr>", { desc = "go to parent dir" })
