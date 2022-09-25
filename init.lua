-- 基础设置
require('basic')
-- 加载插件
require('plugins')
-- 快捷键映射
require('keybinding')
-- 加载主题
require('colorscheme')

-- 加载文件管理器插件
require('plugin-config.nvim-tree')
-- 加载bufferline插件
require('plugin-config.bufferline')
-- 加载底部状态栏插件
require('plugin-config.lualine')
-- 加载模糊搜索插件
require('plugin-config.telescope')
-- 加载dashboard插件
require('plugin-config.dashboard')
-- 加载project插件
require('plugin-config.project')
-- 加载高亮插件
require('plugin-config.nvim-treesitter')
-- 加载光标线插件
require('plugin-config.indent-blankline')

--------LSP--------
require('lsp.setup')
require('lsp.cmp')
require('lsp.ui')
--require("lsp.formatter")
require('lsp.null-ls')
