-- Module for configuring some global autocommand which will always be loaded at startup
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- local autocmd = require("utils").autocmd
-- local augroup = require("utils").augroup
--
-- autocmd("FocusLost", {
--   desc = "Save/write all unsaved buffers when focus is lost",
--   group = augroup("save_buffers"),
--   pattern = "*",
--   command = "silent! wall",
-- })
--
-- autocmd("BufReadPost", {
--   desc = "Jump to the last known position of a file before closing it",
--   group = augroup("buffer_checkpoint"),
--   callback = function()
--     local mark = vim.api.nvim_buf_get_mark(0, '"')
--     local line_count = vim.api.nvim_buf_line_count(0)
--
--     if mark[1] > 0 and mark[1] <= line_count then
--       pcall(vim.api.nvim_win_set_cursor, 0, mark)
--     end
--   end,
-- })
--
-- autocmd("VimResized", {
--   desc = "Resize the splits if the window is resized",
--   group = augroup("resize_splits"),
--   callback = function()
--     vim.cmd("tabdo wincmd =")
--   end,
-- })
--
-- autocmd({ "CursorMoved", "CursorMovedI" }, {
--   desc = "Redraw the cursorline when navigating around the buffer",
--   group = augroup("cursorline_number"),
--   callback = function()
--     if vim.wo.cursorline then
--       vim.cmd("redraw")
--     end
--   end,
-- })
