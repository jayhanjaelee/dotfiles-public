local status, preview = pcall(require, 'markdown-preview')
if (not status) then return end

preview.setup = {}
