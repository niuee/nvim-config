return {
  "olimorris/codecompanion.nvim",
  version = "^18.0.0",
  opts = {
    interactions = {
      chat = {
        adapter = "anthropic",
        model = "claude-sonnet-4-20250514"
      },
    },
    -- NOTE: The log_level is in `opts.opts`
    opts = {
      log_level = "DEBUG",
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}

