-- Add additional plugins as well as disable some core plugins

local plugins = {
  add = {
    'ggandor/lightspeed.nvim',
    {
      'romgrk/barbar.nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
    },
    {
      'folke/which-key.nvim',
      config = function()
        require("which-key").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }
  },
  disable = { -- disabling some core plugins may mean you'll have to remap some keybindings
    --[[
    'auto-session',
    'autocomplete',
    'colorizer',
    'dashboard',
    'fugitive',
    'gitsigns',
    'kommentary',
    'nvim-tree',
    'statusline',
    'telescope',
    'terminal',
    'theme',
    'todo-comments',
    'treesitter',
    ]]
  },
}

return plugins
