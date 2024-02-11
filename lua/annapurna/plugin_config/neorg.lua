require("neorg").setup {
  load = {
    ["core.defaults"] = {},  -- Loads default behaviour
    ["core.concealer"] = {}, -- Adds pretty icons to your documents
    ["core.summary"] = {},
    ["core.qol.toc"] = {
      config = {
        close_after_use = true
      }
    },
    ["core.keybinds"] = {
      config = {
        hook = function(keybinds)
          keybinds.map("norg", "n", "<leader>t", ":Neorg toc left<CR>")
        end,
      }
    },
    ["core.dirman"] = { -- Manages Neorg workspaces
      config = {
        workspaces = {
          main = "~/Notes/neorg/main",
          work = "~/Notes/neorg/work",
          edu = "~/Notes/neorg/edu",
          badminton = "~/Notes/neorg/badminton",
        },
        default_workspace = "main",
      },
    },
  },
}
