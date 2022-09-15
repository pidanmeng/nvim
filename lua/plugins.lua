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
    -- lualine
    use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    use("arkav/lualine-lsp-progress")
    -- telescope
    use({ 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-media-files.nvim"
    } })
    use("LinArcX/telescope-env.nvim")
    -- dashboard-nvim
    use({"glepnir/dashboard-nvim"})
    -- project
    use("ahmedkhalf/project.nvim")
    -- treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  end,
  config = {
    -- 并发数限制
    max_jobs = 16,
    -- 自定义源
    git = {
      -- default_url_format = "https://hub.fastgit.org/%s",
    },
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

