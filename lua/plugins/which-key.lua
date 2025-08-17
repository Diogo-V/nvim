return {
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
      { "<leader>f", group = "Fuzzy Find" },
      { "<leader>c", group = "Code" },
    },
  },
}
