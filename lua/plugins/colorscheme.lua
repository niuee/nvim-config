return {
  "navarasu/onedark.nvim",
  lazy = false,
  priority = 1000, -- Load before other plugins
  config = function()
    require("onedark").setup({
      style = "dark", -- Options: dark, darker, cool, deep, warm, warmer
      transparent = false,
      term_colors = true,
      code_style = {
        comments = "italic",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none",
      },
      diagnostics = {
        darker = true,
        undercurl = true,
        background = true,
      },
    })
    require("onedark").load()
  end,
}
