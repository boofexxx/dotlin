local M = {}

local api = vim.api

M.separators = { '', '' }

M.colors = {
    active       = '%#StatusLine#',
    inactive     = '%#StatuslineNC#',
    mode         = '%#Mode#',
    mode_alt     = '%#ModeAlt#',
    git          = '%#Git#',
    git_alt      = '%#GitAlt#',
    filetype     = '%#Filetype#',
    filetype_alt = '%#FiletypeAlt#',
    line_col     = '%#LineCol#',
    line_col_alt = '%#LineColAlt#',
}

M.trunc_width = setmetatable({
    mode       = 80,
    git_status = 90,
    diagnostic = 120,
    filename   = 140,
    line_col   = 60,
}, {
    __index = function()
        return 80
    end
})

M.modes = setmetatable({
    ['n']  = { 'NORMAL', 'N' };
    ['no'] = { 'N·PENDING', 'N·P' };
    ['v']  = { 'VISUAL', 'V' };
    ['V']  = { 'V·LINE', 'V·L' };
    ['']  = { 'V·BLOCK', 'V·B' };
    ['s']  = { 'SELECT', 'S' };
    ['S']  = { 'S·LINE', 'S·L' };
    ['']  = { 'S·BLOCK', 'S·B' };
    ['i']  = { 'INSERT', 'I' };
    ['ic'] = { 'INSERT', 'I' };
    ['R']  = { 'REPLACE', 'R' };
    ['Rv'] = { 'V·REPLACE', 'V·R' };
    ['c']  = { 'COMMAND', 'C' };
    ['cv'] = { 'VIM·EX ', 'V·E' };
    ['ce'] = { 'EX ', 'E' };
    ['r']  = { 'PROMPT ', 'P' };
    ['rm'] = { 'MORE ', 'M' };
    ['r?'] = { 'CONFIRM ', 'C' };
    ['!']  = { 'SHELL ', 'S' };
    ['t']  = { 'TERMINAL ', 'T' };
}, {
    __index = function()
        return { 'UNKNOWN', 'U' } -- handle edge cases
    end
})

function M.is_truncated(width)
    if vim.opt.laststatus._value == 3 then
        return
    end
    local current_width = api.nvim_win_get_width(0)
    return current_width < width
end

function M:get_current_mode()
    local current_mode = api.nvim_get_mode().mode

    if self.is_truncated(self.trunc_width.mode) then
        return string.format(' %s ', self.modes[current_mode][2])
    end
    return string.format(' %s ', self.modes[current_mode][1])
end

function M:get_git_status()
    -- use fallback because it doesn't set this variable on the initial `BufEnter`
    -- local signs = vim.b.gitsigns_status_dict or { head = '', added = 0, changed = 0, removed = 0 }
    local signs = vim.b.gitsigns_status_dict

    if not signs then return '' end

    local is_head_empty = signs.head == ''

    if self.is_truncated(self.trunc_width.git_status) then
        return not is_head_empty and string.format(' © %s ', signs.head or '') or ''
    end

    return not is_head_empty and string.format(
        ' +%s ~%s -%s | © %s ',
        signs.added, signs.changed, signs.removed, signs.head
    ) or ''
end

function M.get_filename()
    return ' %<%f %m '
end

function M.get_filetype()
    -- local file_name, file_ext = fn.expand('%:t'), fn.expand('%:e')
    -- local icon = require'nvim-web-devicons'.get_icon(file_name, file_ext, { default = true })
    local filetype = vim.bo.filetype

    if filetype == '' then return '' end
    return string.format(' %s ', filetype)
end

function M.get_line_col()
    return ' %l, %c '
end

function M.get_lsp_diagnostic(self)
    local result = {}
    local levels = {
        errors = 'Error',
        warnings = 'Warn',
        info = 'Info',
        hints = 'Hint'
    }
    for k, level in pairs(levels) do
        result[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
    end

    if self.is_truncated(self.trunc_width.diagnostic) then
        return ''
    else
        local errors = ''
        local warnings = ''
        local hints = ''
        local info = ''
        if result['errors'] ~= 0 then
            errors = ' ! ' .. result['errors']
        end
        if result['warnings'] ~= 0 then
            warnings = ' ? ' .. result['warnings']
        end
        if result['hints'] ~= 0 then
            hints = ' $ ' .. result['hints']
        end
        if result['info'] ~= 0 then
            info = ' # ' .. result['info']
        end
        return errors .. warnings .. hints .. info
    end
end

function M:mode_color()
    local m = api.nvim_get_mode().mode
    if m == 'n' or m == 'no' then
        return '%#NormalMode#'
    elseif m == 'v' or m == 'V' or m == '' then
        return '%#VisualMode#'
    elseif m == 'i' or m == 'ic' then
        return '%#InsertMode#'
    elseif m == 'R' or m == 'Rv' then
        return '%#ReplaceMode#'
    elseif m == 'c' or m == 'cv' or m == 'ce' or 'r' then
        return '%#CommandMode#'
    end
    return self.colors.mode
end

function M:set_active()
    local colors = self.colors

    local mode = string.format("%s%s", self:mode_color(), self:get_current_mode())
    local mode_alt = string.format("%s %s", self.colors.mode_alt, self.separators[1])
    local git = string.format("%s%s", colors.git, self:get_git_status())
    local git_alt = string.format("%s%s", colors.git_alt, self.separators[1])
    local diagnostic = string.format("%s%s", colors.git, self:get_lsp_diagnostic())
    local filename = string.format("%s%s", colors.active, self.get_filename())
    local filetype_alt = string.format("%s%s", colors.filetype_alt, self.separators[2])
    local filetype = string.format("%s%s", colors.filetype, self:get_filetype())
    local line_col = string.format("%s%s", colors.line_col, self:get_line_col())
    local line_col_alt = string.format("%s%s", colors.line_col_alt, self.separators[2])

    return table.concat({
        colors.active, mode, mode_alt, git, git_alt, diagnostic, filename, '%=',
        filetype_alt, filetype, line_col_alt, line_col
    })
end

function M:set_inactive()
    return self.colors.inactive .. '%= %F %='
end

Statusline = setmetatable(M, {
    __call = function(statusline, mode)
        if mode == 'active' then return statusline:set_active() end
        if mode == 'inactive' then return statusline:set_inactive() end
    end
})
