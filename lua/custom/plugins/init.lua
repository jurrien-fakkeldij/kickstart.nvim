-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
--
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'

      -- REQUIRED
      harpoon:setup()
      -- REQUIRED

      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end)
      vim.keymap.set('n', '<C-e>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      vim.keymap.set('n', '<C-h>', function()
        harpoon:list():select(1)
      end)
      vim.keymap.set('n', '<C-t>', function()
        harpoon:list():select(2)
      end)
      vim.keymap.set('n', '<C-n>', function()
        harpoon:list():select(3)
      end)
      vim.keymap.set('n', '<C-s>', function()
        harpoon:list():select(4)
      end)

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set('n', '<C-S-P>', function()
        harpoon:list():prev()
      end)
      vim.keymap.set('n', '<C-S-N>', function()
        harpoon:list():next()
      end)
    end,
  },
  {
    'ibhagwan/fzf-lua',
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('fzf-lua').setup {
        winopts = {
          row = 0.5,
          height = 0.7,
        },
      }

      vim.keymap.set('n', '<leader>ff', '<cmd>FzfLua files<cr>', { desc = 'Fuzzy find files' })
      vim.keymap.set('n', '<leader>fg', '<cmd>FzfLua live_grep<cr>', { desc = 'Fuzzy grep files' })
      vim.keymap.set('n', '<leader>fh', '<cmd>FzfLua helptags<cr>', { desc = 'Fuzzy grep tags in help files' })
      vim.keymap.set('n', '<leader>ft', '<cmd>FzfLua btags<cr>', { desc = 'Fuzzy search buffer tags' })
      vim.keymap.set('n', '<leader>fb', '<cmd>FzfLua buffers<cr>', { desc = 'Fuzzy search opened buffers' })
    end,
  },
  -- Git command inside vim
  {
    'tpope/vim-fugitive',
    event = 'User InGitRepo',
    config = function()
      require 'custom.plugins.config.fugitive'
    end,
  },
}
