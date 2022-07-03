local M = {}

local api = vim.api

local function get_tab_name(tab)
    local win = api.nvim_tabpage_get_win(tab)
    local buf = api.nvim_win_get_buf(win)
    local name = api.nvim_buf_get_name(buf)

    name = api.nvim_call_function('fnamemodify', { name, ':p:t' })
    if name == '' then
        return 'No Name'
    end
    return name
end

local function tabline()
    local tab_list = api.nvim_list_tabpages()
    local current_tab = api.nvim_get_current_tabpage()

    local s = ''
    for i, tab in ipairs(tab_list) do
        local name = get_tab_name(tab)
        -- set the tab page number (for mouse clicks)
        s = s .. '%' .. i .. 'T'
        if tab == current_tab then
            s = string.format('%s %s %s:%s', s, '%#TabLineSel#', i, name)
        else
            s = string.format('%s %s %s:%s', s, '%#TabLine#', i, name)
        end
    end
    return string.format('%s %s', s, '%#TabLineFill#')
end

function M.setup()
    function _G.tabline()
        return tabline()
    end

    vim.o.tabline = "%!v:lua.tabline()"
end

return M
