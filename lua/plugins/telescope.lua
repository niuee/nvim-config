return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",  -- optional, for file icons
    -- FZF sorter; `build` must be on this spec so make runs in fzf-native's own directory
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  opts = {
    defaults = {
      prompt_prefix = "🔍 ",
      selection_caret = "➜ ",
      path_display = { "truncate" },
      file_ignore_patterns = { "node_modules", ".git/" },
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
          results_width = 0.8,
        },
        vertical = { mirror = false },
      },
      sorting_strategy = "ascending",
      color_devicons = true,
      winblend = 10,
    },
    pickers = {
      find_files = {
        theme = "dropdown",
      },
      buffers = {
        sort_lastused = true,
        theme = "dropdown",
        previewer = false,
      },
      live_grep = {},
      oldfiles = {
        theme = "dropdown",
      },
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)

    -- load fzf-native if installed
    pcall(telescope.load_extension, "fzf")
  end,
}

