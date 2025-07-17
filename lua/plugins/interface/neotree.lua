-------------------------------------------
--  _   _            _
-- | \ | | ___  ___ | |_ _ __ ___  ___
-- |  \| |/ _ \/ _ \| __| '__/ _ \/ _ \
-- | |\  |  __/ (_) | |_| | |  __/  __/
-- |_| \_|\___|\___/ \__|_|  \___|\___|
---------------------------------------------
---
-- GITHUB: https://github.com/nvim-neo-tree/neo-tree.nvim
-- DESCRIPTION: Show all files and directories inside the current directory
--
-- COMMANDS:
--
-- :Neotree toggle              - Open or close the file tree
-- :Neotree reveal               - Open the tree to the currently active file
-- :Neotree float                - Open Neo-tree in a floating window
-- :Neotree show buffers right   - Show the list of open buffers on the right side
-- :Neotree float git_status     - Open a floating window with the git status
--
-- KEY MAPPINGS (in the Neo-tree window):
--
-- <cr> or Enter: Open the selected file in the current buffer
-- s: Open the selected file in a vertical split
-- S: Open the selected file in a horizontal split
-- <bs> or Backspace: Go up to the parent directory
-- P: Toggle the preview of the selected file
-- a: Create a new file or directory
-- d: Delete the selected file or directory
-- r: Rename the selected file or directory
-- y: Copy the selected file(s)
-- x: Cut the selected file(s)
-- c: Copy the selected file or directory
-- m: Move the selected file or directory
-- ?: Show a help popup with a list of all available key mappings
-- Y: Copy the path of the selected node to the clipboard
-- O: Open the selected file with the default system application

return {

  ------------------
  -- INSTALLATION --
  ------------------

  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim"
  },

  -------------------
  -- CONFIGURATION --
  -------------------

  config = function()
    -----------------
    -- COLORSCHEME --
    -----------------
    vim.cmd [[
      highlight NeoTreeDirectoryName guifg=#F5F8F6
      highlight NeoTreeDirectoryIcon guifg=#F9F8F8
      highlight NeoTreeFileName guifg=#FEFEFF
      highlight NeoTreeFileNameOpened guifg=#F19706 gui=bold
      highlight NeoTreeNormal guibg=#0d1117
      highlight NeotreeNormalNC guibg=#0D1117
      highlight NeoTreeEndOfBuffer guibg=#0d1117
      highlight NeoTreeFloatBorder guifg=#888A88
      highlight NeoTreeTabActive guibg=#0d1117 guifg=#F5F8F6
      highlight NeoTreeGitUntracked guifg=#25ED17 gui=bold
      highlight NeoTreeGitStaged guifg=#09BFFD
      highlight NeoTreeTitleBar guibg=#0d1117 guifg=#F5F8F6
      highlight NeoTreeRootName guifg=#F2A033

    ]]

    require("neo-tree").setup({
      default_component_configs = {
        git_status = {
          symbols = {
            added     = "",
            modified  = "",
            deleted   = "󰧧",
            renamed   = "󰑕",
            untracked = "★",
            ignored   = "◌",
            unstaged  = "✗",
            staged    = "✓",
            conflict  = "",
          }
        }
      },
      window = {
        position = "left",
        popup = {
          size = {
            height = "90%",
            width = "70%",
          },
          position = "50%",
          border = {
            style = "rounded",
            text = {
              top = "",
            },
            highlight ="NeoTreeFloatBorder",
          },
        },
      },
    })
  end
}
