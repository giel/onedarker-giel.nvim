local M = {}

function M.setup()
  local highlights = require "onedarker-giel.highlights"
  vim.cmd "hi clear"
  if vim.fn.exists "syntax_on" then
    vim.cmd "syntax reset"
  end
  vim.o.background = "dark"
  vim.o.termguicolors = true
  vim.g.colors_name = "onedarker-giel"
  highlights.setup()
  vim.cmd [[colorscheme onedarker-giel]]
end

return M
