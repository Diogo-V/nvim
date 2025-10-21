return { -- Displays issues with the code
  "folke/trouble.nvim",
  opts = {
    auto_preview = true, -- automatically open preview when on an item
    auto_refresh = true, -- auto refresh when open
    auto_jump = false, -- auto jump to the item when there's only one
    focus = true, -- Focus the window when opened
    restore = true, -- restores the last location in the list when opening
    follow = true, -- Follow the current item
  },
  cmd = "Trouble",
  keys = {
    {
      "<leader>cD",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Workspace Diagnostics",
    },
    {
      "<leader>cd",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics",
    },
  },
}
