local api = vim.api

api.nvim_create_autocmd({ 'VimEnter', 'DirChanged' }, {
  group = api.nvim_create_augroup('git_repo_check', { clear = true }),
  pattern = '*',
  desc = 'check if we are inside Git repo',
  callback = function()
    inside_git_repo()
  end,
})

--- check if we are inside a git repo
--- @return boolean
function inside_git_repo()
  local result = vim.system({ 'git', 'rev-parse', '--is-inside-work-tree' }, { text = true }):wait()
  if result.code ~= 0 then
    return false
  end

  -- Manually trigger a special user autocmd InGitRepo (used lazyloading.
  vim.cmd [[doautocmd User InGitRepo]]

  return true
end

return {}
