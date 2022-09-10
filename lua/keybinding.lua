-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- 复用参数
local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}
-- 键盘映射
-- ikjl替换hjkl作为上下左右
map("n", "k", "j", opt)
map("n", "j", "h", opt)
map("n", "i", "k", opt)
map("v", "k", "j", opt)
map("v", "j", "h", opt)
map("v", "i", "k", opt)
-- h替换i进入insert模式
map("n", "h", "i", opt)
map("n", "H", "I", opt)
-- 取消 s 默认功能
map("n", "s", "", opt)
-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)
-- Alt + hjkl  窗口之间跳转
map("n", "<A-j>", "<C-w>h", opt)
map("n", "<A-k>", "<C-w>j", opt)
map("n", "<A-i>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)
-- 左右比例控制
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "sj", ":vertical resize -20<CR>", opt)
map("n", "sl", ":vertical resize +20<CR>", opt)
-- 上下比例
map("n", "sk", ":resize +10<CR>", opt)
map("n", "si", ":resize -10<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
-- 等比例
map("n", "s=", "<C-w>=", opt)
-- Terminal相关
map("n", "<leader>t", ":sp | terminal<CR>", opt)
map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-i>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)
-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "<A-k>", ":move '>+1<CR>gv-gv", opt)
map("v", "<A-i>", ":move '<-2<CR>gv-gv", opt)
-- 上下滚动浏览
map("n", "<C-k>", "4j", opt)
map("n", "<C-i>", "4k", opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)
-- 退出
map("n", "q", ":q<CR>", opt)
map("n", "qq", ":q!<CR>", opt)
map("n", "Q", ":qa!<CR>", opt)
-- 跳到行首行尾
map("n", "<C-j>", "0", opt)
map("n", "<C-l>", "$", opt)
map("i", "<C-j>", "<ESC>I", opt)
map("i", "<C-l>", "<ESC>A", opt)
-- insert 模式下，向上向下新增一行
map("i", "<C-i>", "<ESC>O", opt)
map("i", "<C-k>", "<ESC>o", opt)

-- 插件快捷键
local pluginKeys = {}

-- nvim-tree
-- alt + m 键打开关闭tree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
  -- 打开文件或文件夹
  { key = {"<CR>", "o", "<2-LeftMouse>", "<leader>"}, action = "edit" },
  -- 分屏打开文件
  { key = "v", action = "vsplit" },
  { key = "h", action = "split" },
  -- 显示隐藏文件
  { key = "/", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
  { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
  -- 文件操作
  { key = "<F5>", action = "refresh" },
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "y", action = "copy" },
  { key = "p", action = "paste" },
  { key = "s", action = "system_open" },
}
return pluginKeys
