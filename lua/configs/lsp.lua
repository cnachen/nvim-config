-- LSP attach function
local on_attach = function(client, bufnr)
  local nmap = function(keys, func, desc)
    if desc then desc = 'LSP: ' .. desc end
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Setup mason
require('mason').setup()

-- Define servers and their settings
local servers = {
  clangd = {
    cmd = { '/usr/bin/clangd', '--enable-config' },
    settings = {
      clangd = {
        includePaths = { '${workspaceFolder}/**' },
      },
    },
  },
  pyright = {},
  lua_ls = {
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT' },
        workspace = { checkThirdParty = false },
        diagnostics = { globals = { 'vim', 'require' } },
        telemetry = { enable = false },
      },
    },
  },
}

-- nvim-cmp completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup neodev for Lua development
require('neodev').setup()

-- Configure servers using new Neovim 0.11+ API
for name, config in pairs(servers) do
  vim.lsp.config(name, vim.tbl_extend('force', {
    capabilities = capabilities,
    on_attach = on_attach,
  }, config))
end

-- Setup mason-lspconfig to ensure servers are installed
require('mason-lspconfig').setup {
  ensure_installed = vim.tbl_keys(servers),
}
