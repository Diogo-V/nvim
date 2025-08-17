return {
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },
    opts = {
      inlay_hints = { enabled = true },
      servers = {
        lua_ls = {}
      },
    },
    config = function(_, opts)
      local lspconfig = require('lspconfig')
      for server, config in pairs(opts.servers) do
        -- passing config.capabilities to blink.cmp merges with the capabilities in your
        -- `opts[server].capabilities, if you've defined it
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
    end
  },
  {
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
  },
  {
    "mason-org/mason.nvim",
    opts = {}
  }
}
