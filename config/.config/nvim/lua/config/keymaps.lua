local keymap = vim.keymap

-- Directory navigation
keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Disable Space bar in Normal and Visual modes
keymap.set({"n", "v"}, "<Space>", "<Nop>", {
    silent = true
})

-- Clear search highlights with <Esc>
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h", {
    desc = "Go to left window"
})
keymap.set("n", "<C-j>", "<C-w>j", {
    desc = "Go to lower window"
})
keymap.set("n", "<C-k>", "<C-w>k", {
    desc = "Go to upper window"
})
keymap.set("n", "<C-l>", "<C-w>l", {
    desc = "Go to right window"
})

-- x key should not yank to clipboard
keymap.set("n", "x", '"_x')

-- Paste over selection without losing clipboard
keymap.set("x", "<leader>p", '"_dP', {
    desc = "Paste without replacing clipboard"
})

-- Delete without yanking
keymap.set({"n", "v"}, "<leader>d", '"_d', {
    desc = "Delete to void register"
})

-- Diagnostic Keymaps
keymap.set('n', '<leader>q', vim.diagnostic.open_float, {
    desc = "Show line diagnostics"
})
keymap.set('n', '[d', vim.diagnostic.goto_prev, {
    desc = "Go to previous diagnostic"
})
keymap.set('n', ']d', vim.diagnostic.goto_next, {
    desc = "Go to next diagnostic"
})

-- Nvim-tree Keymaps
keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", {
    desc = "Toggle file explorer"
})
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFile<CR>", {
    desc = "Toggle file explorer on current file"
})
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", {
    desc = "Collapse file explorer"
})
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", {
    desc = "Refresh file explorer"
})

-- Telescope Keymaps
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {
    desc = "Find files"
})
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", {
    desc = "Live grep"
})
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", {
    desc = "Find buffers"
})
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", {
    desc = "Find help tags"
})
keymap.set("n", "<leader>gf", "<cmd>Telescope git_files<cr>", {
    desc = "Find git files"
})

-- LSP Keymaps
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = {
            buffer = ev.buf
        }

        keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

        -- NOTE: This shadows the <C-k> window navigation keymap in LSP buffers
        keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
        keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
        keymap.set('n', '<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, opts)
        keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    end
})

