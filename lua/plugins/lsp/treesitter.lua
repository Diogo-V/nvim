return { -- Creates a parsing system for programming languages and tools to build on top
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  version = false,
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  keys = {
    { "<enter>", desc = "Increment Selection" },
    { "<bs>", desc = "Decrement Selection", mode = "x" },
  },
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<Enter>",
          node_incremental = "<Enter>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
    })
  end,
}
