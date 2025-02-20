return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      -- LSP
      "basedpyright",
      "clangd",
      "lua-language-server",
      "marksman",
      "typescript-language-server",
      -- DAP
      "cpptools",
      -- Linter
      "codespell",
      "cpplint",
      "flake8",
      -- Formatter
      "black",
      "clang-format",
      "shfmt",
      "stylua",
    },
  },
}
