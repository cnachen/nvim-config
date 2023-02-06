vim.g.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true
vim.o.expandtab = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.showmode = true
vim.o.termguicolors = true
vim.wo.number = true
vim.wo.cursorline = true
vim.wo.colorcolumn = '80'

vim.cmd('set mouse=')

local set_ident = function(width, expand)
  return function()
    vim.cmd('set shiftwidth=' .. width)
    vim.cmd('set softtabstop=' .. width)
    vim.cmd('set tabstop=' .. width)
    if expand then
      vim.cmd('set expandtab')
    else
      vim.cmd('set noexpandtab')
    end
  end
end

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufFilePost' }, {
  pattern = { '*.h' },
  callback = set_ident(8, false)
})

vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = { 'c', 'make' },
  callback = set_ident(8, false)
})

vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = { 'cpp', 'rust', 'python' },
  callback = set_ident(4, true)
})

vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = { 'lua' },
  callback = set_ident(2, true)
})
