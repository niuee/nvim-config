-- LSP is now handled by coc.nvim
-- This file is kept for Mason (optional tool installer)
-- You can delete this file if you don't need Mason

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
}
