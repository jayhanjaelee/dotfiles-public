local status, lsp_saga = pcall(require , "lspsaga")
if not status then
  return
end

lsp_saga.setup({
  symbol_in_winbar = {
    enable = true,
    separator = " ",
    ignore_patterns={},
    hide_keyword = true,
    show_file = true,
    folder_level = 1,
    respect_root = false,
    color_mode = true,
  },
})

