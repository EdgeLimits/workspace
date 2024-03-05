-- Native (Vim / Nvim / Netrw) keymaps

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- window management
vim.keymap.set("n", "<leader>|", "<cmd>Vex<cr>", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>-", "<cmd>Hex<cr>", { desc = "Split window horizontally" }) -- split window horizontally

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 1 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 1 ? 'gj' : 'j'", { expr = true, silent = true })

-- File exploration (Netrw)
vim.keymap.set("n", "<leader>fe", "<cmd>Explore<cr>", { desc ="Open Netrw" })
