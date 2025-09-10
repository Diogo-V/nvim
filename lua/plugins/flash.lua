return { -- Used to quickly jump to parts of the code
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    {
      "<leader>s",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash Jump",
    },
  },
}
