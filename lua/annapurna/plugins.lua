local plugins = {
  'folke/which-key.nvim',
  'folke/trouble.nvim',
  'folke/neodev.nvim',
  { 'jokajak/keyseer.nvim',  version = false },

  -- Utilities
  'nvim-lua/plenary.nvim',
  'nvim-tree/nvim-web-devicons',

  -- Git
  'f-person/git-blame.nvim',
  'lewis6991/gitsigns.nvim',
  'tpope/vim-fugitive',
  "sindrets/diffview.nvim",

  -- Files
  'stevearc/oil.nvim',
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },

  -- Editor
  { 'numToStr/Comment.nvim', opts = {},      lazy = false },
  'mbbill/undotree',
  'goolord/alpha-nvim',
  'hoob3rt/lualine.nvim',
  'github/copilot.vim',
  'wakatime/vim-wakatime',
  { 'akinsho/bufferline.nvim',       version = "*", },
  { 'nvim-telescope/telescope.nvim', tag = '0.1.4', },

  "rebelot/kanagawa.nvim",
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  -- {
  --   'lunarvim/synthwave84.nvim',
  --   config = function()
  --     vim.cmd('colorscheme synthwave84')
  --   end
  -- },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  'IndianBoy42/tree-sitter-just',
  {
    "danymat/neogen",
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      "L3MON4D3/LuaSnip",
    },
  },

  -- LSP Support
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  "j-hui/fidget.nvim",
  -- Autocompletion
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  'saadparwaiz1/cmp_luasnip',

  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- Path to the vault directory
      dir = "~/Notes/obsidian",

      notes_subdir = "notes",

      log_level = vim.log.levels.DEBUG,

      -- Daily notes
      daily_notes = {
        folder = "notes/dailies",
        date_format = "%Y-%m-%d",
        alias_format = "%Y-%m-%d",
      },

      -- Configure templates
      templates = {
        subdir = "templates",
        date_format = "%a %d. %b %Y",
        time_format = "%H:%M",
      },

      -- Open external links
      follow_url_func = function(url)
        vim.fn.jobstart({ "open", url }) -- macOS
        -- vim.fn.jobstart({"xdg-open", url}) -- Linux
      end,

      finder = "telescope.nvim",
    },
    {
      "nvim-neorg/neorg",
      build = ":Neorg sync-parsers",
      dependencies = "nvim-lua/plenary.nvim"
    }
  },

  -- {
  -- 'ekickx/clipboard-image.nvim'
  -- config = function()
  --   require('clipboard-image').setup {
  --     default = {
  --       img_dir = "images",
  --       img_name = function() return os.date('%Y-%m-%d_%H-%M-%S') end,
  --     },
  --     markdown = {
  --       affix = "![](%s)",
  --       img_handler = function(img)
  --         local script = string.format('./image_compressor.sh "%s"', img.path)
  --         os.execute(script)
  --       end
  --     }
  --   }
  -- end
  -- }

  -- Games
  {
    'jim-fx/sudoku.nvim',
    cmd = "Sudoku",
    config = function()
      require("sudoku").setup({})
    end
  },
  'alanfortlink/blackjack.nvim'

}

-- [[ Install `lazy.nvim` plugin manager ]]
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
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

require("lazy").setup(plugins)
