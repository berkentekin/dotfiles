-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Git integration
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github

  -- Navigate vim and kitty
  use 'knubie/vim-kitty-navigator'

  -- LSP
  use 'neovim/nvim-lspconfig'

  -- Lua language server
  use 'sumneko/lua-language-server'

  -- Code autocompletion
  use 'hrsh7th/nvim-compe'
  use 'kosayoda/nvim-lightbulb'

  -- Snippets
  use 'L3MON4D3/LuaSnip'

  -- Linting
  use 'dense-analysis/ale'

  -- Code Formatting
  use 'sbdchd/neoformat'

  -- Highlight Whitespaces
  use 'ntpeters/vim-better-whitespace'

  -- LaTeX
  use 'lervag/vimtex'

  -- Status Bar
  use { 'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }


  -- Automatic bracket completion
  use 'jiangmiao/auto-pairs'

  -- Comment plugin
  use 'scrooloose/nerdcommenter'

  -- Fuzzy search
  use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } } }

  -- Highlight yanked text
  use 'machakann/vim-highlightedyank'

  -- Code folding
  use 'tmhedberg/SimpylFold'

  -- Colorschemes
  use { 'dracula/vim', as = 'dracula' }

  -- Improve Syntax
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }  -- We recommend updating the parsers on update

  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  -- Start screen
  use 'mhinz/vim-startify'

  -- Show colors of hexcodes
  use 'ap/vim-css-color'

  -- Switch between .c and .h
  use 'ericcurtin/CurtineIncSw.vim'

  --
end)

