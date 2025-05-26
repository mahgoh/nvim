local plugins = {
  'folke/which-key.nvim',
  {
    'folke/trouble.nvim',
    opts = {},
    cmd = 'Trouble',
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    }

  },
  { 'jokajak/keyseer.nvim',  version = false },

  -- Utilities
  'nvim-lua/plenary.nvim',
  'nvim-tree/nvim-web-devicons',

  -- Git & Files
  'lewis6991/gitsigns.nvim',
  'tpope/vim-fugitive',
  'sindrets/diffview.nvim',
  'stevearc/oil.nvim',

  -- Editor
  { 'numToStr/Comment.nvim', opts = {},      lazy = false },
  'mbbill/undotree',
  'hoob3rt/lualine.nvim',
  'wakatime/vim-wakatime',
  { 'akinsho/bufferline.nvim', version = "*", },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      require('telescope').setup {
        pickers = {
          find_files = {
            theme = "ivy"
          }
        },
        extensions = {
          fzf = {}
        }
      }

      require('telescope').load_extension('fzf')

      vim.keymap.set('n', '<leader>fd', require('telescope.builtin').find_files, {})
      vim.keymap.set('n', '<leader>fg', require('telescope.builtin').git_files, {})
      vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, {})
      vim.keymap.set('n', '<leader>en', function()
        require('telescope.builtin').find_files {
          cwd = vim.fn.stdpath("config")
        }
      end)
    end
  },

  "oahlen/iceberg.nvim",

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


  {
    'mahgoh/radiant.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('radiant').setup()
    end
  },
  -- Local Radiant repo
  -- {
  --   dir = "~/path/to/radiant.nvim", -- Your path
  --   name = "radiant",
  --   config = function()
  --     require('radiant').setup()
  --   end
  -- },

  -- Games
  {
    'jim-fx/sudoku.nvim',
    cmd = "Sudoku",
    config = function()
      require("sudoku").setup({})
    end
  },
  'alanfortlink/blackjack.nvim',

}

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
