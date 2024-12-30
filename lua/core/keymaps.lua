-- TODO: remove this file when Neovim 0.11 is stable

vim.keymap.set({ "n", "x" }, "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
vim.keymap.set({ "n", "x" }, "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })

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
