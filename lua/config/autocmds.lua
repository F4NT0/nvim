--[[ ============================================================================
AUTOCOMMANDS
============================================================================
Lightweight autocommands. Keep this file small — heavy filetype logic should
live in `ftplugin/` or in the plugin spec that owns it.
============================================================================ ]]

local function augroup(name)
  return vim.api.nvim_create_augroup("nvim_" .. name, { clear = true })
end

-- Briefly highlight the yanked region.
vim.api.nvim_create_autocmd("TextYankPost", {
  group    = augroup("highlight_yank"),
  callback = function() vim.highlight.on_yank({ timeout = 150 }) end,
})

-- Trim trailing whitespace on save (skip markdown so trailing spaces stay
-- meaningful in line breaks).
vim.api.nvim_create_autocmd("BufWritePre", {
  group    = augroup("trim_whitespace"),
  callback = function()
    if vim.bo.filetype == "markdown" or vim.bo.filetype == "mdx" then return end
    local save = vim.fn.winsaveview()
    vim.cmd([[keepjumps %s/\s\+$//e]])
    vim.fn.winrestview(save)
  end,
})

-- Restore last cursor position when reopening a file.
vim.api.nvim_create_autocmd("BufReadPost", {
  group    = augroup("last_loc"),
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local lcount = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Close certain helper buffers with `q`.
vim.api.nvim_create_autocmd("FileType", {
  group   = augroup("close_with_q"),
  pattern = { "help", "qf", "lspinfo", "checkhealth", "man", "notify" },
  callback = function(args)
    vim.bo[args.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = args.buf, silent = true })
  end,
})
