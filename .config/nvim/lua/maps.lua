vim.g.mapleader = " "

local keymap = vim.keymap

-- new line without insert mode.
keymap.set('n', '<Leader>o', 'o<Esc>0"_D')
keymap.set('n', '<Leader>O', 'O<Esc>0"_D')

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })
keymap.set('n', 'tw', ':bd<Return>', { silent = true })
keymap.set('n', 'taw', ':Bdelete other<Return>', { silent = true })
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })
-- Move window
keymap.set('n', 'so', '<C-w>w')
keymap.set('n', 'sm', '<C-w>m')
keymap.set('n', 'sc', '<C-w>c')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- Clear highlighting on escape in normal mode
keymap.set('n', '<Leader>/', ':noh<cr>', { silent = true })
