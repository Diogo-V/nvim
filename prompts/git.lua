return {
  diff = function(args)
    local result = vim.system({ "git", "diff", "--no-ext-diff" }, { text = true }):wait()
    if result.code == 0 and result.stdout and result.stdout ~= "" then
      return result.stdout
    end
    local staged = vim.system({ "git", "diff", "--no-ext-diff", "--cached" }, { text = true }):wait()
    if staged.code == 0 and staged.stdout and staged.stdout ~= "" then
      return staged.stdout
    end
    local status = vim.system({ "git", "status", "--porcelain" }, { text = true }):wait()
    if status.code == 0 and status.stdout then
      local untracked = {}
      for line in vim.gsplit(status.stdout, "\n", { plain = true }) do
        if line:match("^??") then
          table.insert(untracked, line:sub(4))
        end
      end
      if #untracked > 0 then
        return "Untracked files:\n" .. table.concat(untracked, "\n")
      end
    end
    return "No uncommitted changes found."
  end,
}
