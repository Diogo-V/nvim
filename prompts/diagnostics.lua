return {
  diagnostics = function(args)
    local diagnostics = {}
    local bufnr = args.context.bufnr or vim.api.nvim_get_current_buf()
    
    for _, diag in ipairs(vim.diagnostic.get(bufnr)) do
      local line = diag.lnum + 1
      local col = diag.col + 1
      local severity = vim.diagnostic.severity[diag.severity]
      local severity_name = { "Error", "Warning", "Hint", "Info" }[severity] or "Unknown"
      table.insert(diagnostics, string.format("%s:%d:%d: [%s] %s", 
        vim.api.nvim_buf_get_name(bufnr), line, col, severity_name, diag.message))
    end
    
    if #diagnostics == 0 then
      return "No diagnostics found."
    end
    
    return table.concat(diagnostics, "\n")
  end,
}
