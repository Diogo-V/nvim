return { -- Adds file linters
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function()
    local lint = require("lint")
    -- Find linters here: https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters
    lint.linters_by_ft = {
      python = { "ruff" },
      lua = { "selene" },
      javascript = { "biomejs" },
      typescript = { "biomejs" },
      javascriptreact = { "biomejs" },
      typescriptreact = { "biomejs" },
      cmake = { "cmake_lint" },
      -- rust comes from clippy that is ran by rustacean
      -- c and c++ come from clang-tidy ran with clandg lsp
    }
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>cl", function()
      lint.try_lint()
    end, { desc = "[C]ode [L]int" })
  end,
}
