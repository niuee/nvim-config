require("config.lazy")

-- jk to leave insert mode
vim.keymap.set("i", "jk", "<Esc>")

-- Tab settings: 2 spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- Vue: treat kebab-case names (my-component, v-model) as one word
vim.api.nvim_create_autocmd("FileType", {
  pattern = "vue",
  callback = function()
    vim.opt_local.iskeyword:append("-")
  end,
})

-- Neotree
vim.keymap.set("n", "<leader>e", ":Neotree toggle reveal<CR>", { silent = true })

-- Bufferline
-- Go to next buffer
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
-- Go to previous buffer
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })

-- Close current buffer, keeping the window layout (asks first if unsaved)
vim.keymap.set("n", "<leader>bc", function()
  require("mini.bufremove").delete(0, false)
end, { silent = true, desc = "Close buffer" })

vim.keymap.set("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>")
vim.keymap.set("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>")

-- Telescope
local builtin = require("telescope.builtin")

-- Find files
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope: Find Files" })
-- Live grep
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope: Live Grep" })
-- List open buffers
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope: Buffers" })
-- Recently opened files
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Telescope: Recent Files" })
-- Help tags
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope: Help Tags" })


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- gi is now handled by coc.nvim (coc-implementation)

