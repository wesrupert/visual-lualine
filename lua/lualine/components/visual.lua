local M = require('lualine.component'):extend()

local default_options = {
  char_count = true,
  word_count = true,
  line_count = true,
  format = '[%dC:%dW:%dL]',
}

M.init = function (self, options)
  M.super.init(self, options)
  self.options = vim.tbl_deep_extend('keep', self.options or {}, default_options)
end

M.update_status = function (self)
  if vim.fn.mode():find("[Vv]") == nil then return '' end

  local format = self.options.format or '[%dC:%dW:%dL]'
  local chars --[[@type string|integer]] = ''
  local words --[[@type string|integer]] = ''
  local lines --[[@type string|integer]] = ''

  if self.options.char_count or self.options.word_count then
    local wc = vim.fn.wordcount()
    chars = self.options.line_count and wc.visual_chars or ''
    words = self.options.line_count and wc.visual_words or ''
  end

  if self.options.word_count then
    lines = math.abs(vim.fn.line(".") - vim.fn.line("v")) + 1
  end

  local opts --[[@type table<string|integer>]] = {}
  if self.options.char_count then opts[#opts+1] = chars end
  if self.options.word_count then opts[#opts+1] = words end
  if self.options.line_count then opts[#opts+1] = lines end

  return string.format(format, opts[1], opts[2], opts[3])
end

return M