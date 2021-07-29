require('plugins')

---- Basic Settings ----

-- Set hidden
vim.o.hidden = true

-- Show line numbers
vim.wo.number = true

-- Enable mouse
vim.o.mouse = 'a'

-- Set highlight on search
vim.o.hlsearch = false

-- Save undo history
vim.cmd [[set undofile]]

-- Decrease update time
vim.o.updatetime = 750

-- Fix ESC Delay
vim.cmd([[
  if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
      autocmd!
      au InsertEnter * set timeoutlen=0
      au InsertLeave * set timeoutlen=1000
    augroup END
  endif
]])


-- Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Kitty Navigation Settings
vim.g.kitty_navigator_no_mappings = true
vim.api.nvim_set_keymap('n', '<A-h>', ":KittyNavigateLeft<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-j>', ":KittyNavigateDown<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', ":KittyNavigateUp<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-l>', ":KittyNavigateRight<cr>", { noremap = true, silent = true })

-- Leave space on the leftmost column for warnings
vim.wo.signcolumn = 'yes'

-- Enable true color
vim.o.termguicolors = true

-- Set colorscheme (must come after set termguicolors)
vim.cmd [[colorscheme dracula]]

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

-- Buffer Navigation
vim.api.nvim_set_keymap('n', '<C-n>', ':bnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-p>', ':bprev<CR>', { noremap = true })

-- Enter terminal mode
vim.api.nvim_set_keymap('n', '<leader>t', ':terminal<CR>', { noremap = true })

-- Escape Terminal Mode
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-N>', { noremap = true })

-- Remap for dealing with word wrap, for the cursor to land at correct line
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })


-- Python shortcuts
vim.cmd([[autocmd FileType python map <buffer> <F5> <esc>:w<CR>:te '!python3' shellescape(@%, 1)<CR>]])
vim.cmd([[autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:te '!python3' shellescape(@%, 1)<CR>]])

-- C shortcuts
vim.cmd([[autocmd FileType c map <buffer> <F5> <esc>:w<CR>:!gcc -Wall -ansi -pedantic-errors % -o %<<CR>]])
vim.cmd([[autocmd FileType c imap <buffer> <F5> <esc>:w<CR>:!gcc -Wall -ansi -pedantic-errors % -o %<<CR>]])



-- Map blankline
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_char_highlight = 'LineNr'
vim.g.indent_blankline_show_trailing_blankline_indent = false

-- Telescope
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sf', [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>st', [[<cmd>lua require('telescope.builtin').tags()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>so', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })


---- Advanced ----
require('lsp')
require('treesitter')
require('completion')
