return { -- Bundle of plugins with quality of life improvements
  "nvim-mini/mini.nvim",
  version = "*",
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require("mini.ai").setup({ n_lines = 500 })

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require("mini.surround").setup()

    -- Setups auto pairing of quotes, bracktes, braces, etc...
    require("mini.pairs").setup()

    require("mini.comment").setup({
      options = {
        custom_commentstring = function() -- Figures out which type of comment to use
          return require("ts_context_commentstring.internal").calculate_commentstring({
            key = "commentstring",
          }) or vim.bo.commentstring
        end,

        ignore_blank_line = false, -- Whether to ignore blank lines when commenting
        start_of_line = false, -- Whether to ignore blank lines in actions and textobject
        pad_comment_parts = true, -- Whether to force single space inner padding for comment parts
      },

      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        comment = "gc",
        comment_line = "gcc", -- Toggle comment on current line
        comment_visual = "gc", -- Toggle comment on visual selection
        textobject = "gc",
      },

      hooks = {
        pre = function() end,
        post = function() end,
      },
    })
  end,
}
