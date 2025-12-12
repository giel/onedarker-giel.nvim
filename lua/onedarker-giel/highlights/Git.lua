local C = require "onedarker-giel.palette"

local Git = {
  SignAdd = { fg = C.sign_add },
  SignChange = { fg = C.sign_change },
  SignDelete = { fg = C.sign_delete },
  GitSignsAdd = { fg = C.sign_add },
  GitSignsChange = { fg = C.sign_change },
  GitSignsDelete = { fg = C.white, bg = C.sign_delete },
}

return Git
