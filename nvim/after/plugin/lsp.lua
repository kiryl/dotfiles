local cmp = require('cmp')
local lsp = require("lsp-zero")
local lspkind = require('lspkind')

lsp.preset("recommended")

lsp.ensure_installed({
  'clangd',
  'sumneko_lua',
  'rust_analyzer',
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = ' ',
    warn = ' ',
    hint = ' ',
    info = ' ',
  },
})

lsp.on_attach(function(_, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "<Leader>d", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "<Leader>D", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "<Leader>r", '<cmd>Trouble lsp_references<CR>', opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<Leader>R", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<Leader>q", '<cmd>Trouble<CR>', opts)
end)

lsp.configure('clangd', {
  flags = {
    debounce_text_changes = 150,
  },
  cmd = {
    'clangd',
    '--background-index', '--header-insertion=never', '--function-arg-placeholders=false',
    '-j', '20'
  },
  init_options = {
    usePlaceholders = true,
  }
})

lsp.configure('sumneko_lua', {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
    }
  }
})

lsp.setup_nvim_cmp({
  preselect = cmp.PreselectMode.None,
  formatting = {
    fields = {
      cmp.ItemField.Kind,
      cmp.ItemField.Abbr,
      cmp.ItemField.Menu,
    },
    format = lspkind.cmp_format({
      mode = 'symbol',
      maxwidth = 50,
    })
  },
})

lsp.setup()

require "lsp_signature".setup({
  bind = true,
})
