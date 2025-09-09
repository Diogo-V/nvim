return { -- Fuzzy file picker and finder
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  opts = {
    previewers = {
      builtin = {
        syntax_limit_b = 1024 * 100, -- 100KB
      },
    },
  },
}
