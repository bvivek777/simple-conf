local g = vim.g
local o = vim.opt

g.mapleader    = " "
o.number       = true
o.clipboard    = "unnamedplus"
o.syntax       = "on"
o.autoindent   = true
o.expandtab    = true
o.shiftwidth   = 2
o.tabstop      = 2
o.encoding     = "UTF-8"
o.ruler        = true
o.mouse        = "a"
o.title        = true
o.hidden       = true
o.ttimeoutlen  = 0
o.showmatch    = true
o.inccommand   = "split"
o.splitright   = true
o.splitbelow   = false
o.cursorline   = true

vim.diagnostic.config({
  virtual_text = true,

  signs = true,

  underline = true,

  update_in_insert = false,

  severity_sort = true,
})

vim.diagnostic.config({
  virtual_text = {
    -- Use a prefix for the message
    prefix = '●', -- You can use nerd font icons here
    -- Only show the source of the diagnostic if there are multiple sources
    source = 'if_many',
    -- Add some spacing to the left of the virtual text
    spacing = 4,
  },
})
