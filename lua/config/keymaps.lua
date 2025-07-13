-- Keymaps are configured here
vim.keymap.set('n', '<C-f>', ':Neotree filesystem float<CR>', {})
vim.keymap.set('n', '<C-b>', ':Neotree float git_status<CR>', {})

vim.keymap.set('n', '<C-p>', require("telescope.builtin").find_files, {})
vim.keymap.set('n', '<C-s>', require("telescope.builtin").live_grep, {})

vim.keymap.set("n","<C-g>", function() require("toggleterm.terminal").Terminal:new({ cmd = "gemini", direction = "float", float_ops = { border = "double" }, hidden = true }):toggle() end, { desc = "Open Google Gemini CLI"})

vim.keymap.set('n', 'dt', require("dap").toggle_breakpoint, { desc = "[D]ebug [T]oggle Breakpoint" })
vim.keymap.set('n','ds', require("dap").continue, { desc = "[D]ebug [S]tart" })
vim.keymap.set('n','dc', require("dapui").close, { desc = "[D]ebug [C]lose" })

vim.keymap.set('n', 'ch', vim.lsp.buf.hover, { desc = "[C]ode [H]over Documentation" })
vim.keymap.set('n','cd', vim.lsp.buf.definition, { desc = "[C]ode Goto [D]efinition" })
vim.keymap.set('n', 'ca', vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
vim.keymap.set('n', 'cr', require("telescope.builtin").lsp_references, { desc = "[C]ode Goto [R]eferences" })
vim.keymap.set('n', 'ci', require("telescope.builtin").lsp_implementations, { desc = "[C]ode Goto [I]mplementations" })
vim.keymap.set('n', 'cR', vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
vim.keymap.set('n', 'cD', vim.lsp.buf.declaration, { desc = "[C]ode Goto [D]eclaration" })
vim.keymap.set('n', '<leader>sd', vim.diagnostic.open_float, { desc = "[S]how [D]iagnostics" })

vim.keymap.set('n','cf', vim.lsp.buf.format, { desc = "[C]ode [F]ormat" })

vim.keymap.set("n", "Jr", require("springboot-nvim").boot_run, { desc = "[J]ava [R]un Spring Boot" })
vim.keymap.set("n", "Jc", require("springboot-nvim").generate_class, { desc = "[J]ava Create [C]lass" })
vim.keymap.set("n", "Ji", require("springboot-nvim").generate_interface, { desc = "[J]ava Create [I]nterface" })
vim.keymap.set("n", "Je", require("springboot-nvim").generate_enum, { desc = "[J]ava Create [E]num" })