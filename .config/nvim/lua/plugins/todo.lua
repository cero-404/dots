require("todo-comments").setup {
  signs = true,
  keywords = {
    FIX = {
      icon = " ", -- Bug icon
      color = "error"
    },
    TODO = {
      icon = " ", -- Check icon
      color = "info"
    },
    HACK = {
      icon = " ",
      color = "warning"
    },
    WARN = {
      icon = " ",
      color = "warning"
    },
    PERF = {
      icon = " ",
      color = "default"
    },
    NOTE = {
      icon = " ",
      color = "hint"
    },
  },
  highlight = {
    before = "", -- don't highlight before keyword
    keyword = "bg", -- bg, fg, wide, wide_bg, wide_fg
    after = "fg", -- highlight the text after keyword
  },
}
