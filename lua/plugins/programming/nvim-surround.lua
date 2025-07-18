--[[
  _   _       _              _____                                      _ 
 | \ | |     (_)            / ____|                                    | |
 |  \| |_   ___ _ __ ___   | (___  _   _ _ __ _ __ ___  _   _ _ __   __| |
 | . ` \ \ / / | '_ ` _ \   \___ \| | | | '__| '__/ _ \| | | | '_ \ / _` |
 | |\  |\ V /| | | | | | |  ____) | |_| | |  | | | (_) | |_| | | | | (_| |
 |_| \_| \_/ |_|_| |_| |_| |_____/ \__,_|_|  |_|  \___/ \__,_|_| |_|\__,_|
                                                                          
]]

--- GITHUB: https://github.com/kylechui/nvim-surround
--- DESCRIPTION: This plugins help to add "" or () into the code faster
--- COMMANDS:
---     Old text                    Command         New text
--------------------------------------------------------------------------------
---    surround_words             ysiw)           (surround_words)
---    *make strings               ys$"            "make strings"
---    [delete ar*ound me!]        ds]             delete around me!
---    remove <b>HTML t*ags</b>    dst             remove HTML tags
---    'change quot*es'            cs'"            "change quotes"
---    <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
---    delete(functi*on calls)     dsf             function calls

return {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
}
