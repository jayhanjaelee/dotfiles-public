local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use 'petertriho/nvim-scrollbar'   -- Scrollbar
  use 'Asheq/close-buffers.vim'     -- Managing buffers
  use 'nvim-tree/nvim-web-devicons' -- File icons
  use 'glepnir/lspsaga.nvim'        -- LSP UIs
  use 'L3MON4D3/LuaSnip'            -- Snippet
  use 'RRethy/nvim-base16'          -- theme
  use 'nvim-lualine/lualine.nvim'   -- Statusline
  use 'onsails/lspkind.nvim'        -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer'          -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp'        -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp'            -- Completion
  use 'neovim/nvim-lspconfig'       -- LSP
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'MunifTanjim/prettier.nvim'       -- Prettier plugin for Neovim's built-in LSP client
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'akinsho/nvim-bufferline.lua' -- Tab UI
  use 'norcalli/nvim-colorizer.lua'
  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim' -- For git blame & browse
  use {
    'iamcco/markdown-preview.nvim',
    run = vim.fn['mkdp#util#install'](),
  }
  use 'christoomey/vim-tmux-navigator'
  use 'folke/which-key.nvim'
  use 'tpope/vim-surround'
  use 'dhruvasagar/vim-zoom'
  use 'mg979/vim-visual-multi'
end)
