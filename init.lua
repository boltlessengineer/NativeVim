if vim.fn.has("nvim-0.11") == 0 then
    vim.notify("NativeVim only supports Neovim 0.11+", vim.log.levels.ERROR)
    return
end
require("core.options")
require("core.keymaps")
require("core.lsp")
require("core.treesitter")
require("core.statusline")
require("plugins.netrw")
require("plugins.fzf")
