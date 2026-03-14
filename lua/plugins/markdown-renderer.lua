return { -- Renders markddown files
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  opts = {
    completions = { lsp = { enabled = true } },
    file_types = { "markdown", "opencode_output" },
    anti_conceal = { enabled = false },
  },
}
