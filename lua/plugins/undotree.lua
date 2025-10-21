return { -- Creates a tree to undo the contents of a file
  "mbbill/undotree",
  config = function()
    vim.g.undotree_WindowLayout = 2
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.keymap.set(
      "n",
      "<leader>u",
      vim.cmd.UndotreeToggle,
      { silent = true, noremap = true, desc = "Toggle [U]ndoTree" }
    )
  end,
}
