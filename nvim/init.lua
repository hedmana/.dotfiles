-- Init lazy.nvi
require("config.lazy")

-- Enable/disable Ruby-based plugins
vim.g.loaded_ruby_provider = 0

-- Enable/disable Perl-based plugins
vim.g.loaded_perl_provider = 0

-- Line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- Tab settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
