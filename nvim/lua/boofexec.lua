local M = {}

vim.boofexec = M

local api = vim.api

local function get_opts()
    local width = api.nvim_get_option('columns')
    local height = api.nvim_get_option('lines')
    local win_height = math.ceil(height * 0.8 - 4)
    local win_width = math.ceil(width * 0.8)
    local row = math.ceil((height - win_height) / 2 - 1)
    local col = math.ceil((width - win_width) / 2)
    local opts = {
        style = 'minimal',
        border = 'none',
        relative = 'editor',
        width = win_width + 2,
        height = win_height + 2,
        row = row - 1,
        col = col - 1,
        noautocmd = true,
    }
    return opts
end

local opts = get_opts()

function M:new(cmd)
    local obj = { cmd = cmd }
    self.__index = self
    return setmetatable(obj, self)
end

function M:execute()
    if not self.win or not api.nvim_win_is_valid(self.win) then
        self.buf = api.nvim_create_buf(false, true)
        self:toggle_window()
    else
        api.nvim_win_hide(self.win)
        self.win = api.nvim_open_win(self.buf, true, opts)
    end
    api.nvim_win_call(self.win, function() api.nvim_command(self.cmd) end)
end

function M:toggle_window()
    self.buf = self.buf or api.nvim_create_buf(false, true)
    if self.win and api.nvim_win_is_valid(self.win) then
        api.nvim_win_hide(self.win)
    else
        self.win = api.nvim_open_win(self.buf, true, opts)
    end
end
