return { -- Handles code formatting and linting
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  opts = {
    format_on_save = {
      timeout_ms = 1000,
      lsp_format = "fallback", -- Fallback to LSP formatting if available
    },
    formatters_by_ft = {
      lua = { "stylua" },
      cpp = { "clang-format" },
      javascript = { "biome" },
      typescript = { "biome" },
      python = { "ruff" },
      rust = { "rustfmt" },
      bash = { "shfmt", "shellcheck" },
      zsh = { "shfmt", "shellcheck" },
      sh = { "shfmt", "shellcheck" },
      ["*"] = { "codespell" }, -- Run on all filetypes
      ["_"] = { "trim_whitespace" }, -- Run on all filetypes that do not have formatters configured
    },
  },
}
