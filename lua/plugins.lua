local packer = require("packer")
packer.startup({
  function(use)
    use('wbthomason/packer.nvim')
    -- 主题
    use('ful1e5/onedark.nvim')
    -- 文件浏览器
    use({'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'})
    -- bufferline
    use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
  end,
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float({border = "single" })
      end,
    },
  },
})

-- 保存plugins.lua后自动安装插件
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)

