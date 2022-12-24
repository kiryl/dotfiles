local function term_options()
  vim.opt_local.number = false
  vim.opt_local.relativenumber = false

  vim.opt_local.spell = false

  -- vim-better-whitespace
  vim.cmd.DisableWhitespace()

  vim.cmd.startinsert()
end

vim.api.nvim_create_autocmd('TermOpen', {
  callback = term_options,
})

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = 'term://*',
  command = 'startinsert',
})

vim.api.nvim_create_autocmd('BufLeave', {
  pattern = 'term://*',
  command = 'stopinsert',
})
