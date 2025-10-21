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
    require("mini.surround").setup({
      custom_surroundings = nil,
      highlight_duration = 300,

      -- saiw surround with no whitespace
      -- saw surround with whitespace
      mappings = {
        add = "sa", -- Add surrounding in Normal and Visual modes
        delete = "ds", -- Delete surrounding
        find = "sf", -- Find surrounding (to the right)
        find_left = "sF", -- Find surrounding (to the left)
        highlight = "sh", -- Highlight surrounding
        replace = "sr", -- Replace surrounding
        update_n_lines = "sn", -- Update `n_lines`
        suffix_last = "l", -- Suffix to search with "prev" method
        suffix_next = "n", -- Suffix to search with "next" method
      },
      n_lines = 20,

      -- Whether to respect selection type:
      -- - Place surroundings on separate lines in linewise mode.
      -- - Place surroundings on each line in blockwise mode.
      respect_selection_type = false,

      -- How to search for surrounding (first inside current line, then inside
      -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
      -- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
      -- see `:h MiniSurround.config`.
      search_method = "cover",

      -- Whether to disable showing non-error feedback
      silent = false,
    })

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
