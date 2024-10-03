local configs = require("nvim-treesitter.configs")

configs.setup({
  ensure_installed = {
    "astro",
    "c",
    "cpp",
    "css",
    "dockerfile",
    "fish",
    "go",
    "html",
    "java",
    "javascript",
    "jsdoc",
    "json",
    "ledger",
    "lua",
    "markdown",
    -- "markdown_inline",
    "nix",
    "rust",
    "sql",
    "toml",
    "typescript",
    "yaml"
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "markdown" }
  },
  indent = { enable = true },
})
