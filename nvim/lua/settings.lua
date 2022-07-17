local opt = vim.opt
local cmd = vim.cmd

-- General
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.swapfile = false
opt.autochdir = false
opt.autowrite = true
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldenable = false
opt.foldlevelstart = 3
opt.wildignorecase = true
opt.updatetime = 1000

-- Neovim UI
opt.number = true
opt.ignorecase = true
opt.smartcase = true
opt.splitright = true
opt.splitbelow = true
opt.linebreak = true
opt.signcolumn = 'yes'
opt.list = true
opt.listchars = { tab = '│ ', trail = '-', extends = '>', precedes = '<', nbsp = '+' }
opt.guicursor = ''
opt.inccommand = 'nosplit'
opt.scrolloff = 5
opt.sidescrolloff = 5
opt.wrap = false
opt.cursorline = true
opt.cursorlineopt = 'number'
opt.laststatus = 3
opt.showtabline = 2
opt.showmode = false

-- Tabs, indent
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 0
opt.smartindent = true

cmd [[
    cnoreabbrev git Gitsigns

    colorscheme gruvbox7
]]
