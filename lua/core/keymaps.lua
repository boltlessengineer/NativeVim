-- TODO: remove this file when Neovim 0.11 is stable

vim.keymap.set({ "n", "x" }, "]d", function() vim.diagnostic.goto_next() end, { desc = "Next Diagnostic" })
vim.keymap.set({ "n", "x" }, "[d", function() vim.diagnostic.goto_prev() end, { desc = "Prev Diagnostic" })
vim.keymap.set({ "n", "x" }, "]e", function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end, { desc = "Next Error" })
vim.keymap.set({ "n", "x" }, "[e", function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end, { desc = "Prev Error" })
vim.keymap.set({ "n", "x" }, "]w", function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN }) end, { desc = "Next Warning" })
vim.keymap.set({ "n", "x" }, "[w", function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN }) end, { desc = "Prev Warning" })

vim.keymap.set({ "i", "s" }, "<tab>", function()
    if vim.snippet.active({ direction = 1 }) then
        return "<cmd>lua vim.snippet.jump(1)<cr>"
    else
        return "<tab>"
    end
end, { desc = "snippet jump", expr = true })
vim.keymap.set({ "i", "s" }, "<s-tab>", function()
    if vim.snippet.active({ direction = -1 }) then
        return "<cmd>lua vim.snippet.jump(-1)<cr>"
    else
        return "<tab>"
    end
end, { desc = "snippet jump backward", expr = true })
