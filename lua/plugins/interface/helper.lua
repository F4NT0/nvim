--[[

  __  __                         _ 
 |  \/  |                       | |
 | \  / | __ _ _ __  _   _  __ _| |
 | |\/| |/ _` | '_ \| | | |/ _` | |
 | |  | | (_| | | | | |_| | (_| | |
 |_|  |_|\__,_|_| |_|\__,_|\__,_|_|
                                   
                                   
]]

--- DESCRIPTION: Float windows with the markdown manual from my Neovim

return {
  {
    "MunifTanjim/nui.nvim",
    config = function()
      local NuiPopup = require("nui.popup")
      local event = require("nui.utils.autocmd").event

      vim.api.nvim_create_user_command("Khelp", function()
        local popup = NuiPopup({
          enter = true,
          focusable = true,
          border = {
            style = "rounded",
            text = {
              top = "Infos and Keymaps",
              top_align = "center",
            },
          },
          position = "50%",
          size = {
            width = "80%",
            height = "80%",
          },
          buf_options = {
            modifiable = true,
            readonly = false,
          },
        })

        popup:mount()

        -- Path to the Manual in the nvim project
        local userprofile = os.getenv("USERPROFILE")
        local readme_path = userprofile .. "\\AppData\\Local\\nvim\\Manual.md"

        -- Open Manual on Buffer
        vim.cmd("edit " .. readme_path)
        vim.api.nvim_win_set_buf(popup.winid, vim.api.nvim_get_current_buf())

        -- Close Buffer on exit
        popup:on(event.BufLeave, function()
          popup:unmount()
        end)
      end, {})
    end
  }
}

