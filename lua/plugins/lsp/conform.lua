return { -- Handles code formatting and linting
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  opts = {
    format_on_save = {
      timeout_ms = 1000,
      lsp_format = "fallback", -- Fallback to LSP formatting if available
    },
    -- Find formatters in https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
    formatters_by_ft = {
      lua = { "stylua" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      cmake = { "cmake-format" },
      javascript = { "biome-check" },
      typescript = { "biome-check" },
      javascriptreact = { "biome-check" },
      typescriptreact = { "biome-check" },
      python = { "ruff_organize_imports", "ruff_fix", "ruff_format" },
      rust = { "rustfmt" },
      bash = { "shfmt", "shellcheck" },
      zsh = { "shfmt", "shellcheck" },
      sh = { "shfmt", "shellcheck" },
      markdown = { "prettierd" },
      json = { "prettierd" },
      ["*"] = { "codespell" }, -- Run on all filetypes
      ["_"] = { "trim_whitespace" }, -- Run on all filetypes that do not have formatters configured
    },
  },
}
