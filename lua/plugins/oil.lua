return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      CustomOilBar = function()
        local path = vim.fn.expand("%")
        path = path:gsub("oil://", "")
        return "  " .. vim.fn.fnamemodify(path, ":.")
      end

      require("oil").setup({
        default_file_explorer = true,
        delete_to_trash = true,
        skip_confirm_for_simple_edits = false,
        columns = { "icon" },
        keymaps = {
          ["g?"] = { "actions.show_help", mode = "n" },
          ["<CR>"] = "actions.select",
          ["<C-v>"] = { "actions.select", opts = { vertical = true } },
          ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
          ["<C-t>"] = false,
          ["<C-p>"] = "actions.preview",
          ["q"] = { "actions.close", mode = "n" },
          ["-"] = { "actions.parent", mode = "n" },
          ["_"] = { "actions.open_cwd", mode = "n" },
          ["`"] = { "actions.cd", mode = "n" },
          ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
          ["gs"] = { "actions.change_sort", mode = "n" },
          ["gx"] = "actions.open_external",
          ["g."] = { "actions.toggle_hidden", mode = "n" },
          ["g\\"] = { "actions.toggle_trash", mode = "n" },
        },
        win_options = {
          signcolumn = "yes:2",
          winbar = "%{v:lua.CustomOilBar()}",
        },
        view_options = {
          show_hidden = true,
        },
      })

      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open Oil explorer" })
    end,
  },
  {
    "JezerM/oil-lsp-diagnostics.nvim",
    dependencies = { "stevearc/oil.nvim" },
    opts = {},
  },
  {
    "refractalize/oil-git-status.nvim",
    dependencies = { "stevearc/oil.nvim" },
    opts = {
      show_ignored = true, -- show files that match gitignore with !!
      symbols = { -- customize the symbols that appear in the git status columns
        index = {
          ["!"] = "!",
          ["?"] = "?",
          ["a"] = "a",
          ["c"] = "c",
          ["d"] = "d",
          ["m"] = "m",
          ["r"] = "r",
          ["t"] = "t",
          ["u"] = "u",
          [" "] = " ",
        },
        working_tree = {
          ["!"] = "!",
          ["?"] = "?",
          ["a"] = "a",
          ["c"] = "c",
          ["d"] = "d",
          ["m"] = "m",
          ["r"] = "r",
          ["t"] = "t",
          ["u"] = "u",
          [" "] = " ",
        },
      },
    },
  },
}
