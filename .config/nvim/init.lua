-- import lazy
require("config.lazy")

-- base neovim settings
require("config.autocmd")
require("config.mappings")
require("config.options")

-- import lsp configs
require('config.lsp.basedpyright')
require('config.lsp.bashls')
require('config.lsp.cssls')
require('config.lsp.cssvariables')
require('config.lsp.emmet_language_server')
require('config.lsp.gopls')
require('config.lsp.intelephense')
require('config.lsp.luals')
require('config.lsp.superhtml')
require('config.lsp.tsls')
