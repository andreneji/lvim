-- ┌─────────────────────────────────────────┐
-- │        LvimFiles by André Lima          │
-- ├─────────────────────────────────────────┤
-- | email: andreneji@gmail.com              |
-- | https://github.com/andreneji/lvim/      |
-- └─────────────────────────────────────────┘

-- ==== Options / variables ====

local options = {
  backup = false,                          -- creates a backup file
  -- clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  -- cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  -- fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  -- mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = true,                         -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  -- timeoutlen = 100,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  -- number = true,                           -- set numbered lines
  relativenumber = true,                   -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  scrolloff = 8,                           -- is one of my fav
  sidescrolloff = 8,
  -- guifont = "monospace:h17",               -- the font used in graphical neovim applications
  autoindent = true,
  spell = true,
  spelllang = {"pt", "en_us"},
}

-- vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- On entering insert mode in any file, scroll the window so the cursor
-- line is centered, and others
lvim.autocommands.custom_groups = {
  {"InsertEnter", "*", ":normal zz"},  -- {"InsertLeave", "*", ":normal zz"},
  {"InsertEnter", "*", ":set cuc!"},    {"InsertLeave", "*", ":set cuc!"},
  {"WinEnter", "*", ":set cursorline"}, {"WinLeave", "*", ":set nocursorline"},
}

-- Cursor bean "|"
-- vim.cmd("set guicursor= ")

-- ḣabilita/desabilita o destaque de coluna ao entrar/sair do insert mode"
      -- ao sair do buffer, desabilita destaque de linha
      -- ao entrar no buffer, habilita destaque de linha
-- vim.cmd([[
--       autocmd InsertEnter,InsertLeave * set cuc!

--       au WinLeave * set nocursorline
--       au WinEnter * set cursorline
-- ]])

-- Gruvbox config.
vim.cmd([[
      let g:gruvbox_contrast_dark = ('hard')
      let g:gruvbox_invert_selection='0'
]])
      -- hi Normal guibg=NONE ctermbg=NONE

-- vim.cmd "set whichwrap+=<,>,[,],h,l"
-- vim.cmd [[set iskeyword+=-]]
-- vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

-- Ranger in a floatin window
      -- Make Ranger replace Netrw and be the file explorer
      -- Make Ranger to be hidden after picking a file
      -- Replace `$EDITOR` candidate with this command to open the selected file
      -- Disable a border for floating window
      -- Hide the files included in gitignore
      -- Change the border's color
      -- Make Neovim wipe the buffers corresponding to the files deleted by Ranger
      -- Add a shadow window, value is equal to 100 will disable shadow
      -- Draw border with both
vim.cmd([[
      let g:rnvimr_enable_ex = 1
      let g:rnvimr_enable_picker = 1
      let g:rnvimr_edit_cmd = 'drop'
      let g:rnvimr_draw_border = 1
      let g:rnvimr_hide_gitignore = 2
      let g:rnvimr_border_attr = {'fg': 15, 'bg': -1}
      let g:rnvimr_enable_bw = 1
      let g:rnvimr_shadow_winblend = 70
      let g:rnvimr_ranger_cmd = 'ranger --cmd="set draw_borders both"'
]])

-- Markdown
-- set to 1, nvim will open the preview window after entering the markdown buffer
-- default: 0
vim.cmd([[
      let g:mkdp_auto_start = 0
      let g:mkdp_auto_close = 1
      let g:mkdp_refresh_slow = 0
      let g:mkdp_command_for_global = 0
      let g:mkdp_open_to_the_world = 0
      let g:mkdp_open_ip = ''
      let g:mkdp_browser = ''
      let g:mkdp_echo_preview_url = 0
      let g:mkdp_browserfunc = ''
      let g:mkdp_preview_options = {
          \ 'mkit': {},
          \ 'katex': {},
          \ 'uml': {},
          \ 'maid': {},
          \ 'disable_sync_scroll': 0,
          \ 'sync_scroll_type': 'middle',
          \ 'hide_yaml_meta': 1,
          \ 'sequence_diagrams': {},
          \ 'flowchart_diagrams': {},
          \ 'content_editable': v:false,
          \ 'disable_filename': 0
          \ }
      let g:mkdp_markdown_css = ''
      let g:mkdp_highlight_css = ''
      let g:mkdp_port = ''
      let g:mkdp_page_title = '「${name}」'
      let g:mkdp_filetypes = ['markdown']
]])

-- Vim-Pencil
-- vim.cmd([[
--       augroup pencil
--         autocmd!
--         autocmd FileType markdown,mkd,md call pencil#init()
--         autocmd FileType text            call pencil#init({'wrap': 'soft'})
--       augroup END
-- ]])

-- " 0=disable, 1=enable (def)
-- vim.cmd([[
--       let g:pencil#autoformat = 1

--       augroup pencil
--         autocmd!
--         autocmd FileType markdown,mkd,md call pencil#init({'wrap': 'hard', 'autoformat': 1})
--         autocmd FileType text            call pencil#init({'wrap': 'hard', 'autoformat': 0})
--       augroup END
-- ]])
