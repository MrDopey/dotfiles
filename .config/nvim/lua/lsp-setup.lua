-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
  nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- document existing key chains
wk = require('which-key')
wk.add {
  { '<leader>c', group = '[C]ode',      hidden = true },
  { '<leader>d', group = '[D]ocument',  hidden = true },
  { '<leader>g', group = '[G]it',       hidden = true },
  { '<leader>h', group = 'Git [H]unk',  hidden = true },
  { '<leader>r', group = '[R]ename',    hidden = true },
  { '<leader>s', group = '[S]earch',    hidden = true },
  { '<leader>t', group = '[T]oggle',    hidden = true },
  { '<leader>w', group = '[W]orkspace', hidden = true },
}

-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
-- require('mason').setup()
-- require('mason-lspconfig').setup()

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  rust_analyzer = {},
  ruff = {},
  ts_ls = {},
  -- html = { filetypes = { 'html', 'twig', 'hbs'} },
  -- volar = {},

  -- stylua = {},
  -- lua_ls = {
  --   Lua = {
  --     workspace = { checkThirdParty = false },
  --     telemetry = {},
  --     -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
  --     -- diagnostics = { disable = { 'missing-fields' } },
  --   },
  -- },
}


-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require('mason-lspconfig')

-- mason_lspconfig.setup {
--   ensure_installed = vim.tbl_keys(servers),
-- }

require('mason-tool-installer').setup { ensure_installed = vim.tbl_keys(servers) }

mason_lspconfig.setup {
  ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
  automatic_installation = false,
  handlers = {
    function(server_name)
      local server = servers[server_name] or {}
      -- This handles overriding only values explicitly passed
      -- by the server configuration above. Useful when disabling
      -- certain features of an LSP (for example, turning off formatting for ts_ls)
      server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
      require('lspconfig')[server_name].setup(server)
    end,
  },
  -- function(server_name)
  --   require('lspconfig')[server_name].setup {
  --     capabilities = capabilities,
  --     on_attach = on_attach,
  --     settings = servers[server_name],
  --     filetypes = (servers[server_name] or {}).filetypes,
  --   }
  -- end,
}

-- Vue
-- https://github.com/vuejs/language-tools

-- local mason_registry = require('mason-registry')
-- local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() ..
-- '/node_modules/@vue/language-server'


local lspconfig = require('lspconfig')

-- lspconfig.tsserver.setup {
--   init_options = {
--     plugins = {
--       {
--         name = '@vue/typescript-plugin',
--         location = vue_language_server_path,
--         languages = { 'vue' },
--       },
--     },
--   },
--   filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
-- }

-- vim: ts=2 sts=2 sw=2 et
