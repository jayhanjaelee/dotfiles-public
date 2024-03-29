local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/plenary.nvim"  -- Useful lua functions used by lots of plugins

  -- Color Scheme
  use "rebelot/kanagawa.nvim"

  -- Comments
  use "numToStr/Comment.nvim"

	-- Cmp 
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
	use "saadparwaiz1/cmp_luasnip" -- snippet completions
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-nvim-lua"

	-- Snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

 	-- LSP
	use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/mason.nvim" -- simple to use language server installer
  use "williamboman/mason-lspconfig.nvim"
	use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "RRethy/vim-illuminate"
  use {
    "glepnir/lspsaga.nvim",
    requires = {
      {"nvim-tree/nvim-web-devicons"},
      --Please make sure you install markdown and markdown_inline parser
      {"nvim-treesitter/nvim-treesitter"}
    }
  }

  -- Telescope
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }

 	-- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "windwp/nvim-ts-autotag"
  use "nvim-treesitter/playground"

  -- Autopairs
  use "windwp/nvim-autopairs"

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Nvim Tree
  use "nvim-tree/nvim-tree.lua"
  use "nvim-tree/nvim-web-devicons" -- dev icons

  -- Bufferline
  use "akinsho/bufferline.nvim"

  -- Lualine
  use "nvim-lualine/lualine.nvim"

  -- Project management
  use "ahmedkhalf/project.nvim"

  -- Vim surround
  use "tpope/vim-surround"

  -- vim tmux navigator
  use "christoomey/vim-tmux-navigator"

  -- indent rainbow
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      opts = {}
      -- Other blankline configuration here
      require("indent_blankline").setup(require("indent-rainbowline").make_opts(opts))
    end,
    requires = {
      "TheGLander/indent-rainbowline.nvim",
    },
  }

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

