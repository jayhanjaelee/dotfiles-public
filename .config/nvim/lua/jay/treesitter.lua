local treesitter = require "nvim-treesitter"
local configs = require "nvim-treesitter.configs"
local languages = {
  "java",
  "c",
  "cpp",
  "typescript",
  "javascript",
  "html",
  "css",
  "json",
  "lua",
  "python",
  "sql",
  "markdown",
  "markdown_inline",
  "yaml",
}

configs.setup {
  ensure_installed = languages, -- put the language you want in this array
  sync_install = false,                                                          -- install languages synchronously (only applied to `ensure_installed`)

  highlight = {
    enable = true,       -- false will disable the whole extension
    disable = { "css" }, -- list of language that will be disabled
  },
  autopairs = {
    enable = true,
  },
  indent = { enable = true, disable = { "python", "css" } },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
