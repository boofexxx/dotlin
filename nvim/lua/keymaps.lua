local map = vim.keymap.set
local opts = { noremap = true, silent = true }

local telescope = require('telescope.builtin')

map('n', '[d', vim.diagnostic.goto_prev, opts)
map('n', ']d', vim.diagnostic.goto_next, opts)
map('n', '<space>e', vim.diagnostic.open_float, opts)
map('n', '<space>d', function() telescope.diagnostics({ bufnr = 0 }) end, opts)
map('n', '<space>D', telescope.diagnostics, opts)

map('n', '<space>f', telescope.find_files, opts)
map('n', '<space>j', telescope.jumplist, opts)
map('n', '<space>/', telescope.live_grep, opts)
map('n', '<space>b', telescope.buffers, opts)
map('n', '<space>h', telescope.help_tags, opts)
map('n', '<space>\'', telescope.resume, opts)

map('n', 'gd', telescope.lsp_definitions, opts)
map('n', 'gD', telescope.lsp_type_definitions, opts)
map('n', 'gi', telescope.lsp_implementations, opts)
map('n', 'gr', telescope.lsp_references, opts)
map('n', '<space>s', telescope.lsp_document_symbols, opts)
map('n', '<space>S', telescope.lsp_dynamic_workspace_symbols, opts)
map('n', '<space>r', vim.lsp.buf.rename, opts)
map('n', '<space>a', vim.lsp.buf.code_action, opts)
map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
map('n', '<space>wl', function() vim.pretty_print(vim.lsp.buf.list_workspace_folders()) end, opts)

map('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', opts)
map('n', '<leader>n', '<cmd>NvimTreeFindFile<CR>', opts)

map('n', 'j', 'gj', opts)
map('n', 'k', 'gk', opts)

local gitsigns = require('gitsigns')
map('n', ']g', gitsigns.next_hunk, opts)
map('n', '[g', gitsigns.prev_hunk, opts)
map('n', '<space>gs', gitsigns.stage_hunk, opts)
map('n', '<space>gp', gitsigns.preview_hunk, opts)

map('n', '<space>1', '<cmd>tabn1<CR>', opts)
map('n', '<space>2', '<cmd>tabn2<CR>', opts)
map('n', '<space>3', '<cmd>tabn3<CR>', opts)
map('n', '<space>4', '<cmd>tabn4<CR>', opts)
map('n', '<space>5', '<cmd>tabn5<CR>', opts)
map('n', '<space>6', '<cmd>tabn6<CR>', opts)
map('n', '<space>7', '<cmd>tabn7<CR>', opts)
map('n', '<space>8', '<cmd>tabn8<CR>', opts)
map('n', '<space>9', '<cmd>tabn9<CR>', opts)

map('n', '<space>ms', ':mksession! ', { noremap = true })

map('i', 'jk', '<Esc>', opts)

map('n', '<C-l>', '<cmd>nohlsearch<CR>', opts)

map('i', '<C-A>', '<Home>', opts)
map('i', '<C-B>', '<Left>', opts)
map('i', '<C-E>', '<End>', opts)
map('i', '<C-F>', '<Right>', opts)
map('i', '<C-D>', '<Del>', opts)

local exec = vim.boofexec:new('%d | read !sh #')
map({ 'n', 't' }, '<C-j>', function() exec:toggle_window() end, opts)
map({ 'n', 't' }, '<C-k>', function() exec:execute() end, opts)
