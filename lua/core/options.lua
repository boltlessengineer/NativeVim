vim.cmd([[let $LANG='en_US.UTF-8']])

vim.opt.diffopt:append("linematch:60")
vim.o.clipboard = "unnamedplus"
vim.o.cmdheight = 1
vim.o.cmdwinheight = 10
vim.o.colorcolumn = "80"
vim.o.completeopt = "menu,menuone,fuzzy"
vim.o.conceallevel = 0
vim.o.confirm = true
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.foldcolumn = "0"
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
if vim.fn.executable("rg") ~= 0 then
    vim.o.grepprg = "rg --vimgrep"
end
vim.o.inccommand = "split"
vim.o.ignorecase = true
vim.o.laststatus = 2
vim.o.list = true
vim.opt.listchars = {
    -- eol = "¬",
    tab = "▏ ",
    trail = "·", -- Dot Operator (U+22C5)
    extends = "»", -- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
    precedes = "«", -- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
}
vim.o.mouse = "nv"
vim.o.number = true
vim.o.pumblend = 0
vim.o.pumheight = 10
vim.o.relativenumber = true
vim.o.scrolloff = 5
vim.opt.sessionoptions = { "buffers", "curdir", "folds", "help", "tabpages", "winsize" }
vim.o.shiftround = true
vim.o.shiftwidth = 4
vim.opt.shortmess:append({
    W = true, -- Don't print "written" when editing
    I = false, -- No splash screen
    c = true, -- Don't show ins-completion-menu messages (match 1 of 2)
    C = true, -- Don't show messages while scannign ins-completion items (scanning tags)
    s = true, -- Don't show "Search hit BOTTOM" message
})
-- vim.o.showbreak = "↳ "
vim.o.showmode = true
vim.o.sidescrolloff = 6
vim.o.signcolumn = "yes"
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.spelllang = "en,cjk"
vim.o.splitkeep = "cursor"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.tabstop = 4
vim.o.termguicolors = true
vim.o.timeoutlen = 500
vim.o.undofile = true
vim.o.undolevels = 10000
vim.o.updatetime = 200
-- vim.o.winbar = [[%f %h%w%m%r%=%-14.(%l,%c%V%) %P]]
vim.o.winminwidth = 10
vim.o.wrap = false

vim.g.mapleader = " "

vim.g.editorconfig = true

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
