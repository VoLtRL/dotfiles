vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
require 'mything.options'

-- [[ Basic Keymaps ]]
require 'mything.keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
require 'mything.lazy-bootstrap'

-- [[ Configure and install plugins ]]
require 'mything.lazy-plugins'
