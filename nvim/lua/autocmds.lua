local api = vim.api

local yankGrp = api.nvim_create_augroup('yankGrp', {})
api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank({ timeout = 500 }) end,
    group = yankGrp,
})

local cursorGrp = api.nvim_create_augroup('cursorGrp', {})
api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
    callback = function() vim.lsp.buf.document_highlight() end,
    group = cursorGrp,
})
api.nvim_create_autocmd('CursorMoved', {
    callback = function() vim.lsp.buf.clear_references() end,
    group = cursorGrp,
})

local formatGrp = api.nvim_create_augroup('formatGrp', {})
api.nvim_create_autocmd('BufWritePre', {
    pattern = { "*.go" },
    callback = function() vim.lsp.buf.go.imports(1000) end,
    group = formatGrp,
})
api.nvim_create_autocmd('BufWritePre', {
    callback = function() vim.lsp.buf.formatting_sync(nil, 500) end,
    group = formatGrp,
})

local statuslineGrp = api.nvim_create_augroup('statuslineGrp', {})
api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
    callback = function() vim.opt_local.statusline = "%!v:lua.vim.statusline('active')" end,
    group = statuslineGrp,
})
api.nvim_create_autocmd('WinLeave', {
    callback = function() vim.opt_local.statusline = vim.statusline('inactive') end,
    group = statuslineGrp,
})
