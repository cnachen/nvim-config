vim.g.mapleader = ';'
vim.g.maplocalleader = ';'

local opt = { noremap = true }

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<C-T>', ':terminal<CR>', opt)
map('n', '<C-u>', '9k', opt)
map('n', '<C-d>', '9j', opt)

map('n', '<leader>b', ':NvimTreeToggle<CR>', opt)
map('n', '<leader>q', ':ColorizerToggle<CR>', opt)
map('n', '<leader>p', ':TroubleToggle<CR>', opt)
map('n', '<leader>h', '<C-w>h', opt)
map('n', '<leader>j', '<C-w>j', opt)
map('n', '<leader>k', '<C-w>k', opt)
map('n', '<leader>l', '<C-w>l', opt)
map('n', '<leader>c', '<C-w>c', opt)
map('n', '<leader>o', '<C-w>o', opt)
map('n', '<leader>n', '<C-w>n', opt)
map('n', '<leader>v', '<C-w>v', opt)

