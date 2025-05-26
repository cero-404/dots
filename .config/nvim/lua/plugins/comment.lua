local comment = require('Comment')

comment.setup({
    padding = true,  -- Add a space between comment and the line
    sticky = true,   -- Keep cursor in position after commenting
    ignore = nil,    -- Lines to ignore while commenting
    toggler = {
        line = 'gcc',  -- Keymap for line-comment toggle
        block = 'gbc', -- Keymap for block-comment toggle
    },
    opleader = {
        line = 'gc',   -- Keymap for line-comment operator
        block = 'gb',  -- Keymap for block-comment operator
    },
    extra = {
        above = 'gcO', -- Add comment on the line above
        below = 'gco', -- Add comment on the line below
        eol = 'gcA',   -- Add comment at the end of the line
    },
    mappings = {
        basic = true,   -- Enable basic mappings
        extra = true,    -- Enable extra mappings
    },
    pre_hook = nil,   -- Optional pre-hook function
    post_hook = nil,  -- Optional post-hook function
})

-- Set commentstrings for specific filetypes
local ft = require('Comment.ft')

-- Python
ft.set('python', {'# %s', '""" %s """'})

-- JavaScript
ft.set('javascript', {'// %s', '/* %s */'})

-- Go
ft.set('go', {'// %s', '/* %s */'})

-- Rust
ft.set('rust', {'// %s', '/* %s */'})

-- HTML
ft.set('html', {'<!-- %s -->'})

-- CSS
ft.set('css', {'/* %s */'})
