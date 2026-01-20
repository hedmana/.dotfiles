return { -- LSP Configuration
{
    "neovim/nvim-lspconfig",
    dependencies = {"williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim",
                    "whoissethdaniel/mason-tool-installer.nvim", "hrsh7th/cmp-nvim-lsp"},
    config = function()
        require("mason").setup()

        require("mason-tool-installer").setup({
            ensure_installed = {"prettier", "stylua", "isort", "black", "latexindent"}
        })

        require("mason-lspconfig").setup({
            ensure_installed = {"pyright", "ts_ls", "clangd", "texlab"},
            handlers = {function(server_name)
                local capabilities = require("cmp_nvim_lsp").default_capabilities()
                require("lspconfig")[server_name].setup({
                    capabilities = capabilities
                })
            end}
        })

        vim.diagnostic.config({
            virtual_text = true,
            float = {
                source = "always"
            }
        })
    end
}, -- Autocompletion
{
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {"hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "L3MON4D3/LuaSnip",
                    "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets", "windwp/nvim-autopairs"},
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered()
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({
                    select = true
                })
            }),
            sources = cmp.config.sources({{
                name = "nvim_lsp"
            }, {
                name = "luasnip"
            }, {
                name = "buffer"
            }, {
                name = "path"
            }})
        })
    end
}}
