
local wk = require("which-key")

wk.register({
       c = {
         name = "[C]ode",
         h = { vim.lsp.buf.hover, "Hover Documentation" },
         d = { vim.lsp.buf.definition, "Goto Definition" },
         a = { vim.lsp.buf.code_action, "Code Actions" },
         r = { require("telescope.builtin").lsp_references, "Goto References" },
         i = { require("telescope.builtin").lsp_implementations, "Goto Implementations" },
         R = { vim.lsp.buf.rename, "Rename" },
         D = { vim.lsp.buf.declaration, "Goto Declaration" },
         f = { vim.lsp.buf.format, "Format" },
      },
       d = {
         name = "[D]ebug",
         t = { require("dap").toggle_breakpoint, "Toggle Breakpoint" },
         s = { require("dap").continue, "Start" },
         c = { require("dapui").close, "Close" },
      },
       J = {
         name = "[J]ava",
         r = { require("springboot-nvim").boot_run, "Run Spring Boot" },
         c = { require("springboot-nvim").generate_class, "Create Class" },
         i = { require("springboot-nvim").generate_interface, "Create Interface" },
         e = { require("springboot-nvim").generate_enum, "Create Enum" },
      },
       N = {
         name = "[N]eotree",
         f = { ":Neotree filesystem float<CR>", "Neotree Filesystem" },
         b = { ":Neotree float git_status<CR>", "Neotree Git Status" },
         p = { require("telescope.builtin").find_files, "Find Files" },
         s = { require("telescope.builtin").live_grep, "Live Grep" },
      },
       T = {
         name = "[T]erminal",
         t = { ":ToggleTerm", "Toggle Windows Terminal" },
         g = { function() require("terminal").toggle() end, "Toggle Gemini CLI" },
      }
})
