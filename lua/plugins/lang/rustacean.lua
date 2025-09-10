return {
  "mrcjkb/rustaceanvim",
  version = "^6",
  ft = { "rust" },
  lazy = false,
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    vim.g.rustaceanvim = {
      capabilities = capabilities,
      tools = {
        autoSetHints = true,
        inlay_hints = {
          show_parameter_hints = true,
          parameter_hints_prefix = "in: ",
          other_hints_prefix = "out: ",
        },
      },
      -- LSP configuration
      --
      -- REFERENCE:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      -- https://rust-analyzer.github.io/manual.html#configuration
      -- https://rust-analyzer.github.io/manual.html#features
      --
      -- NOTE: The configuration format is `rust-analyzer.<section>.<property>`.
      --       <section> should be an object.
      --       <property> should be a primitive.
      server = {
        on_attach = function(client, bufnr)
          local bufopts = {
            noremap = true,
            silent = true,
            buffer = bufnr,
          }
          vim.keymap.set("n", "<leader>cr", "<Cmd>RustLsp runnables<CR>", bufopts)
          vim.keymap.set("n", "K", "<Cmd>RustLsp hover actions<CR>", bufopts)
        end,
        settings = {
          ["rust-analyzer"] = {
            assist = {
              importEnforceGranularity = true,
              importPrefix = "create",
            },
            cargo = { allFeatures = true },
            checkOnSave = {
              command = "clippy",
              allFeatures = true,
            },
            inlayHints = {
              lifetimeElisionHints = {
                enable = true,
                useParameterNames = true,
              },
            },
          },
        },
      },
    }
  end,
}
