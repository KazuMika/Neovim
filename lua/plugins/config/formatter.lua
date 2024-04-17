-- Utilities for creating configurations
--
local patch_clangformat_bug = function(f)
  local o = f()
  if o.args and type(o.args) == 'table' then
    local new_args = {}
    local skip = false
    for i, v in ipairs(o.args) do
      if skip then
        skip = false
      elseif v == '-assume-filename'
        and (o.args[i + 1] == "''" or o.args[i + 1] == '""')
      then
        skip = true
      elseif type(v) ~= 'string' or not v:find('^-style=') then
        table.insert(new_args, v)
      end
    end
    o.args = new_args
  end
  return o
end

local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    latex={

      require("formatter.filetypes.latex").bibtextidy,
    },
    python = {
      require("formatter.filetypes.python").black,
    },
    html = {
      require("formatter.filetypes.html").prettier,
    },
    markdown = {
      require("formatter.filetypes.markdown").prettier,
    },
    bash = {
      require("formatter.filetypes.sh").shfmt,
    },
    cpp = { patch_clangformat_bug(require('formatter.filetypes.cpp').clangformat) },


    lua = {
      -- "formatter.filetypes.lua" defines default configurations for the
      -- "lua" filetype
      -- require("formatter.filetypes.lua").stylua,
    },
    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})
