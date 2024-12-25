---@type vim.lsp.Config
return {
    cmd = { "typescript-language-server", "--stdio" },
    root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    init_options = {
        hostInfo = "neovim",
    },
}
