return { -- Keybindings explorer
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "All Keybinds in Buffer",
    },
  },
  opts = {
    preset = "helix",
    spec = {
      { "<leader>w", group = "Window Management" },
      { "<leader>f", group = "Fuzzy Find" },
      { "<leader>c", group = "Code" },
      { "<leader>h", group = "Git" },
      { "<leader>cc", group = "Comment Code" },
      { "<leader>o", group = "OpenCode" },
      { "<leader>n", group = "Neovim" },
      { "<leader>nt", group = "Tips and Tricks" },
      { "<leader>ns", group = "Spellchecking" },
    },
  },
}
