return {
  -- LSP config
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")

      -- Use the new recommended ts_ls server
      lspconfig.ts_ls.setup({
        on_attach = function(client, bufnr)
          -- disable ts formatting if you use prettier
          client.server_capabilities.documentFormattingProvider = false

          local buf_map = function(mode, lhs, rhs)
            vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true })
          end

          -- example keymaps for LSP
          buf_map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
          buf_map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
          buf_map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
          buf_map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
        end,
      })
    end,
  },

  -- Autocompletion framework
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
          { name = "luasnip" },
        },
      })
    end,
  },

  -- Optional: TypeScript utilities
  {
    "jose-elias-alvarez/typescript.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("typescript").setup({
        server = {
          on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
          end,
        },
      })
    end,
  },

  -- Optional: completion icons
  {
    "onsails/lspkind.nvim",
    config = function()
      require("lspkind").init()
    end,
  },
}

