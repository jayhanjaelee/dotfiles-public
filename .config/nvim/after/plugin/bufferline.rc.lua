local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    mode = "tabs",
    separator_style = 'thin',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true
  },
  highlights = {
    separator = {
      fg = '#282c34', -- Change to One Dark color: fg = '#282c34',
      bg = '#1c1f24', -- Change to One Dark color: bg = '#1c1f24',
    },
    separator_selected = {
      fg = '#282c34', -- Change to One Dark color: fg = '#282c34',
    },
    background = {
      fg = '#abb2bf', -- Change to One Dark color: fg = '#abb2bf',
      bg = '#1c1f24'  -- Change to One Dark color: bg = '#1c1f24'
    },
    buffer_selected = {
      fg = '#e06c75', -- Change to One Dark color: fg = '#e06c75',
      bold = true,
    },
    fill = {
      bg = '#282c34' -- Change to One Dark color: bg = '#282c34'
    }
  },
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
