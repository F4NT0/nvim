--[[ ============================================================================
GLOBAL KEYMAPS
============================================================================
Plugin-specific keymaps live next to their plugin spec — anything that maps
the moment Neovim starts (or is too global to belong to a single plugin)
lives here.

Mnemonics for <leader>-prefixed sequences:
  c   Code      (LSP)
  d   Debug     (DAP) and Dotnet run
  h   Hunk      (gitsigns)
  n   .NET      (easy-dotnet)
  t   Test      (neotest)  and TODO list (td)
  s   Show      (s -> diagnostics, etc.)
============================================================================ ]]

local map = function(mode, lhs, rhs, opts)
  opts = vim.tbl_extend("force", { silent = true }, opts or {})
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- ── Barbar (buffer tabs) ──────────────────────────────────────────────────────
map("n", "<A-,>", "<cmd>BufferPrevious<cr>",     { desc = "Tab: previous"        })
map("n", "<A-.>", "<cmd>BufferNext<cr>",         { desc = "Tab: next"            })
map("n", "<A-<>", "<cmd>BufferMovePrevious<cr>", { desc = "Tab: move left"       })
map("n", "<A->>", "<cmd>BufferMoveNext<cr>",     { desc = "Tab: move right"      })
map("n", "<A-1>", "<cmd>BufferGoto 1<cr>",       { desc = "Tab: go to 1"         })
map("n", "<A-2>", "<cmd>BufferGoto 2<cr>",       { desc = "Tab: go to 2"         })
map("n", "<A-3>", "<cmd>BufferGoto 3<cr>",       { desc = "Tab: go to 3"         })
map("n", "<A-4>", "<cmd>BufferGoto 4<cr>",       { desc = "Tab: go to 4"         })
map("n", "<A-5>", "<cmd>BufferGoto 5<cr>",       { desc = "Tab: go to 5"         })
map("n", "<A-6>", "<cmd>BufferGoto 6<cr>",       { desc = "Tab: go to 6"         })
map("n", "<A-p>", "<cmd>BufferPin<cr>",          { desc = "Tab: pin"             })
map("n", "<A-c>", "<cmd>BufferClose<cr>",        { desc = "Tab: close current"   })

-- ── Todo comments ─────────────────────────────────────────────────────────────
map("n", "<leader>td", "<cmd>TodoTelescope<cr>", { desc = "[T]o[D]o list" })

-- ── Quality of life ───────────────────────────────────────────────────────────
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })
map("n", "<C-h>", "<C-w>h", { desc = "Window: move left"  })
map("n", "<C-j>", "<C-w>j", { desc = "Window: move down"  })
map("n", "<C-k>", "<C-w>k", { desc = "Window: move up"    })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Window: wider" })
map("n", "<C-Left>",  "<cmd>vertical resize -2<cr>", { desc = "Window: narrower" })
map("n", "<C-Up>",    "<cmd>resize +2<cr>",          { desc = "Window: taller" })
map("n", "<C-Down>",  "<cmd>resize -2<cr>",          { desc = "Window: shorter" })

-- Keep selection after indenting in visual mode.
map("v", ">", ">gv", { desc = "Indent and keep selection"   })
map("v", "<", "<gv", { desc = "Dedent and keep selection"   })

-- Move selected lines up/down (visual mode).
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move line up"   })
