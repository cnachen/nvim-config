require('mason').setup {}

require('mason-lspconfig').setup {
  ensure_installd = {
    'clangd', 'pylsp', 'sumneko_lua',
    'taplo', 'rust_analyzer',
  },
  automatic_installation = false,
}
