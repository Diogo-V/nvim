return {
  "olimorris/codecompanion.nvim",
  version = "^19.0.0",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("codecompanion").setup({
      prompt_library = {
        markdown = {
          dirs = {
            "~/.config/nvim/prompts",
          },
        },
      },
      interactions = {
        chat = {
          adapter = {
            name = "opencode",
            model = "gemini-3-flash-preview",
          },
          opts = {
            completion_provider = "blink",
          },
          keymaps = {
            send = {
              modes = { n = "<C-s>", i = "<C-s>" },
              opts = {},
            },
            close = {
              modes = { n = "<C-c>", i = "<C-c>" },
              opts = {},
            },
          },
        },
        inline = {
          adapter = {
            name = "gemini",
            model = "gemini-3-flash-preview",
          },
          keymaps = {
            accept_change = {
              modes = { n = "ga" },
              description = "Accept the suggested change",
            },
            reject_change = {
              modes = { n = "gr" },
              opts = { nowait = true },
              description = "Reject the suggested change",
            },
          },
        },
      },
      adapters = {
        acp = {
          opencode = function()
            return require("codecompanion.adapters").extend("opencode", {
              defaults = {
                mcpServers = "inherit_from_config",
              },
            })
          end,
        },
        http = {
          gemini = function()
            return require("codecompanion.adapters").extend("gemini", {
              env = {
                api_key = "GEMINI_API_KEY",
              },
            })
          end,
        },
      },
      display = {
        action_palette = {
          width = 95,
          height = 10,
          prompt = "Prompt ",
          provider = "fzf_lua",
          opts = {
            show_preset_actions = true,
            show_preset_prompts = true,
            title = "CodeCompanion actions",
          },
        },
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>as", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
    vim.keymap.set({ "n", "v" }, "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
    vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
    vim.keymap.set({ "n", "v" }, "<leader>ai", "<cmd>CodeCompanion<cr>", { noremap = true, silent = true })

    -- ALias cc to CodeCompanion
    vim.cmd([[cab cc CodeCompanion]])
  end,
}
