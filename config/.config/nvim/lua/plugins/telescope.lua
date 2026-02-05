return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
	local telescope = require("telescope")

	telescope.setup({
		defaults = {
			path_display = { "smart" },
			file_ignore_patterns = { "node_modules", ".git" },
		},
		pickers = {
			find_files = {
				hidden = true,
			},
			live_grep = {
				additional_args = function()
					return { "--hidden" }
				end,
			},
		},
	})
    end
}
