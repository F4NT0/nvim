--[[
  _  __                                    
 | |/ /                                    
 | ' / ___ _   _ _ __ ___   __ _ _ __  ___ 
 |  < / _ \ | | | '_ ` _ \ / _` | '_ \/ __|
 | . \  __/ |_| | | | | | | (_| | |_) \__ \
 |_|\_\___|\__, |_| |_| |_|\__,_| .__/|___/
            __/ |               | |        
           |___/                |_|        
--]]


-------------
-- LAZY GIT
-------------

-- Ctrl + L = Open Lazy Git in a Floating window


--------
-- CMP
--------

-- Ctrl + K = Previous Suggestions
-- Ctrl + J = Next Suggestions
-- Ctrl + B = Scroll docs below
-- Ctrl + Space = Show completion suggestions
-- Ctrl + F = Scroll docs above
-- Ctrl + E = Close completion window
-- Enter = Confirm Selection

------------
-- COMMENT
------------

-- G + C + C = comment the current line
-- G + B + C = comment the current block
-- G + C + O = Insert comment next line
-- G + C + Shift + O = Insert comment previous line
-- G + C + Shift + A = Insert the comment in the end of current line


------------------
-- NVIM SURROUND
------------------ 

-- COMMANDS:
--     Old text                    Command         New text
--------------------------------------------------------------------------------
--    surround_words             ysiw)           (surround_words)
--    *make strings               ys$"            "make strings"
--    [delete ar*ound me!]        ds]             delete around me!
--    remove <b>HTML t*ags</b>    dst             remove HTML tags
--    'change quot*es'            cs'"            "change quotes"
--    <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
--    delete(functi*on calls)     dsf             function calls

-----------
-- BARBAR
-----------

-- Alt + , = Change tab to the previous one
vim.keymap.set('n','<A-,>', '<Cmd>BufferPrevious<CR>', { desc = "Change tab to previous one" })
-- Alt + . = Change tab to the next one
vim.keymap.set('n','<A-.>', '<Cmd>BufferNext<CR>', { desc = "Change tab to the next one" })
-- Alt + < = Reorder tabs to the left
vim.keymap.set('n','<A-<>', '<Cmd>BufferMovePrevious<CR>', { desc = "Reorder the tab to left" })
-- Alt + > = Reorder tabs to the right
vim.keymap.set('n','<A->>', '<Cmd>BufferMoveNext<CR>', { desc = "Reorder the tab to right" })
-- Alt + 1 = Move to tab 1
vim.keymap.set('n','<A-1>', '<Cmd>BufferGoto 1<CR>', { desc = "Move to tab 1" })
-- Alt + 2 = Move to tab 2
vim.keymap.set('n','<A-2>', '<Cmd>BufferGoto 2<CR>', { desc = "Move to tab 2" })
-- Alt + 3 = Move to tab 3
vim.keymap.set('n','<A-3>', '<Cmd>BufferGoto 3<CR>', { desc = "Move to tab 3" })
-- Alt + 4 = Move to tab 4
vim.keymap.set('n','<A-4>', '<Cmd>BufferGoto 4<CR>', { desc = "Move to tab 4" })
-- Alt + 5 = Move to tab 5
vim.keymap.set('n','<A-5>', '<Cmd>BufferGoto 5<CR>', { desc = "Move to tab 5" })
-- Alt + 6 = Move to tab 6
vim.keymap.set('n','<A-6>', '<Cmd>BufferGoto 6<CR>', { desc = "Move to tab 6" })
-- Alt + P = Pin current tab
vim.keymap.set('n','<A-p>', '<Cmd>BufferPin<CR>', { desc = "Pin current tab" })
-- Alt + C = Close current tab
vim.keymap.set('n','<A-c>', '<Cmd>BufferClose<CR>', { desc = "Close Current tab"})

