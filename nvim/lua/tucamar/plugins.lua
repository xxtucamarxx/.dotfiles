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
  -- Is using a standard Neovim install, i.e. built from source or using a
  -- provided appimage.
	-- My plugins here
	use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
	use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
	use( "tpope/vim-surround" )
	use({ "numToStr/Comment.nvim" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "akinsho/bufferline.nvim" }) -- line with buffers
	use({ "nvim-lualine/lualine.nvim" }) -- statusline
	use({ "kyazdani42/nvim-tree.lua", commit = "bdb6d4a25410da35bbf7ce0dbdaa8d60432bc243" })
  use( "unblevable/quick-scope" )
  vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}
		-- Colorschemes
	use("gruvbox-community/gruvbox")
	-- cmp plugins
  use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })
  use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions

	-- snippets
	use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use
	use({ "L3MON4D3/LuaSnip" }) --snippet engine

	-- Telescope

	-- Treesitter
  use({ "nvim-treesitter/nvim-treesitter", {run = ':TSUpdate'} })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

