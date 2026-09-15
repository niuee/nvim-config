return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      show_buffer_close_icons = true,   -- show close button on each tab
      show_close_icon = false,          -- hide global close icon
      diagnostics = "nvim_lsp",         -- show LSP diagnostics
      always_show_bufferline = true,    -- always display tabline
      -- close via mini.bufremove so the window layout survives
      close_command = function(bufnr) require("mini.bufremove").delete(bufnr, false) end,
      right_mouse_command = function(bufnr) require("mini.bufremove").delete(bufnr, false) end,
    },
  },
}

