return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        require("nvim-tree").setup({
            view = {
                adaptive_size = true,
                relativenumber = true
            },
            filters = {
                git_ignored = false, -- show files that are in .gitignore
                dotfiles = false
            },

            git = {
                enable = true,
                ignore = false -- do NOT hide ignored files
            },

            renderer = {
                highlight_git = true, -- show git status highlighting
                icons = {
                    show = {
                        git = true
                    }
                }
            }
        })

    end
}
