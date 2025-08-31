return {
  "folke/todo-comments.nvim",
  event = "VimEnter",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    signs = false,
  },
  keys = {
    {
      "<leader>ctN",
      function()
        require("todo-comments").jump_prev()
      end,
      desc = "Previous todo comment",
      mode = { "n" },
    },
    {
      "<leader>ctn",
      function()
        require("todo-comments").jump_next()
      end,
      desc = "Next todo comment",
      mode = { "n" },
    },
  },
}
