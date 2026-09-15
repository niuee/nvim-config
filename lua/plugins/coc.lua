return {
  "neoclide/coc.nvim",
  branch = "release",
  init = function()
    -- Installed automatically on first start of a new machine
    vim.g.coc_global_extensions = {
      "coc-json",
      "coc-tsserver",
      "coc-eslint",
      "coc-html",
      "@yaegassy/coc-volar",
    }
  end,
  config = function()
    -- Required settings
    vim.opt.backup = false
    vim.opt.writebackup = false
    vim.opt.updatetime = 300
    vim.opt.signcolumn = "yes"

    local keyset = vim.keymap.set

    -- Autocomplete: Check backspace
    function _G.check_back_space()
      local col = vim.fn.col(".") - 1
      return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
    end

    -- Smart Tab: select first item OR confirm if already selected
    local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
    function _G.smart_tab()
      if vim.fn["coc#pum#visible"]() == 1 then
        local info = vim.fn["coc#pum#info"]()
        if info["index"] == -1 then
          -- Nothing selected, select first item
          return vim.fn["coc#pum#next"](1)
        else
          -- Item already selected, confirm it
          return vim.fn["coc#pum#confirm"]()
        end
      elseif _G.check_back_space() then
        return vim.api.nvim_replace_termcodes("<Tab>", true, true, true)
      else
        return vim.fn["coc#refresh"]()
      end
    end
    keyset("i", "<TAB>", "v:lua.smart_tab()", { silent = true, expr = true })
    keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

    -- Enter - just normal new line
    keyset("i", "<CR>", [[<C-g>u<CR><c-r>=coc#on_enter()<CR>]], { silent = true, noremap = true })

    -- Ctrl+Space to trigger completion
    keyset("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })

    -- Navigate diagnostics
    keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
    keyset("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })

    -- GoTo code navigation
    keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
    keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
    keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true })
    keyset("n", "gr", "<Plug>(coc-references)", { silent = true })

    -- K to show documentation
    function _G.show_docs()
      local cw = vim.fn.expand("<cword>")
      if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
        vim.api.nvim_command("h " .. cw)
      elseif vim.api.nvim_eval("coc#rpc#ready()") then
        vim.fn.CocActionAsync("doHover")
      else
        vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
      end
    end
    keyset("n", "K", "<CMD>lua _G.show_docs()<CR>", { silent = true })

    -- Highlight symbol under cursor
    vim.api.nvim_create_augroup("CocGroup", {})
    vim.api.nvim_create_autocmd("CursorHold", {
      group = "CocGroup",
      command = "silent call CocActionAsync('highlight')",
      desc = "Highlight symbol under cursor on CursorHold",
    })

    -- Symbol renaming
    keyset("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })

    -- Code actions
    local opts_nowait = { silent = true, nowait = true }
    keyset("n", "<leader>ca", "<Plug>(coc-codeaction-cursor)", opts_nowait)
    keyset("x", "<leader>ca", "<Plug>(coc-codeaction-selected)", opts_nowait)
    keyset("n", "<leader>qf", "<Plug>(coc-fix-current)", opts_nowait)

    -- Formatting
    keyset("x", "<leader>f", "<Plug>(coc-format-selected)", { silent = true })
    keyset("n", "<leader>f", "<Plug>(coc-format-selected)", { silent = true })

    -- Setup formatexpr for typescript/json
    vim.api.nvim_create_autocmd("FileType", {
      group = "CocGroup",
      pattern = "typescript,json",
      command = "setl formatexpr=CocAction('formatSelected')",
    })

    -- Add :Format command
    vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

    -- Add :OR command for organize imports
    vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

    -- Scroll float windows
    local opts_scroll = { silent = true, nowait = true, expr = true }
    keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts_scroll)
    keyset("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts_scroll)
    keyset("i", "<C-f>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts_scroll)
    keyset("i", "<C-b>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts_scroll)

    -- CocList mappings
    keyset("n", "<leader>a", ":<C-u>CocList diagnostics<cr>", opts_nowait)
    keyset("n", "<leader>o", ":<C-u>CocList outline<cr>", opts_nowait)
    keyset("n", "<leader>s", ":<C-u>CocList -I symbols<cr>", opts_nowait)
  end,
  sources = {
    per_filetype = {
      codecompanion = { "codecompanion" },
    }
  },
}
