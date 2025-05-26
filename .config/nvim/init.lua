-- Set leader key
vim.g.mapleader = " "

-- Install vim-plug automatically if missing
local plug_path = vim.fn.stdpath('data') .. '/site/autoload/plug.vim'
if vim.fn.empty(vim.fn.glob(plug_path)) > 0 then
  vim.fn.system({
    'sh', '-c',
    'curl -fLo ' .. plug_path .. ' --create-dirs ' ..
    'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  })
  print("✅ Installed vim-plug. Please restart Neovim.")
  -- Stop further loading until restart
  return
end

-- Plugin installation with vim-plug
vim.cmd [[
  runtime autoload/plug.vim

  call plug#begin('~/.local/share/nvim/plugged')

  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-lua/plenary.nvim'
  Plug 'folke/todo-comments.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'numToStr/Comment.nvim'
  Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

  call plug#end()
]]

-- Check if plugins are installed
local install_path = vim.fn.stdpath('data') .. '/plugged/nvim-cmp' -- example plugin dir
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print("Plugins missing, running PlugInstall...")
  vim.cmd('PlugInstall --sync | source $MYVIMRC')
  -- Stop further loading until install finishes and user restarts
  return
end

-- Load plugins
require('plugins')

-- Load keymaps
require('keymaps')

-- Load theme
require('themes.catppuccin')
