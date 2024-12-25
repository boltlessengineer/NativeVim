local M = {}

function M.lua_ls_on_init(client)
    local path = vim.tbl_get(client, "workspace_folders", 1, "name")
    if not path then
        return
    end
    -- override the lua-language-server settings for Neovim config
    client.settings = vim.tbl_deep_extend('force', client.settings, {
        Lua = {
            runtime = {
                version = 'LuaJIT'
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                    -- Depending on the usage, you might want to add additional paths here.
                    -- "${3rd}/luv/library"
                    -- "${3rd}/busted/library",
                }
                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                -- library = vim.api.nvim_get_runtime_file("", true)
            }
        }
    })
end

return M
