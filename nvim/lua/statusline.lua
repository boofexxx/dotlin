local api = vim.api

local separators = { ' ', ' ' }

local colors = {
    active         = '%#StatusLine#',
    inactive       = '%#StatuslineNC#',
    mode           = '%#Mode#',
    mode_alt       = '%#ModeAlt#',
    git            = '%#Git#',
    git_alt        = '%#GitAlt#',
    diagnostic     = '%#Diagnostic#',
    diagnostic_alt = '%#DiagnosticAlt#',
    filename       = '%#Filename#',
    filename_alt   = '%#FilenameAlt#',
    treesitter     = '%#Treesitter#',
    filetype       = '%#Filetype#',
    filetype_alt   = '%#FiletypeAlt#',
    line_col       = '%#LineCol#',
    line_col_alt   = '%#LineColAlt#',
}

local trunc_width = setmetatable({
    mode       = 80,
    git_status = 90,
    diagnostic = 120,
    filename   = 140,
    line_col   = 60,
    treesitter = 80,
}, { __index = function() return 80 end })

local modes = setmetatable({
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
    ['nt'] = { 'N·TERMINAL ', 'N·T' };
}, { __index = function() return { 'UNKNOWN', 'U' } end }) -- handle edge cases

local function is_truncated(width)
    -- if global statusline is used we omit truncating
    if vim.opt.laststatus._value == 3 then return false end

    return api.nvim_win_get_width(0) < width
end

local function get_current_mode()
    local current_mode = api.nvim_get_mode().mode

    if is_truncated(trunc_width.mode) then
        return string.format(' %s ', modes[current_mode][2])
    end
    return string.format(' %s ', modes[current_mode][1])
end

local function get_git_status()
    local signs = vim.b.gitsigns_status_dict
    if not signs or signs.head == '' then
        return ''
    end

    if is_truncated(trunc_width.git_status) then
        return string.format('© %s', signs.head)
    end

    return string.format('+%s ~%s -%s | © %s',
        signs.added or 0, signs.changed or 0, signs.removed or 0, signs.head)
end

local function get_filename()
    -- %< - Where to truncate line if too long. Default is at the start. No width fields allowed.
    -- %f - Path to the file in the buffer, as typed or relative to current directory.
    -- %m - Modified flag, text is "[+]"; "[-]" if 'modifiable' is off.
    -- %h - Help buffer flag, text is "[help]".
    return '%<%f %m %h'
end

local function get_treesitter()
    if is_truncated(trunc_width.treesitter) then
        return ''
    end
    return '%{%nvim_treesitter#statusline()%}'
end

local function get_line_col()
    return '%l:%c'
end

local function get_lsp_diagnostic()
    local levels = { errors = 'Error', warnings = 'Warn', info = 'Info', hints = 'Hint' }
    local signs = { errors = '!', warnings = '?', info = '#', hints = '$' }

    local result = {}
    for k, level in pairs(levels) do
        result[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
    end

    if is_truncated(trunc_width.diagnostic) then
        return ''
    end

    local s = ''
    if result['errors'] ~= 0 then
        s = string.format(' %s%s ', signs.errors, result.errors)
    end
    if result['warnings'] ~= 0 then
        s = string.format(' %s%s ', signs.warnings, result.warnings)
    end
    if result['hints'] ~= 0 then
        s = string.format(' %s%s ', signs.hints, result.hints)
    end
    if result['info'] ~= 0 then
        s = string.format(' %s%s ', signs.info, result.info)
    end
    if s ~= '' then return '|' .. s .. '|' end
    return ''
end

local function mode_color()
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
    return colors.mode
end

local function set_active()
    local mode = string.format('%s%s%s%s', mode_color(), get_current_mode(), colors.mode_alt, separators[1])

    local git = get_git_status()
    if git ~= '' then
        git = string.format('%s%s%s%s', colors.git, git, colors.git_alt, separators[1])
    end

    local diagnostic = get_lsp_diagnostic()
    if diagnostic ~= '' then
        diagnostic = string.format('%s%s%s%s', colors.git, diagnostic, colors.diagnostic_alt, separators[1])
    end

    local treesitter = get_treesitter()
    if treesitter ~= '' then
        treesitter = string.format('%s%s%s', colors.treesitter, treesitter, separators[1])
    end

    local filetype = string.format('%s%s%s%s', colors.filetype, '%y', colors.filetype_alt, separators[2])

    local line_col = string.format('%s%s%s%s', colors.line_col, get_line_col(), colors.line_col_alt, separators[2])

    return mode .. git .. '%=' .. treesitter .. '%=' .. diagnostic .. filetype .. line_col
end

local function set_inactive()
    -- %= - Separation point between alignment sections. Each section will be separated by an equal number of spaces.
    return string.format('%%=%s%s%%=', colors.inactive, get_filename())
end

local M = {}

function M.setup()
    vim.statusline = function(mode)
        if mode == 'active' then return set_active() end
        if mode == 'inactive' then return set_inactive() end
    end
end

return M
