-- Quality of Life shortcuts
vim.keymap.set("n", "<Esc>", ":noh<CR>", { desc = "Clear highlights", noremap = true, silent = true })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" }) -- Useful with tmux
vim.keymap.set("x", "<leader>p", '[["_dP]]', { desc = "Paste without losing content", silent = true, noremap = true })
vim.keymap.set("v", "p", '"_dP', { desc = "Paste without losing current paste term", silent = true, noremap = true })
vim.keymap.set("n", "Q", "<nop>") -- Its horrible
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { noremap = true, silent = true }) -- Disable the spacebar key's default behavior
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", { desc = "Save current buffer", noremap = true, silent = true })

-- Press jk fast to exit insert mode
vim.keymap.set("i", "jk", "<ESC>", { desc = "Leave insert mode quickly", silent = true, noremap = true })
vim.keymap.set("i", "kj", "<ESC>", { desc = "Leave insert mode quickly", silent = true, noremap = true })
vim.keymap.set("i", "jj", "<Esc>", { desc = "Leave insert mode quickly", silent = true, noremap = true })
vim.keymap.set("i", "kk", "<Esc>", { desc = "Leave insert mode quickly", silent = true, noremap = true })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { silent = true, noremap = true })
vim.keymap.set("v", ">", ">gv", { silent = true, noremap = true })

-- Move and center cursor on screen
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move half a page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move half a page up" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Find next match", silent = true })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Find previous match", silent = true })

-- Allows moving stuff around when highlighted
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Moves highlighted up", silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Moves highlighted down", silent = true })

-- Window management
vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split [W]indow [V]ertically", noremap = true, silent = true })
vim.keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split [W]indow [H]orizontally", noremap = true, silent = true })
vim.keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make [W]indows [E]quall Width", noremap = true, silent = true })
vim.keymap.set("n", "<leader>wq", ":close<CR>", { desc = "[W]indow [Q]uit", noremap = true, silent = true })

-- Keybinds to make split navigation easier
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next Buffer", noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous Buffer", noremap = true, silent = true })
vim.keymap.set("n", "<leader>x", ":bdelete<CR>", { desc = "Delete Buffer", noremap = true, silent = true }) -- close buffer
vim.keymap.set("n", "<leader>b", "<cmd> new <CR>", { desc = "New Buffer", noremap = true, silent = true }) -- new buffer

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize +2<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<Down>", ":resize -2<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<Left>", ":vertical resize +2<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<Right>", ":vertical resize -2<CR>", { silent = true, noremap = true })

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

-- Code actions
vim.keymap.set("n", "<leader>ci", "gg=G", { desc = "[C]ode [I]ndent" })
vim.keymap.set("n", "<leader>cf", function()
  require("conform").format({ lsp_format = "fallback" })
end, { desc = "[C]ode [F]ormat" })

-- Keybindings for Spell Checking
vim.keymap.set("n", "<leader>nsa", "zg", { desc = "[S]pell [A]dd Good Word" })
vim.keymap.set("n", "<leader>nss", "z=", { desc = "[S]pell [S]suggestions" })
vim.keymap.set("n", "<leader>nsd", ":setlocal nospell<CR>", { desc = "[S]pell [D]isable" })
vim.keymap.set("n", "<leader>nse", ":setlocal spell<CR>", { desc = "[S]pell [E]nable" })
vim.keymap.set("n", "<leader>nsn", "]s", { desc = "[S]pell [N]ext Mistake" })
vim.keymap.set("n", "<leader>nsp", "[s", { desc = "[S]pell [P]revious Mistake" })

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
