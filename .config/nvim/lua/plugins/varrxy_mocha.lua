-- ~/.config/nvim/lua/catppuccin_config.lua

require("catppuccin").setup({
    flavour = "mocha", -- Using mocha flavor for a dark background
    background = {
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true,
    show_end_of_buffer = true,
    term_colors = true,
    dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = false,
    no_bold = true,
    no_underline = true,
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = { "bold" },
        functions = { "italic" },
        keywords = { "bold" },
        strings = { "italic" },
        variables = { "italic" },
        types = { "bold" },
    },
    default_integrations = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        lsp_saga = true,
        dashboard = true,
        notify = true,
        telescope = true,
        which_key = true,
        harpoon = true,
        leap = true,
        symbols_outline = true,
        mini = true,
    },
})

-- Define custom soft colors
vim.api.nvim_set_hl(0, 'Normal', { fg = '#A0C4FF', bg = '#1F1F1F' }) -- Soft Light Blue text
vim.api.nvim_set_hl(0, 'Comment', { fg = '#A6A1C1', italic = true }) -- Soft Lavender comments
vim.api.nvim_set_hl(0, 'Identifier', { fg = '#B8C4E8' }) -- Soft Periwinkle identifiers
vim.api.nvim_set_hl(0, 'String', { fg = '#9EBCF0', italic = true }) -- Soft Sky Blue strings
vim.api.nvim_set_hl(0, 'Keyword', { fg = '#C2A3E0', bold = true }) -- Soft Violet keywords
vim.api.nvim_set_hl(0, 'Function', { fg = '#C8B2E6', italic = true }) -- Soft Lilac functions

-- Warning and error colors (soft tones)
vim.api.nvim_set_hl(0, 'DiagnosticWarning', { fg = '#F6C5A8' }) -- Soft Peach for warnings
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = '#FFB3B3' }) -- Soft Salmon for errors
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = '#A0D7E1' }) -- Soft Turquoise for info
vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = '#A1D3C8' }) -- Soft Mint for hints

-- GitSigns highlight groups
vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = '#A6E3A1' })
vim.api.nvim_set_hl(0, 'GitSignsAddNr', { fg = '#A6E3A1' })
vim.api.nvim_set_hl(0, 'GitSignsAddLn', { bg = '#A6E3A1', fg = '#1F1F1F' })

vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = '#F9C74F' })
vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { fg = '#F9C74F' })
vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { bg = '#F9C74F', fg = '#1F1F1F' })

vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = '#FF6B6B' })
vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { fg = '#FF6B6B' })
vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { bg = '#FF6B6B', fg = '#1F1F1F' })

-- Apply the Catppuccin colorscheme
vim.cmd.colorscheme("catppuccin")

-- Additional settings for Neovim
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

-- Status line setup with lualine
require('lualine').setup {
    options = {
        theme = 'catppuccin',
        section_separators = {'', ''},
        component_separators = {'', ''},
    },
}

-- Set up nvim-tree
require("nvim-tree").setup({
    view = {
        adaptive_size = true,
        width = 30,
    },
    renderer = {
        highlight_git = true,
        highlight_opened_files = "all",
    },
})

-- Set up gitsigns
require('gitsigns').setup({
    numhl = false,
    linehl = false,
    word_diff = false,
})
