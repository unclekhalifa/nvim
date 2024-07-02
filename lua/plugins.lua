-- Automatically run :PackerCompile whenever plugins.lua is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Bootstrap packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- packer.nvim configuration
require("packer").init({
  profile = {
    enable = true, -- Measure the startup time of plugins
  },
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" }) -- Make the borders rounded
    end,
  },
})

-- Plugin List
require("packer").startup(function(use)
  use("wbthomason/packer.nvim")                        -- package manager

  use({ "nvim-lua/plenary.nvim", module = "plenary" }) -- load only when require

  use("kyazdani42/nvim-web-devicons")                  -- Icons

  use("folke/which-key.nvim")                          -- Keymap

  use({
    'nvim-telescope/telescope.nvim',
    tag = '0.1.x',
    requires = {
      'nvim-lua/plenary.nvim',
      "cljoly/telescope-repo.nvim",
      "LinArcX/telescope-env.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
      "nvim-telescope/telescope-project.nvim",
      "ahmedkhalf/project.nvim"
    }
  })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

  -- Good syntax highlighting
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })

  -- Startup page
  use({
    'nvimdev/dashboard-nvim',
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  })

  -- Theming
  use({ "catppuccin/nvim", as = "catppuccin" })
  use({ "rebelot/kanagawa.nvim" })

  -- Breadcrumb (top and bottom)
  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  })

  -- Git plugins
  use({ "dinhhuy258/git.nvim" })
  use({ "lewis6991/gitsigns.nvim" })
  use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

  -- Code completion
  use({
    "hrsh7th/nvim-cmp",
    wants = { "LuaSnip" },
    requires = {
      "L3MON4D3/LuaSnip",
      "f3fora/cmp-spell",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "ray-x/cmp-treesitter",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind-nvim",
    },
  })

  -- Nicely formatted completion dropdown
  use("onsails/lspkind-nvim")

  -- Manage LSP servers, linters, formatters, etc
  use({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  })

  -- Helps complete closing symbols
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  })

  -- Highlights to do comments
  use({
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup()
    end,
  })

  use({
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  })

  use({ "scottmckendry/cyberdream.nvim" })

  use({ "bluz71/vim-moonfly-colors" })

  use({ "lukas-reineke/indent-blankline.nvim" })

end)
