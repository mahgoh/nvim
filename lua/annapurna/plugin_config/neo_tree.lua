require('neo-tree').setup({
  close_if_last_window = true,
  filesystem = {
    filtered_items = {
      hide_dotfiles = false
    },
    hijack_netrw_behavior = "disabled",
  },
  default_component_configs = {
    icon = {
      default = "*"
    },
    git_status = {
      symbols = {
        added = "A",
        modified = "M",
        deleted = "D",
        renamed = "R",
        untracked = "U",
        ignored = "I",
        unstaged = "",
        staged = "S",
        conflict = "C",
      }
    }
  },
})
