return {
  {
    "nvim-cmp",
    opts = function(_, opts)
      -- local cmp = require("cmp")
      -- This removes all snippets from showing up
      opts.sources = vim.tbl_filter(function(v)
        return not vim.tbl_contains({ "luasnip" }, v.name)
      end, opts.sources)
    end,
  },
}
