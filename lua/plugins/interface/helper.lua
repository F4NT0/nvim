--[[

MANUAL DE COMANDOS DO MEU NEOVIM CUSTOMIZADO

-> DESCRIÇÃO: Esta é a minha configuração de quando usa o comando :Khelp ele abre uma tela flutuante com os comandos.
-> IMPORTANTE: Necessita existir o arquivo Manual.md nesse projeto para mostrar
-> IMPORTANTE 2: A localização do seu Neovim precisa estar em C:\Users\SeuUser\AppData\Local\nvim

--]]

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

