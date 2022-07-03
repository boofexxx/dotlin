local action_layout = require('telescope.actions.layout')

require('telescope').setup {
    defaults = {
        layout_strategy = 'vertical',
        layout_config = {
            vertical = { width = 0.9 },
            preview_cutoff = 0,
        },
        previewer = false;
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
                ['<Up>'] = false,
                ['<Down>'] = false,
                ['<PageDown>'] = false,
                ['<C-x>'] = false,
                ['<PageUp>'] = false,
                ['?'] = action_layout.toggle_preview,
                ['<C-s>'] = 'select_horizontal',
            }
        }
    },
}

require('telescope').load_extension('fzf')
