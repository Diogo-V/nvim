return { -- AI integration for neovim
  "sudo-tee/opencode.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      ft = { "markdown", "opencode_output" },
    },
    "saghen/blink.cmp",
    "ibhagwan/fzf-lua",
  },
  config = function()
    require("opencode").setup({
      preferred_picker = "fzf",
      preferred_completion = "blink",
      default_global_keymaps = true,
      default_mode = "plan",
      default_system_prompt = nil, -- Use default
      keymap_prefix = "<leader>o",
      opencode_executable = "opencode",
      keymap = {
        editor = {
          ["<leader>oo"] = { "toggle" },
          ["<leader>og"] = { "open_output" },
        },
      },
    })
  end,
}
