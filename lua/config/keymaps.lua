-----------------------------------------------
--  _  __                                    
-- | |/ /                                    
-- | ' / ___ _   _ _ __ ___   __ _ _ __  ___ 
-- |  < / _ \ | | | '_ ` _ \ / _` | '_ \/ __|
-- | . \  __/ |_| | | | | | | (_| | |_) \__ \
-- |_|\_\___|\__, |_| |_| |_|\__,_| .__/|___/
--            __/ |               | |        
--           |___/                |_|        
--------------------------------------------------

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


------------
-- NEOTREE
-------------

-- Ctrl + F = Open File System in a Float Window
vim.keymap.set('n', '<C-f>', ':Neotree filesystem float<CR>', {})

-- Ctrl + B = Open Git Status from Neotree
vim.keymap.set('n', '<C-b>', ':Neotree float git_status<CR>', {})

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

-- Space + D + T = Debug Toggle Breakpoint
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

--------------------
-- SPRING BOOT NVIM 
-------------------- 

-- Space + Shift + J + R = Run Spring Boot
vim.keymap.set("n", "<leader>Jr", require("springboot-nvim").boot_run, { desc = "[J]ava [R]un Spring Boot" })

-- Space + Shift + J + C = Create Java Class
vim.keymap.set("n", "<leader>Jc", require("springboot-nvim").generate_class, { desc = "[J]ava Create [C]lass" })

-- Space + Shift + J + I = Create Java Interface
vim.keymap.set("n", "Ji", require("springboot-nvim").generate_interface, { desc = "[J]ava Create [I]nterface" })

-- Space + Shift + J + E = Create Java Enum
vim.keymap.set("n", "Je", require("springboot-nvim").generate_enum, { desc = "[J]ava Create [E]num" })
