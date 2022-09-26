local packer = require('packer')
packer.startup({
  function(use)
    use('wbthomason/packer.nvim')
    -- 主题
    use('ful1e5/onedark.nvim')
    use('folke/tokyonight.nvim')
    -- 文件浏览器
    use({ 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' })
    -- bufferline
    use({ 'akinsho/bufferline.nvim', requires = { 'kyazdani42/nvim-web-devicons', 'moll/vim-bbye' } })
    -- lualine
    use({ 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons' } })
    use('arkav/lualine-lsp-progress')
    -- telescope
    use({
      'nvim-telescope/telescope.nvim',
      tag = '0.1.0',
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-media-files.nvim',
      },
    })
    use('LinArcX/telescope-env.nvim')
    -- dashboard-nvim
    use({ 'glepnir/dashboard-nvim' })
    -- project
    use('ahmedkhalf/project.nvim')
    -- treesitter
    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
    -- indent-blankline
    use('lukas-reineke/indent-blankline.nvim')
    -- windows
    use({
      'anuvyklack/windows.nvim',
      requires = { 'anuvyklack/middleclass', 'anuvyklack/animation.nvim' },
      config = function()
        vim.o.winwidth = 10
        vim.o.winminwidth = 10
        vim.o.equalalways = false
        require('windows').setup()
      end,
    })
    -- git
    use({ 'lewis6991/gitsigns.nvim' })

    --------------------- LSP --------------------
    use('williamboman/nvim-lsp-installer')
    -- Lspconfig
    use({ 'neovim/nvim-lspconfig' })
    use('kabouzeid/nvim-lspinstall')
    -- 补全引擎
    use('hrsh7th/nvim-cmp')
    -- snippet 引擎
    use('hrsh7th/vim-vsnip')
    -- 补全源
    use('hrsh7th/cmp-vsnip')
    use('hrsh7th/cmp-nvim-lsp') -- { name = nvim_lsp }
    use('hrsh7th/cmp-buffer') -- { name = 'buffer' },
    use('hrsh7th/cmp-path') -- { name = 'path' }
    use('hrsh7th/cmp-cmdline') -- { name = 'cmdline' }

    -- 常见编程语言代码段
    use('rafamadriz/friendly-snippets')
    -- ui
    use('onsails/lspkind-nvim')
    use('tami5/lspsaga.nvim')
    -- 代码格式化
    use('mhartington/formatter.nvim')
    use({ 'jose-elias-alvarez/null-ls.nvim', requires = 'nvim-lua/plenary.nvim' })
    use('b0o/schemastore.nvim')
    use({ 'jose-elias-alvarez/nvim-lsp-ts-utils', requires = 'nvim-lua/plenary.nvim' })
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
        return require('packer.util').float({ border = 'single' })
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
