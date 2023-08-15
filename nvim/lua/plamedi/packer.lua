-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
--	  config = function()
--		  vim.cmd('colorscheme rose-pine')
--	  end
  })
  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = ':TSUpdate'
  }

  use ('nvim-treesitter/playground')
  use ('theprimeagen/harpoon')
  use ('mbbill/undotree')
  use ('tpope/vim-fugitive')
  use {
  'VonHeikemen/lsp-zero.nvim',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-nvim-lua'},

    -- Snippets
    {'L3MON4D3/LuaSnip'},
    {'rafamadriz/friendly-snippets'},
  }
}
use { "catppuccin/nvim", as = "catppuccin" }
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
      }
use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
}
use 'norcalli/nvim-colorizer.lua'
use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}
use "rebelot/kanagawa.nvim"
use {
  'svrana/neosolarized.nvim',
  requires = { 'tjdevries/colorbuddy.nvim'}
}

use {
  "folke/trouble.nvim",
  requires = {"nvim-tree/nvim-web-devicons"},
  -- config = function () require("trouble").setup {} end
}

use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons',
  },
  tag = 'nightly'
}
use {"ellisonleao/gruvbox.nvim"}

use {"nvim-tree/nvim-web-devicons"}

use {"lewis6991/gitsigns.nvim"}

-- install without yarn or npm

use({ "iamcco/markdown-preview.nvim", 
    run = function() vim.fn["mkdp#util#install"]() end,})

use {'Exafunction/codeium.vim'}
use {"EdenEast/nightfox.nvim"}
use {"folke/tokyonight.nvim"}
use {"marko-cerovac/material.nvim"}
use {"tjdevries/colorbuddy.nvim"}
use {"lervag/vimtex"}
use {"sainnhe/gruvbox-material"}
use {"habamax/vim-godot"}

use {"doums/darcula"}

-- formatter on save
use {"mhartington/formatter.nvim"}

-- folke niceties
use {"folke/noice.nvim",
  requires = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    {"MunifTanjim/nui.nvim"},
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    {"rcarriga/nvim-notify"},
    }}
    --
-- which key stuff
use {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}

-- line stuff
use {"lukas-reineke/indent-blankline.nvim"}

-- treesitter stuff
use {"nvim-treesitter/nvim-treesitter-context"}
use({
  "nvim-treesitter/nvim-treesitter-textobjects",
  after = "nvim-treesitter",
  requires = "nvim-treesitter/nvim-treesitter",
})
use {'nvim-treesitter/nvim-treesitter-refactor'}

  end)
