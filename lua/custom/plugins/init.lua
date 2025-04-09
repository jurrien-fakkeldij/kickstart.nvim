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
  {
    'ThePrimeagen/refactoring.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    lazy = false,
    opts = {},
    config = function()
      require('refactoring').setup {
        show_success_message = false,
      }
      vim.keymap.set('x', '<leader>re', ':Refactor extract ', { desc = 'Refactor extract' })
      vim.keymap.set('x', '<leader>rf', ':Refactor extract_to_file ', { desc = 'Refactor extract to file' })
      vim.keymap.set('x', '<leader>rv', ':Refactor extract_var ', { desc = 'Refactor extract variable' })
      vim.keymap.set({ 'n', 'x' }, '<leader>ri', ':Refactor inline_var', { desc = 'Refactor extract inline variable' })
      vim.keymap.set('n', '<leader>rI', ':Refactor inline_func', { desc = 'Refactor inline function' })
      vim.keymap.set('n', '<leader>rb', ':Refactor extract_block', { desc = 'Refactor extract block' })
      vim.keymap.set('n', '<leader>rbf', ':Refactor extract_block_to_file', { desc = 'Refactor extract block to file' })
      -- prompt for a refactor to apply when the remap is triggered
      vim.keymap.set({ 'n', 'x' }, '<leader>rr', function()
        require('refactoring').select_refactor()
      end, { desc = 'Refactor select option' })
      -- Note that not all refactor support both normal and visual mode
    end,
  },
}
