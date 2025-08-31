-- Quality of Life shortcuts
vim.keymap.set("n", "<Esc>", ":noh<CR>", { desc = "Clear highlights", noremap = true, silent = true })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" }) -- Useful with tmux
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move half a page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move half a page up" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Find next match", silent = true })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Find previous match", silent = true })
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without losing current paste term", silent = true })
vim.keymap.set("n", "Q", "<nop>") -- Its horrible

-- Allows moving stuff around when highlighted
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Moves highlighted up", silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Moves highlighted down", silent = true })

-- Fzf-lua
vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "[F]ind [F]iles in working directory" })
vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>", { desc = "[F]ind [G]rep" })
vim.keymap.set(
  "n",
  "<leader>fc",
  '<cmd>FzfLua files cwd=vim.fn.stdpath("config")<cr>',
  { desc = "[F]ind in neovim [C]onfiguration" }
)
vim.keymap.set("n", "<leader>fh", "<cmd>FzfLua helptags<cr>", { desc = "[F]ind [H]elp" })
vim.keymap.set("n", "<leader>fk", "<cmd>FzfLua keymaps<cr>", { desc = "[F]ind [K]eymaps" })
vim.keymap.set("n", "<leader>fb", "<cmd>FzfLua builtin<cr>", { desc = "[F]ind [B]uiltin FZF" })
vim.keymap.set("n", "<leader>fw", "<cmd>FzfLua grep_cword<cr>", { desc = "[F]ind current [W]ord" })
vim.keymap.set("n", "<leader>fW", "<cmd>FzfLua grep_cWORD<cr>", { desc = "[F]ind current [W]ORD" })
vim.keymap.set("n", "<leader>fd", "<cmd>FzfLua diagnostics_document<cr>", { desc = "[F]ind [D]iagnostics" })
vim.keymap.set("n", "<leader>fr", "<cmd>FzfLua resume<cr>", { desc = "[F]ind [R]esume" })
vim.keymap.set("n", "<leader>fo", "<cmd>FzfLua oldfiles<cr>", { desc = "[F]ind [O]ld Files" })
vim.keymap.set("n", "<leader><leader>", "<cmd>FzfLua buffers<cr>", { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", "<cmd>FzfLua lgrep_curbuf<cr>", { desc = "[/] Live grep the current buffer" })

-- Neo tree
vim.keymap.set("n", "<C-e>", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree", silent = true })

-- Keybinds to make split navigation easier
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Code actions
vim.keymap.set("n", "<leader>ci", "gg=G", { desc = "[C]ode [I]ndent" })
vim.keymap.set("n", "<leader>cf", function()
  require("conform").format({ lsp_format = "fallback" })
end, { desc = "[C]ode [F]ormat" })

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
