vim.g.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'
vim.o.shiftwidth = 4
vim.o.tabstop = 8
vim.o.softtabstop = -1
vim.o.shiftround = true
vim.o.expandtab = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.showmode = true
vim.o.termguicolors = true
vim.wo.number = true
vim.wo.cursorline = true
vim.wo.colorcolumn = '80'

vim.cmd('colorscheme melange')
vim.cmd('set listchars=tab:-->,space:·,extends:>,precedes:<')
vim.cmd('set mouse=')

vim.cmd('command Trim %s/\\s\\+$//g')

local set_ident = function(width, expand)
  return function()
    vim.cmd('set shiftwidth=' .. width)
    vim.cmd('set tabstop=' .. width)
    -- vim.cmd('set softtabstop=' .. width)
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

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufFilePost' }, {
  pattern = { '*.hpp' },
  callback = set_ident(4, true)
})

vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = {
    'c', 'sh', 'asm', 'make',
    'rst', 'kconfig', 'dts', 'diff'
  },
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
