return {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    opts = {
      -- List can be found here:
      -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
      ensure_installed = {
        -- LSP
        "basedpyright",
        "clangd",
        "lua_ls",
        "marksman",
        "ts_ls",
        -- DAP
        -- "cpptools",
        -- Linter
        -- "codespell",
        -- "cpplint",
        -- "flake8",
        -- Formatter
        -- "isort",
        -- "ruff_format",
        -- "clang-format",
        -- "stylua",
      },
    },
}
