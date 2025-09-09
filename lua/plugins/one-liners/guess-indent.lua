return { -- Guesses indentation scheme based on the files in the project
  "nmac427/guess-indent.nvim",
  config = function()
    require("guess-indent").setup()
  end,
}
