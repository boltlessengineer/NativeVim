--[[
latest fzf comes with builtin Vim/Neovim plugin.
If you installed fzf via homebrew or manually build from source, you can use cloned fzf repo as vim plugin

see <https://github.com/junegunn/fzf/blob/master/README-VIM.md> for more information about fzf plugin
--]]
vim.opt.runtimepath:append("~/.fzf")
vim.keymap.set("n", "<leader>e", "<cmd>FZF<cr>", { desc = "Fuzzy Finder" })
