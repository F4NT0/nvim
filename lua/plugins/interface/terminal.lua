--[[

PLUGIN TERMINAL

-> DESCRIÇÃO: Inicia o terminal configurado no Windows para abrir dentro do Neovim
-> PROJETO DO GITHUB: https://github.com/akinsho/toggleterm.nvim
-> COMANDOS DE TECLADO:
  - Ctrl + T = Abre uma tela flutuante com o terminal
  - Space + C + T = Fecha o terminal atual
  - Space + D = Roda o arquivo atual no terminal (SOMENTE COM .NET 10)
  - Space + X = Se tiver um terminal aberto depois de rodar, fecha o terminal (SOMENTE NO .NET 10)
-> COMANDOS DO NEOVIM:
  - :ToggleTerm = Abre o Terminal
  - :ToggleTerm direction=vertical = Abre o terminal na vertical
  - :ToggleTerm direction=horizontal = Abre o terminal na horizontal
  - :TermExec cmd="" = Envia um comando para o terminal atual

--]]

return {

  "akinsho/toggleterm.nvim",
  version = "*",

  config = function()
    require("toggleterm").setup {
      open_mapping = [[<c-t>]],
      hide_numbers = true,
      direction = 'float',
      float_opts = {
        border = 'rounded',
      },
      shell = 'powershell.exe -NoLogo',
      close_on_exit = false,
      start_in_insert = false,
      on_open = function(_)
        vim.cmd("stopinsert")
      end
    }

    --------------------------------------
    -- COMPILAÇÃO MANUAL DE PROJETOS .NET
    --------------------------------------

    -- Instancia um terminal
    local terminal = require("toggleterm.terminal").Terminal
    local dotnet_term

    -- Cria um terminal persistente com o compilado
    local function get_dotnet_term(opts)
      dotnet_term = terminal:new({
        direction = "float",
        size = 15,
        close_on_exit = false,
        start_in_insert = false,
        auto_scroll = false,
        hidden = true,
        float_opts = { border = "curved" },
        on_open = function(_)
          vim.cmd("stopinsert")
        end
      })
      dotnet_term:open()
      dotnet_term:send(opts)
      return dotnet_term
    end


    local function close_dotnetTerm()
      if dotnet_term and dotnet_term.close then
        dotnet_term:close()
        vim.notify("[Terminal .NET] fechado com sucesso!", vim.log.levels.INFO)
      else
        vim.notify("[Terminal .NET] não está aberto.", vim.log.levels.WARN)
      end
    end
    
    local function close_term()
      local term = require("toggleterm.terminal").get(1)
      if term and term.close then
        term:close()
        vim.notify("[Terminal] fechado com sucesso!", vim.log.levels.INFO)
      else
        vim.notify("[Terminal] não está aberto.", vim.log.levels.WARN)
      end
    end

    -- Enviando o comando dotnet run
    local function run_dotnet(opts)
      local file = vim.api.nvim_buf_get_name(0) -- Arquivo aberto no buffer atual

      -- verifica se tem um arquivo aberto no buffer
      if file == "" then
        vim.notify("Nenhum arquivo aberto", vim.log.levels.ERROR)
        return
      end

      local cmd = "dotnet run " .. vim.fn.shellescape(file)

      -- Argumentos para a aplicação
      if opts and opts.args and opts.args ~= "" then
        cmd = cmd .. " -- " .. opts.args
      end

      -- Inicia um novo terminal e envia o comando
      local term = get_dotnet_term(cmd)
    end

    -- Criação do comando para o Neovim
    vim.api.nvim_create_user_command("DotnetRun", function(opts)
        run_dotnet(opts)
      end,
      {
        nargs = "*",
        desc = "Executa o dotnet run no arquivo atual .cs ou no .csproj detectado.",
      })

    -- Fecha o terminal .NET
    vim.api.nvim_create_user_command("TermDotnetClose", function()
      close_dotnetTerm()
    end, { desc = "Fecha o terminal .NET" })

    -- Fecha o terminal
    vim.api.nvim_create_user_command("TermClose", function()
      close_term()
    end, { desc = "Fecha o terminal padrão" })

    -- Criação do atalho de teclado
    vim.keymap.set("n", "<leader>d", ":DotnetRun<CR>", { desc = "Rodar arquivo com .NET" })
    vim.keymap.set("n", "<leader>x", ":TermDotnetClose<CR>", { desc = "Fecha o terminal do .NET" })
    vim.keymap.set("n", "<leader>ct", ":TermClose<CR>", { desc = "Fecha o terminal padrão" })
  end

}
