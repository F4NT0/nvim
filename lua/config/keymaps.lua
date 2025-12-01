--[[

CONFIGURAÇÃO DE ATALHOS DE TECLADO NO NEOVIM

--]]

-----------
-- BARBAR
-----------

vim.keymap.set('n','<A-,>', '<Cmd>BufferPrevious<CR>', { desc = "Change tab to previous one" })
vim.keymap.set('n','<A-.>', '<Cmd>BufferNext<CR>', { desc = "Change tab to the next one" })
vim.keymap.set('n','<A-<>', '<Cmd>BufferMovePrevious<CR>', { desc = "Reorder the tab to left" })
vim.keymap.set('n','<A->>', '<Cmd>BufferMoveNext<CR>', { desc = "Reorder the tab to right" })
vim.keymap.set('n','<A-1>', '<Cmd>BufferGoto 1<CR>', { desc = "Move to tab 1" })
vim.keymap.set('n','<A-2>', '<Cmd>BufferGoto 2<CR>', { desc = "Move to tab 2" })
vim.keymap.set('n','<A-3>', '<Cmd>BufferGoto 3<CR>', { desc = "Move to tab 3" })
vim.keymap.set('n','<A-4>', '<Cmd>BufferGoto 4<CR>', { desc = "Move to tab 4" })
vim.keymap.set('n','<A-5>', '<Cmd>BufferGoto 5<CR>', { desc = "Move to tab 5" })
vim.keymap.set('n','<A-6>', '<Cmd>BufferGoto 6<CR>', { desc = "Move to tab 6" })
vim.keymap.set('n','<A-p>', '<Cmd>BufferPin<CR>', { desc = "Pin current tab" })
vim.keymap.set('n','<A-c>', '<Cmd>BufferClose<CR>', { desc = "Close Current tab"})

------------
-- GITSIGNS
------------

local gitsigns = require("gitsigns")
vim.keymap.set('n','<leader>hs',gitsigns.stage_hunk,{ desc = "Stage the actual hunk(like git add)" })
vim.keymap.set('n','<leader>hr',gitsigns.reset_hunk,{ desc = "Undo the actual hunk" })
vim.keymap.set('n','<leader>hS',gitsigns.stage_buffer,{ desc = "Stage All buffer (all file)" })
vim.keymap.set('n','<leader>hR',gitsigns.reset_buffer,{ desc = "Undo All buffer (all file)" })
vim.keymap.set('n','<leader>hp',gitsigns.preview_hunk,{ desc = "Preview the hunk of code changed" })

------------
-- NEOTREE
-------------

vim.keymap.set('n', '<C-f>', ':Neotree filesystem left<CR>', { desc = "Open Neotree FileSystem" })
vim.keymap.set('n', '<C-x>', ':Neotree close<CR>', { desc = "Close the Neotree Filesystem" })

--------------
-- TELESCOPE
--------------

vim.keymap.set('n', '<C-q>', require("telescope.builtin").find_files, {})
vim.keymap.set('n', '<C-s>', require("telescope.builtin").live_grep, {})

---------------------------
-- DAP (Debug Application)
----------------------------

vim.keymap.set('n', '<leader>dt', require("dap").toggle_breakpoint, { desc = "[D]ebug [T]oggle Breakpoint" })
vim.keymap.set('n','<leader>ds', require("dap").continue, { desc = "[D]ebug [S]tart" })
vim.keymap.set('n','<leader>dc', require("dapui").close, { desc = "[D]ebug [C]lose" })

--------
-- LSP
--------

vim.keymap.set('n', '<leader>ch', vim.lsp.buf.hover, { desc = "[C]ode [H]over Documentation" })
vim.keymap.set('n','<leader>cd', vim.lsp.buf.definition, { desc = "[C]ode Goto [D]efinition" })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
vim.keymap.set('n', '<leader>cr', require("telescope.builtin").lsp_references, { desc = "[C]ode Goto [R]eferences" })
vim.keymap.set('n', '<leader>ci', require("telescope.builtin").lsp_implementations, { desc = "[C]ode Goto [I]mplementations" })
vim.keymap.set('n', '<leader>cR', vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
vim.keymap.set('n', '<leader>cD', vim.lsp.buf.declaration, { desc = "[C]ode Goto [D]eclaration" })
vim.keymap.set('n', '<leader>sd', vim.diagnostic.open_float, { desc = "[S]how [D]iagnostics" })
vim.keymap.set('n','<leader>cf', vim.lsp.buf.format, { desc = "[C]ode [F]ormat" })
vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = "[D]iagnostics [L]ists" })

-----------------
-- TODO COMMENTS
-----------------

vim.keymap.set('n', '<leader>td', '<cmd>TodoTelescope<CR>', { desc = "[T]o[D]o List" })


