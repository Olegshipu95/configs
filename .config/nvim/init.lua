local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy').setup("plugins")

-- Vim mappings, see lua/config/which.lua for more mappings
require("mappings")

-- All non plugin related (vim) options
require("options")

-- Vim autocommands/autogroups
require("autocmds")

-- Set favorite colorscheme
require("colorscheme")

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'sh',
  callback = function()
    vim.lsp.start({
      name = 'bash-language-server',
      cmd = { 'bash-language-server', 'start' },
    })
  end,
})

vim.api.nvim_set_keymap('n', 'j', 'h', { noremap = true, silent = true })  -- j влево
vim.api.nvim_set_keymap('n', 'k', 'j', { noremap = true, silent = true })  -- k вниз
vim.api.nvim_set_keymap('n', 'l', 'k', { noremap = true, silent = true })  -- l вверх
vim.api.nvim_set_keymap('n', ';', 'l', { noremap = true, silent = true })  -- ; вправо
