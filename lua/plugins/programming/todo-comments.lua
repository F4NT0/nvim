--[[

PLUGIN TODO COMMENTS

DESCRIÇÃO: Organização de tarefas para fazer
PROJETO NO GITHUB: https://github.com/folke/todo-comments.nvim
OBSERVAÇÃO: Deve colocar o nome e depois : para colocar a mensagem
  - FIX: Essa mensagem significa que precisa arrumar um problema
  - TODO: Essa mensagem significa que precisa fazer uma melhoria
  - WARN: Essa mensagem significa que precisa ter atenção em detalhes
  - PERF: Essa mensagem é de performance
  - NOTE: Essa mensagem é para anotação

COMANDOS:
  - :TodoTelescope = Abre uma lista de todos e outros tipos no código  
ATENÇÃO:
  - Deve ser instalado o ripgrep para funcionar:
  - Set-ExecutionPolicy RemoteSigned -Scope CurrentUser Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
  - scoop install ripgrep
--]]

-- TODO: Testing issues
return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    signs = true,
    keywords = {
      FIX =  { icon = "X", color = "error" },
      TODO = { icon = "", color = "info" },
      HACK = { icon = "", color = "warning" },
      WARN = { icon = "", color = "warning" },
      PERF = { icon = "", color = "default" },
      NOTE = { icon = "", color = "hint" },
    }
  }
}

