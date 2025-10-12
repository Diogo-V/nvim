return { -- Bundle of QoL plugins
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    input = { enabled = true },
    bigfile = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    git = { enabled = true },
    gitbrowse = { enabled = true },
    image = { enabled = true },
    terminal = { enabled = true },
    dashboard = {
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { section = "startup" },
      },
    },
  },
  keys = {
    {
      "<c-\\>",
      function()
        Snacks.terminal()
      end,
      desc = "Toggle Terminal",
    },
    {
      "<leader>ho",
      function()
        Snacks.gitbrowse()
      end,
      desc = "Open file in GitHub",
      mode = { "n", "v" },
    },
    {
      "<leader>hl",
      function()
        Snacks.picker.git_log()
      end,
      desc = "Git Log",
    },
    {
      "<leader>hd",
      function()
        Snacks.picker.git_diff()
      end,
      desc = "Diff Staged/Unstaged",
    },
    {
      "<leader>hf",
      function()
        Snacks.picker.git_log_file()
      end,
      desc = "View preview commits to file",
    },
  },
}
