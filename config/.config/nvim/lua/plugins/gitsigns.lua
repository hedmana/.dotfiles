return {
    "lewis6991/gitsigns.nvim",
    event = {"BufReadPre", "BufNewFile"},
    config = function()
        require("gitsigns").setup {
            signs = {
                add = {
                    text = "│",
                    hl = "GitSignsAdd"
                },
                change = {
                    text = "│",
                    hl = "GitSignsChange"
                },
                delete = {
                    text = "_",
                    hl = "GitSignsDelete"
                },
                topdelete = {
                    text = "‾",
                    hl = "GitSignsDelete"
                },
                changedelete = {
                    text = "~",
                    hl = "GitSignsChange"
                },
                untracked = {
                    text = "┆",
                    hl = "GitSignsUntracked"
                }
            },
            signcolumn = true,
            numhl = false,
            linehl = false,
            word_diff = false,
            watch_gitdir = {
                enable = true,
                interval = 1000
            },
            attach_to_untracked = true,
            current_line_blame = false,
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol",
                delay = 1000,
                ignore_whitespace = false
            },
            current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
            sign_priority = 6,
            update_debounce = 100,
            status_formatter = nil,
            max_file_length = 40000,
            preview_config = {
                border = "rounded",
                style = "minimal",
                relative = "cursor",
                row = 0,
                col = 1
            },
            on_attach = function(bufnr)
                local gitsigns = require("gitsigns")

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map("n", "]c", function()
                    if vim.wo.diff then
                        vim.cmd.normal({"]c", bang = true})
                    else
                        gitsigns.nav_hunk("next")
                    end
                end, {desc = "Go to next hunk"})

                map("n", "[c", function()
                    if vim.wo.diff then
                        vim.cmd.normal({"[c", bang = true})
                    else
                        gitsigns.nav_hunk("prev")
                    end
                end, {desc = "Go to previous hunk"})

                -- Text object
                map({"o", "x"}, "ih", ":<C-U>Gitsigns select_hunk<CR>", {desc = "Select hunk"})
            end
        }
    end
}
