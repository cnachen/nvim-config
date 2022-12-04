require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'latex', 'html', 'css', 'vim', 'lua',
    'javascript', 'typescript', 'c', 'rust', 'toml',
    'haskell', 'python', 'cpp', 'ocaml', 'go',
    'yaml', 'help',
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  -- incremental_selection = {
  --   enable = true,
  --   keymaps = {
  --     init_selection = '<CR>',
  --     node_incremental = '<CR>',
  --     node_decremental = '<BS>',
  --     scope_incremental = '<TAB>',
  --   }
  -- },
  indent = {
    enable = true
  }
}
