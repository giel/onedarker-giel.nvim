local M = {}

local Config = require "onedarker-giel.config"
local C = require "onedarker-giel.palette"

local common = {
  Normal = { fg = C.fg, bg = Config.transparent_background and "NONE" or C.bg },
  SignColumn = { bg = C.bg },
  MsgArea = { fg = C.fg, bg = Config.transparent_background and "NONE" or C.bg },
  ModeMsg = { fg = C.fg, bg = C.bg },
  MsgSeparator = { fg = C.fg, bg = C.bg },
  SpellBad = { fg = C.error_red, style = "underline" },
  SpellCap = { fg = C.yellow, style = "underline" },
  SpellLocal = { fg = C.green, style = "underline" },
  SpellRare = { fg = C.purple, style = "underline" },
  NormalNC = { fg = C.fg, bg = Config.transparent_background and "NONE" or C.bg },
  Pmenu = { fg = C.light_gray, bg = C.popup_back },
  PmenuSel = { fg = C.alt_bg, bg = C.blue },
  WildMenu = { fg = C.alt_bg, bg = C.blue },
  CursorLineNr = { fg = C.light_gray, style = "bold" },
  -- Comment = { fg = C.gray, style = "italic" },
  Comment = { fg = C.light_green, style = "italic" },
  Folded = { fg = C.accent, bg = C.alt_bg },
  FoldColumn = { fg = C.accent, bg = C.alt_bg },
  LineNr = { fg = C.context },
  -- FloatBorder = { fg = C.gray, bg = C.alt_bg },
  FloatBorder = { fg = C.gray, bg = C.bg },
  Whitespace = { fg = C.gray },
  VertSplit = { fg = C.bg, bg = C.fg },
  -- CursorLine = { bg = C.dark },
  CursorLine = { bg = C.ui_blue },
  CursorColumn = { bg = C.dark },
  ColorColumn = { bg = C.dark },
  NormalFloat = { bg = C.dark },
  Visual = { bg = C.ui_blue },
  VisualNOS = { bg = C.alt_bg },
  WinSeparator = { fg = C.search_blue, bg = C.bg },
  WarningMsg = { fg = C.error_red, bg = C.bg },
  DiffAdd = { fg = C.alt_bg, bg = C.sign_add },
  DiffChange = { fg = C.alt_bg, bg = C.sign_change, style = "underline" },
  DiffDelete = { fg = C.alt_bg, bg = C.sign_delete },
  QuickFixLine = { bg = C.dark_gray },
  PmenuSbar = { bg = C.alt_bg },
  PmenuThumb = { bg = C.gray },
  MatchWord = { style = "underline" },
  MatchParen = { fg = C.hint_blue, bg = C.bg, style = "underline" },
  MatchWordCur = { style = "underline" },
  MatchParenCur = { style = "underline" },
  Cursor = { fg = C.cursor_fg, bg = C.cursor_bg },
  lCursor = { fg = C.cursor_fg, bg = C.cursor_bg },
  CursorIM = { fg = C.cursor_fg, bg = C.cursor_bg },
  TermCursor = { fg = C.cursor_fg, bg = C.cursor_bg },
  TermCursorNC = { fg = C.cursor_fg, bg = C.cursor_bg },
  Conceal = { fg = C.accent, bg = Config.transparent_background and "NONE" or C.bg },
  Directory = { fg = C.blue },
  SpecialKey = { fg = C.blue, style = "bold" },
  Title = { fg = C.blue, style = "bold" },
  ErrorMsg = { fg = C.error_red, bg = C.bg, style = "bold" },
  Search = { fg = C.light_gray, bg = C.search_blue },
  IncSearch = { fg = C.light_gray, bg = C.search_blue },
  Substitute = { fg = C.light_gray, bg = C.search_orange },
  MoreMsg = { fg = C.orange },
  Question = { fg = C.orange },
  EndOfBuffer = { fg = C.bg },
  NonText = { fg = C.context },
  Variable = { fg = C.cyan },
  String = { fg = C.green },
  Character = { fg = C.green },
  Constant = { fg = C.orange },
  Number = { fg = C.orange },
  Boolean = { fg = C.orange },
  Float = { fg = C.orange },
  Identifier = { fg = C.fg },
  Function = { fg = C.blue },
  Operator = { fg = C.purple },
  Type = { fg = C.yellow },
  StorageClass = { fg = C.cyan },
  Structure = { fg = C.purple },
  Typedef = { fg = C.purple },
  Keyword = { fg = C.purple },
  Statement = { fg = C.purple },
  Conditional = { fg = C.purple },
  Repeat = { fg = C.purple },
  Label = { fg = C.blue },
  Exception = { fg = C.purple },
  Include = { fg = C.purple },
  PreProc = { fg = C.purple },
  Define = { fg = C.purple },
  Macro = { fg = C.purple },
  PreCondit = { fg = C.purple },
  Special = { fg = C.purple },
  SpecialChar = { fg = C.fg },
  Tag = { fg = C.blue },
  Debug = { fg = C.red },
  Delimiter = { fg = C.fg },
  SpecialComment = { fg = C.gray },
  Underlined = { style = "underline" },
  Bold = { style = "bold" },
  Italic = { style = "italic" },
  Ignore = { fg = C.cyan, bg = C.bg, style = "bold" },
  Todo = { fg = C.red, bg = C.bg, style = "bold" },
  Error = { fg = C.error_red, bg = C.bg, style = "bold" },
  TabLine = { fg = C.light_gray, bg = C.alt_bg },
  TabLineSel = { fg = C.fg, bg = C.alt_bg },
  TabLineFill = { fg = C.fg, bg = C.alt_bg },
  CmpDocumentation = { fg = C.fg, bg = C.none },
  CmpDocumentationBorder = { fg = C.fg_dark, bg = C.none },
  CmpItemAbbr = { fg = C.fg, bg = C.none },
  CmpItemAbbrDeprecated = { fg = C.gray, bg = C.none },
  CmpItemAbbrMatch = { fg = C.cyan, bg = C.none },
  CmpItemAbbrMatchFuzzy = { fg = C.cyan, bg = C.none },
  CmpItemKind = { fg = C.blue, bg = C.none },
  CmpItemMenu = { fg = C.light_gray, bg = C.none },
}

local function highlight(group, properties)
  local bg = properties.bg == nil and "" or "guibg=" .. properties.bg
  local fg = properties.fg == nil and "" or "guifg=" .. properties.fg
  local style = properties.style == nil and "" or "gui=" .. properties.style

  local cmd_str = table.concat({
    "highlight",
    group,
    bg,
    fg,
    style,
  }, " ")

  vim.cmd(cmd_str)
end

function M.setup()
  local Treesitter = require "onedarker-giel.highlights.Treesitter"
  local markdown = require "onedarker-giel.highlights.markdown"
  local Whichkey = require "onedarker-giel.highlights.Whichkey"
  local Notify = require "onedarker-giel.highlights.Notify"
  local Git = require "onedarker-giel.highlights.Git"
  local LSP = require "onedarker-giel.highlights.LSP"
  local Diff = require "onedarker-giel.highlights.Diff"

  local skeletons = {
    common,
    Treesitter,
    markdown,
    Whichkey,
    Notify,
    Git,
    LSP,
    Diff,
  }

  for _, skeleton in ipairs(skeletons) do
    for group, properties in pairs(skeleton) do
      highlight(group, properties)
    end
  end
end

return M
