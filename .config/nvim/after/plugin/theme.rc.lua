local status, theme = pcall(require, 'tokyonight')
if (not status) then return end

theme.setup({
  vim.cmd [[colorscheme tokyonight-storm]]
})
