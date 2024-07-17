vim.snippet.add(
    "fn",
    "function ${1:name}($2)\n\t${3:-- content}\nend",
    { buffer = 0 }
)
vim.snippet.add(
    "lfn",
    "local function ${1:name}($2)\n\t${3:-- content}\nend",
    { buffer = 0 }
)
