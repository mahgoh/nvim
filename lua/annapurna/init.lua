local vim = vim

-- Leader key needs to be set before plugins load
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- termguicolors needs to be set before plugins load
vim.opt.termguicolors = true

require("annapurna.plugins")
require("annapurna.plugin_config")
require("annapurna.options")
require("annapurna.keymapping")
