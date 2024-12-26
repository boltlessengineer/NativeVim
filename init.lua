if vim.fn.has("nvim-0.10") == 0 then
    vim.notify("NativeVim-stable only supports Neovim 0.10+", vim.log.levels.ERROR)
    return
end

require("core.options")
require("core.treesitter")
require("core.lsp")
require("core.statusline")
require("core.snippet")
