local options = {
    backup = false,
    clipboard = "unnamedplus",
    cmdheight = 2,
    completeopt = {"menuone", "noselect"},
    conceallevel = 0,
    fileencoding = "utf-8",
    hlsearch = true,
    incsearch = true,
    ignorecase = true,
    ro = false,
    pumheight = 10,
    showmode = false,
    showtabline = 2,
    smartcase = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    termguicolors = true,
    timeoutlen = 1000,
    undofile = true,
    updatetime = 300,
    writebackup = false,
    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,
    cursorline = false,
    number = true,
    relativenumber = true,
    numberwidth = 4,
    signcolumn = "yes",
    wrap = false,
    scrolloff = 4,
    sidescrolloff = 4,
    guifont = "Hack_Nerd_Font:h11"
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

local ft_group = vim.api.nvim_create_augroup("FileTypeSpecific", {
    clear = true
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {"html", "css", "javascript", "lua", "c"},
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
    end,
    group = ft_group
})

vim.api.nvim_create_autocmd("FileType", {
    group = ft_group,
    pattern = {"rust", "python"},
    callback = function()
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
    end
})

vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        vim.opt.formatoptions:remove({"c", "r", "o"})
        vim.opt_local.formatoptions:remove({"c", "r", "o"})
    end
})
