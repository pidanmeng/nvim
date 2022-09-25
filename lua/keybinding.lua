-- leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- 复用参数
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }
-- 键盘映射
-- ikjl替换hjkl作为上下左右
map('n', 'k', 'j', opt)
map('n', 'j', 'h', opt)
map('n', 'i', '<Up>', opt)
map('v', 'k', 'j', opt)
map('v', 'j', 'h', opt)
map('v', 'i', 'k', opt)
-- h替换i进入insert模式
map('n', 'h', 'i', opt)
map('n', 'H', 'I', opt)
-- 取消 s 默认功能
map('n', 's', '', opt)
-- 括号自动补全
map('i', '(', '()<Esc>i', opt)
map('i', '[', '[]<Esc>i', opt)
map('i', '{', '{}<Esc>i', opt)
map('i', '<', '<><Esc>i', opt)
map('i', '"', '""<Esc>i', opt)
map('i', "'", "''<Esc>i", opt)
-- windows 分屏快捷键
map('n', 'sv', ':vsp<CR>', opt)
map('n', 'sh', ':sp<CR>', opt)
-- 关闭当前
map('n', 'sc', '<C-w>c', opt)
-- 关闭其他
map('n', 'so', '<C-w>o', opt)
-- Alt + hjkl  窗口之间跳转
map('n', '<A-j>', '<C-w>h', opt)
map('n', '<A-k>', '<C-w>j', opt)
map('n', '<A-i>', '<C-w>k', opt)
map('n', '<A-l>', '<C-w>l', opt)
-- 左右比例控制
map('n', '<C-Left>', ':vertical resize -2<CR>', opt)
map('n', '<C-Right>', ':vertical resize +2<CR>', opt)
map('n', 'sj', ':vertical resize -20<CR>', opt)
map('n', 'sl', ':vertical resize +20<CR>', opt)
-- 上下比例
map('n', 'sk', ':resize +10<CR>', opt)
map('n', 'si', ':resize -10<CR>', opt)
map('n', '<C-Down>', ':resize +2<CR>', opt)
map('n', '<C-Up>', ':resize -2<CR>', opt)
-- 等比例
map('n', 's=', '<C-w>=', opt)
-- Terminal相关
map('n', '<leader>t', ':sp | terminal<CR>', opt)
map('n', '<leader>vt', ':vsp | terminal<CR>', opt)
map('t', '<Esc>', '<C-\\><C-n>', opt)
map('t', '<A-j>', [[ <C-\><C-N><C-w>h ]], opt)
map('t', '<A-k>', [[ <C-\><C-N><C-w>j ]], opt)
map('t', '<A-i>', [[ <C-\><C-N><C-w>k ]], opt)
map('t', '<A-l>', [[ <C-\><C-N><C-w>l ]], opt)
-- visual模式下缩进代码
map('v', '<', '<gv', opt)
map('v', '>', '>gv', opt)
-- 上下移动选中文本
map('v', '<A-k>', ":move '>+1<CR>gv-gv", opt)
map('v', '<A-i>', ":move '<-2<CR>gv-gv", opt)
-- 上下滚动浏览
map('n', 'K', '4j', opt)
map('n', 'I', '4k', opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map('n', '<C-u>', '9k', opt)
map('n', '<C-d>', '9j', opt)
-- 退出
map('n', 'q', ':q<CR>', opt)
map('n', 'qq', ':q!<CR>', opt)
map('n', 'Q', ':qa!<CR>', opt)
-- 跳到行首行尾
map('i', '<C-j>', '<ESC>I', opt)
map('i', '<C-l>', '<ESC>A', opt)

-- 插件快捷键

-- bufferline
-- 左右Tab切换
map('n', '<C-j>', ':BufferLineCyclePrev<CR>', opt)
map('n', '<C-l>', ':BufferLineCycleNext<CR>', opt)
-- 关闭
--"moll/vim-bbye"
map('n', '<C-w>', ':Bdelete!<CR>', opt)
map('n', '<leader>bl', ':BufferLineCloseRight<CR>', opt)
map('n', '<leader>bj', ':BufferLineCloseLeft<CR>', opt)
map('n', '<leader>bc', ':BufferLinePickClose<CR>', opt)

-- telescope
-- 查找文件
map('n', '<C-p>', ':Telescope find_files<CR>', opt)
-- 全局搜索
map('n', '<C-f>', ':Telescope live_grep<CR>', opt)

-- 折叠展开代码块
map('n', 'zz', ':foldclose<CR>', opt)
map('n', 'Z', ':foldopen<CR>', opt)

local pluginKeys = {}

-- nvim-tree
-- alt + m 键打开关闭tree
map('n', '<A-m>', ':NvimTreeToggle<CR>', opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
  -- 打开文件或文件夹
  { key = { '<CR>', 'o', '<2-LeftMouse>', '<leader>' }, action = 'edit' },
  -- 分屏打开文件
  { key = 'v', action = 'vsplit' },
  { key = 'h', action = 'split' },
  -- 显示隐藏文件
  { key = '/', action = 'toggle_custom' }, -- 对应 filters 中的 custom (node_modules)
  { key = '.', action = 'toggle_dotfiles' }, -- Hide (dotfiles)
  -- 文件操作
  { key = '<F5>', action = 'refresh' },
  { key = 'a', action = 'create' },
  { key = 'd', action = 'remove' },
  { key = 'r', action = 'rename' },
  { key = 'x', action = 'cut' },
  { key = 'y', action = 'copy' },
  { key = 'p', action = 'paste' },
  { key = 's', action = 'system_open' },
}

-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
  n = {
    ['k'] = 'move_selection_next',
    ['i'] = 'move_selection_previous',
  },
  i = {
    -- 上下移动
    ['<A-k>'] = 'move_selection_next',
    ['<A-i>'] = 'move_selection_previous',
    ['<Down>'] = 'move_selection_next',
    ['<Up>'] = 'move_selection_previous',
    -- 历史记录
    ['<C-n>'] = 'cycle_history_next',
    ['<C-p>'] = 'cycle_history_prev',
    -- 关闭窗口
    ['<C-c>'] = 'close',
    -- 预览窗口上下滚动
    ['<C-u>'] = 'preview_scrolling_up',
    ['<C-d>'] = 'preview_scrolling_down',
  },
}

