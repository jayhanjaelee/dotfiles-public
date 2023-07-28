local treesitter = require "nvim-treesitter"
local configs = require "nvim-treesitter.configs"
local languages = {
  "html",
  "css",
  "java",
  "c",
  "cpp",
  "typescript",
  "javascript",
  "json",
  "lua",
  "python",
  "sql",
  "markdown",
  "markdown_inline",
  "yaml",
}

configs.setup {
  on_attach = function(client, bufnr)
      -- avoid the sintax highlighting repaint
      client.server_capabilities.semanticTokensProvider = nil
  end,
  ensure_installed = languages, -- put the language you want in this array
  sync_install = false,                                                          -- install languages synchronously (only applied to `ensure_installed`)
  auto_install = true,
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
  },
  autotag = {
    enable = true,
    filetypes = { "html" },
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}