------------
-- GITSIGNS
------------
local gitsigns = require("gitsigns")
-- Space + H + S = Stage the actual hunk into the index (like git add)
vim.keymap.set('n','<leader>hs',gitsigns.stage_hunk,{ desc = "Stage the actual hunk(like git add)" })
-- Space + H + R = Undo the actual hunk alterations
vim.keymap.set('n','<leader>hr',gitsigns.reset_hunk,{ desc = "Undo the actual hunk" })
-- Space + H + Shift + S = Stage All changes from the file
vim.keymap.set('n','<leader>hS',gitsigns.stage_buffer,{ desc = "Stage All buffer (all file)" })
-- Space + H + Shift + R = Undo All changes from the file 
vim.keymap.set('n','<leader>hR',gitsigns.reset_buffer,{ desc = "Undo All buffer (all file)" })
-- Space + H + P = Preview the hunk
vim.keymap.set('n','<leader>hp',gitsigns.preview_hunk,{ desc = "Preview the hunk of code changed" })

------------
-- NEOTREE
-------------

-- Ctrl + F = Open File System in a Float Window
vim.keymap.set('n', '<C-f>', ':Neotree filesystem left<CR>', { desc = "Open Neotree FileSystem" })

-- Ctrl + X = Close the Neotree
vim.keymap.set('n', '<C-x>', ':Neotree close<CR>', { desc = "Close the Neotree Filesystem" })

--------------
-- TELESCOPE
--------------

-- Ctrl + Shift + F = Open File Search in Telescope (Esc to exit)
vim.keymap.set('n', '<C-q>', require("telescope.builtin").find_files, {})

-- Ctrl + S = Open Word Search in Telescope (Esc to exit)
vim.keymap.set('n', '<C-s>', require("telescope.builtin").live_grep, {})

--------------
-- TOGGLETERM 
--------------

-- Ctrl + T = Open a terminal in a float window
-- Ctrl + G = Open Gemini CLI from Terminal
vim.keymap.set("n","<C-g>", function() require("toggleterm.terminal").Terminal:new({ cmd = "gemini", direction = "float", float_ops = { border = "double" }, hidden = true }):toggle() end, { desc = "Open Google Gemini CLI"})

---------------------------
-- DAP (Debug Application)
----------------------------

-- Space + D + T = Debug Toggle Breakpoint
vim.keymap.set('n', '<leader>dt', require("dap").toggle_breakpoint, { desc = "[D]ebug [T]oggle Breakpoint" })

-- Space + D + S = Debug Start
vim.keymap.set('n','<leader>ds', require("dap").continue, { desc = "[D]ebug [S]tart" })

-- Space + D + C = Debuf Close 
vim.keymap.set('n','<leader>dc', require("dapui").close, { desc = "[D]ebug [C]lose" })

--------
-- LSP
--------

-- Space + C + H = Code Hover Documentation
vim.keymap.set('n', '<leader>ch', vim.lsp.buf.hover, { desc = "[C]ode [H]over Documentation" })

-- Space + C + D = Code Go to Definition
vim.keymap.set('n','<leader>cd', vim.lsp.buf.definition, { desc = "[C]ode Goto [D]efinition" })

-- Space + C + A = Code Actions to fix the issue
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })

-- Space + C + R = Code Go to References
vim.keymap.set('n', '<leader>cr', require("telescope.builtin").lsp_references, { desc = "[C]ode Goto [R]eferences" })

-- Space + C + I = Code Go to Implementations
vim.keymap.set('n', '<leader>ci', require("telescope.builtin").lsp_implementations, { desc = "[C]ode Goto [I]mplementations" })

-- Space + C + Shift + R = Code Rename
vim.keymap.set('n', '<leader>cR', vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })

-- Space + C + Shift + D = Code Go to Declaration
vim.keymap.set('n', '<leader>cD', vim.lsp.buf.declaration, { desc = "[C]ode Goto [D]eclaration" })

-- Space + S + D = Show Diagnostic of the Warning or Error
vim.keymap.set('n', '<leader>sd', vim.diagnostic.open_float, { desc = "[S]how [D]iagnostics" })

-- Space + C + F = Format the code into the specific language
vim.keymap.set('n','<leader>cf', vim.lsp.buf.format, { desc = "[C]ode [F]ormat" })

-- Space + D + L = Show diagnostic list
vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = "[D]iagnostics [L]ists" })

-----------------
-- TODO COMMENTS
-----------------

-- Space + T + D = Open Todo List into the Telescope
vim.keymap.set('n', '<leader>td', '<cmd>TodoTelescope<CR>', { desc = "[T]o[D]o List" })


