vim.opt.number = true
vim.opt.numberwidth = 3
vim.opt.clipboard = 'unnamed'
vim.opt.syntax = 'enable'
vim.opt.ruler = true
vim.opt.encoding = 'utf-8'
vim.opt.showmatch = true
vim.opt.sw = 2
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.termguicolors = true

-- Plug Package Manager
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- ---------- Thmes ----------
Plug 'morhetz/gruvbox'
Plug 'ntk148v/vim-horizon'
-- ---------- Telescope ----------
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.1' })
-- ---------- Lualine ----------
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
-- ---------- Treesitter ----------
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'})
-- ---------- Coc ----------
Plug('neoclide/coc.nvim', { branch = 'release'})
-- ---------- Comment ----------
Plug 'terrortylor/nvim-comment'
-- ---------- Nerdtree ----------
Plug 'preservim/nerdtree'
-- ---------- Snake ----------
Plug 'justinmk/vim-sneak'
-- ---------- Gitgutter ----------
Plug 'airblade/vim-gitgutter'
-- ---------- TMUX-Navigator ----------
Plug 'christoomey/vim-tmux-navigator'
-- ---------- DevIcons ----------
Plug 'ryanoasis/vim-devicons'

vim.call('plug#end')

-- Theme
vim.cmd 'colorscheme horizon'

-- KeyMap
vim.g.mapleader = ' ' -- Tecla Leader
vim.keymap.set('n', '<Leader>w', ':write<CR>')
vim.keymap.set('n', '<Leader>q', ':quit<CR>')
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-P>', builtin.find_files, {})
vim.keymap.set('n', '<C-T>', builtin.live_grep, {})
vim.keymap.set('n', '<Leader>t', ':NERDTreeToggle<CR>')
vim.cmd [['
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>gi <Plug>(coc-implementation)
']]

-- Snake
vim.g['sneak#label'] = 1

-- Comment
require('nvim_comment').setup {
  -- Linters prefer comment and line to have a space in between markers
  marker_padding = true,
  -- should comment out empty or whitespace only lines
  comment_empty = true,
  -- trim empty comment whitespace
  comment_empty_trim_whitespace = true,
  -- Should key mappings be created
  create_mappings = true,
  -- Normal mode mapping left hand side
  line_mapping = "gcc",
  -- Visual/Operator mapping left hand side
  operator_mapping = "gc",
  -- text object mapping, comment chunk,,
  comment_chunk_text_object = "ic",
  -- Hook function to call before commenting takes place
  hook = nil
}

-- Lualine
require('config-plugins.lualine')

-- Treesitter
require('nvim-treesitter').setup {
   ensure_installed = {
      "lua",
      "javascript",
      "typescript",
      "html",
      "css",
      "python",
      "go"
   },
   highlight = {
      enable = true,
      use_languagetree = true,
   },
}

-- Telescope
require('config-plugins.telescope')

-- Coc
require('config-plugins.coc')
