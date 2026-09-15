-- LeetCode inside Neovim: launch with `nvim leetcode.nvim`, or run :Leet from a normal session
return {
  "kawre/leetcode.nvim",
  -- no `build = ":TSUpdate html"`: treesitter is lazy-loaded so that command fails here,
  -- and the html parser it needs is already in treesitter.lua's ensure_installed
  cmd = "Leet",
  -- load at startup only when launched as `nvim leetcode.nvim`
  lazy = "leetcode.nvim" ~= vim.fn.argv(0, -1),
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    lang = "typescript",
    picker = { provider = "telescope" },
  },
}
