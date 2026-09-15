return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    local npairs = require("nvim-autopairs")
    local Rule = require("nvim-autopairs.rule")

    npairs.setup({
      check_ts = true, -- Use treesitter to check for pairs
      ts_config = {
        lua = { "string" }, -- Don't add pairs in lua string treesitter nodes
        javascript = { "template_string" },
        typescript = { "template_string" },
      },
      fast_wrap = {
        map = "<M-e>", -- Alt+e to wrap with pairs
        chars = { "{", "[", "(", '"', "'", "`" },
        pattern = [=[[%'%"%`%>%]%)%}%,]]=],
        end_key = "$",
        before_key = "h",
        after_key = "l",
        cursor_pos_before = true,
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        manual_position = true,
        highlight = "Search",
        highlight_grey = "Comment",
      },
      map_cr = true, -- Enable CR for bracket expansion
    })

    -- Add backtick pairing for all filetypes
    npairs.add_rule(Rule("`", "`"))
  end,
}
