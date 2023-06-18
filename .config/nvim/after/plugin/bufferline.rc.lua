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
      fg = '#b294bb',
      bg = '#1d1f21',
    },
    separator_selected = {
      fg = '#b294bb',
    },
    background = {
      fg = '#b294bb',
      bg = '#1d1f21',
    },
    buffer_selected = {
      fg = '#373b41',
      bold = true,
    },
    fill = {
      bg = '#1d1f21'
    }
  },
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