-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
  mapbuf('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opt)
  mapbuf('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opt)
  mapbuf('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
  mapbuf('n', 'gh', '<cmd>Lspsaga hover_doc<cr>', opt)
  mapbuf('n', 'gr', '<cmd>Lspsaga lsp_finder<CR>', opt)
  -- diagnostic
  mapbuf('n', 'gp', '<cmd>Lspsaga show_line_diagnostics<CR>', opt)
  mapbuf('n', 'gk', '<cmd>Lspsaga diagnostic_jump_next<cr>', opt)
  mapbuf('n', 'gi', '<cmd>Lspsaga diagnostic_jump_prev<cr>', opt)
  mapbuf('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opt)
end

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
  local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
  end

  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
  end
  return {
    -- 出现补全
    ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    -- 取消
    ['<A-,>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- 上一个
    ['<A-i>'] = cmp.mapping.select_prev_item(),
    -- 下一个
    ['<A-k>'] = cmp.mapping.select_next_item(),
    -- 确认
    ['<CR>'] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace,
    }),
    -- 如果窗口内容太多，可以滚动
    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    -- 自定义代码段跳转到下一个参数
    ['<C-l>'] = cmp.mapping(function(_)
      if vim.fn['vsnip#available'](1) == 1 then
        feedkey('<Plug>(vsnip-expand-or-jump)', '')
      end
    end, { 'i', 's' }),

    -- 自定义代码段跳转到上一个参数
    ['<C-j>'] = cmp.mapping(function()
      if vim.fn['vsnip#jumpable'](-1) == 1 then
        feedkey('<Plug>(vsnip-jump-prev)', '')
      end
    end, { 'i', 's' }),
    -- Super Tab
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn['vsnip#available'](1) == 1 then
        feedkey('<Plug>(vsnip-expand-or-jump)', '')
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn['vsnip#jumpable'](-1) == 1 then
        feedkey('<Plug>(vsnip-jump-prev)', '')
      end
    end, { 'i', 's' }),
  }
end

-- typescript 快捷键
pluginKeys.mapTsLSP = function(mapbuf)
  mapbuf('n', 'gs', ':TSLspOrganize<CR>', opt)
  mapbuf('n', 'gr', ':TSLspRenameFile<CR>', opt)
  mapbuf('n', 'gi', ':TSLspImportAll<CR>', opt)
end

return pluginKeys
