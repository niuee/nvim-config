return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
    signcolumn = true,
    numhl = false,
    linehl = false,
    current_line_blame = true,       -- <== show blame
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol",          -- end of line
      delay = 500,                    -- 0.5s delay before showing
      ignore_whitespace = false,
    },
  },
}

