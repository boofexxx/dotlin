local list = {
    { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
    { key = { "O" }, action = "edit_no_picker" },
    { key = "<C-v>", action = "vsplit" },
    { key = "<C-s>", action = "split" },
    { key = "<C-t>", action = "tabnew" },

    { key = { "<2-RightMouse>", "<C-]>" }, action = "cd" },
    { key = "K", action = "prev_sibling" },
    { key = "J", action = "next_sibling" },
    { key = "P", action = "parent_node" },
    { key = "-", action = "dir_up" },

    { key = "<BS>", action = "close_node" },
    { key = "<Tab>", action = "preview" },

    { key = "I", action = "toggle_git_ignored" },
    { key = "H", action = "toggle_dotfiles" },
    { key = "R", action = "refresh" },
    { key = "a", action = "create" },
    { key = "d", action = "remove" },
    { key = "r", action = "rename" },
    { key = "<C-r>", action = "full_rename" },
    { key = "x", action = "cut" },
    { key = "c", action = "copy" },
    { key = "p", action = "paste" },
    { key = "y", action = "copy_name" },
    { key = "Y", action = "copy_path" },
    { key = "gy", action = "copy_absolute_path" },
    { key = "[g", action = "prev_git_item" },
    { key = "]g", action = "next_git_item" },
    { key = "s", action = "system_open" },
    { key = "q", action = "close" },
    { key = "g?", action = "toggle_help" },
    { key = "W", action = "collapse_all" },
    { key = "<C-k>", action = "toggle_file_info" },
    { key = ".", action = "run_file_command" }
}

require('nvim-tree').setup {
    auto_reload_on_write = false,
    disable_netrw = true,
    hijack_cursor = true,
    sort_by = "type",
    update_cwd = true,
    view = {
        width = 30,
        height = 30,
        side = "left",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "no",
        mappings = {
            custom_only = true,
            list = list,
        }
    },
    renderer = {
        indent_markers = {
            enable = true,
            icons = {
                corner = "└ ",
                edge = "│ ",
                none = "  ",
            },
        },
        icons = {
            webdev_colors = false,
            show = {
                git = false,
                folder = false,
                file = false,
                folder_arrow = false,
            },
        },
    },
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    git = {
        enable = false,
        ignore = true,
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = true,
            restrict_above_cwd = false,
        },
        open_file = {
            quit_on_open = false,
            resize_window = false,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
    },
}
