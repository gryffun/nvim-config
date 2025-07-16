 

require("lazy").setup({
    {
        "gruvw/strudel.nvim",
        cmd = "StrudelLaunch",
        build = "npm install",
        config = function()
            require("strudel").setup({
                update_on_save = true,
            })
        end,
    },
})


