require('mason').setup {}

require('mason-lspconfig').setup {
  ensure_installd = {
    'clangd', 'pylsp', 'lua_ls',
    'taplo', 'rust_analyzer',
  },
  automatic_installation = true,
}
