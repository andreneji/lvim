-- ┌─────────────────────────────────────────┐
-- │        LvimFiles by André Lima          │
-- ├─────────────────────────────────────────┤
-- | email: andreneji@gmail.com              |
-- | https://github.com/andreneji/lvim/      |
-- └─────────────────────────────────────────┘

--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "gruvbox"
-- lvim.transparent_window = true
-- vim.opt.timeoutlen = 500

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
  --}
}

-- generic LSP settings


-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  { command = "isort", filetypes = { "python" } },
  { command = "rubocop", filetypes = { "ruby" } },
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--print-with", "100" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "typescriptreact" },
  },
}

-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } },
  -- { command = "rubocop", filetypes = { "ruby" } },
  {
    -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "shellcheck",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--severity", "warning" },
  },
  {
    command = "codespell",
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "javascript", "python" },
  },
  -- {
  --   command = "zsh",
  --   extra_args = { "-n", "$FILENAME" },
  --   filetypes = { "zsh" },
  -- },
}

-- Additional Plugins
lvim.plugins = {
  -- Themes
  { "gruvbox-community/gruvbox" },

  -- Others
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  { "junegunn/limelight.vim" },
  { "junegunn/goyo.vim" }, -- On / Off - paragrafos
  { "unblevable/quick-scope" }, -- Destaca caracter da palavra/frase na linha
  { "terryma/vim-multiple-cursors" }, -- Altera palavas em linhas diferentes em tempo real
  { "szw/vim-maximizer" }, -- Minimizar/maximar buffers
  { "tpope/vim-fugitive" }, -- vim + git
  -- { "kevinhwang91/rnvimr" }, -- Ranger in a floatin window
  { "mattn/emmet-vim" }, -- Formata comandos com abrev. ex: htlm:5 e css / inclui tags entre os textos
  { "preservim/vim-pencil" }, -- Facilita a escrita
  { "ThePrimeagen/harpoon" }, -- Getting you where you want with the fewest keystrokes.
  { "MattesGroeger/vim-bookmarks" }, -- Bookmarks like np++
}

-- { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview' },
-- {"vim-airline/vim-airline"},
-- {"vim-airline/vim-airline-themes"},

-- Tentativa de não exibir + diagnostico virtual no código, e sim apenas na lateral
-- vim.lsp.diagnostic.virtual_text = false
--vim.cmd("autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()")

-- vim.lsp.diagnostic.LvimFiles.show_line_diagnostics()

-- Additional Configs.
require("func")
require("map")
require("hack")
