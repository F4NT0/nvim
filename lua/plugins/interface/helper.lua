--[[ ============================================================================
PLUGIN: MunifTanjim/nui.nvim  (host for the `:Khelp` command)
============================================================================
NUI is a component library used by Neo-tree, Noice and others. We also use
it directly to render an in-editor keymap reference: `:Khelp` opens the
`KEYMAPS.md` file inside a floating popup so users can browse every shortcut
without leaving Neovim.

Repo: https://github.com/MunifTanjim/nui.nvim
Docs: Documentations/interface/helper.md
============================================================================ ]]

return {
  "MunifTanjim/nui.nvim",
  cmd = "Khelp",
  config = function()
    local Popup = require("nui.popup")
    local event = require("nui.utils.autocmd").event

    vim.api.nvim_create_user_command("Khelp", function()
      local popup = Popup({
        enter      = true,
        focusable  = true,
        border     = {
          style = "rounded",
          text  = { top = " Keymaps · Manual ", top_align = "center" },
        },
        position   = "50%",
        size       = { width = "80%", height = "85%" },
        buf_options = { modifiable = true, readonly = false, filetype = "markdown" },
      })

      popup:mount()

      local config_root = vim.fn.stdpath("config")
      local manual_path = config_root .. "/KEYMAPS.md"
      if vim.fn.filereadable(manual_path) == 0 then
        manual_path = config_root .. "/Manual.md" -- backwards compatibility
      end

      vim.cmd("edit " .. vim.fn.fnameescape(manual_path))
      vim.api.nvim_win_set_buf(popup.winid, vim.api.nvim_get_current_buf())

      popup:on(event.BufLeave, function() popup:unmount() end)
    end, { desc = "Open the keymap manual" })
  end,
}
