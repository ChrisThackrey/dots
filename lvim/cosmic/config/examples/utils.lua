-- attach any functions you want to use to M
local M = {}
local diagnostics_active = true

function M.toggle_diagnostics()
    vim.diagnostic.enable()
    diagnostics_active = true
end

return M

-- In config/mappings.lua
-- local map = require('cosmic.utils').map
-- map('n', '<leader>tt', '<cmd>lua require("cosmic.config.utils").toggle_diagnostics()<cr>')