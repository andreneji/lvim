-- ┌─────────────────────────────────────────┐
-- │        LvimFiles by André Lima          │
-- ├─────────────────────────────────────────┤
-- | email: andreneji@gmail.com              |
-- | https://github.com/andreneji/lvim/      |
-- └─────────────────────────────────────────┘

-- ==== Maps ====

-- Multiline Statements
-- (M=ALT e S=Shift)

vim.cmd([[
    nnoremap <c-a>ini       :vs $HOME/.config/lvim/config.lua<cr>
    nnoremap <c-a>cus       :vs $HOME/.config/lvim/lua/config_custom.lua<cr>
    nnoremap <c-a>ws        :vs $HOME/.config/awesome/rc.lua<cr>
    nnoremap <c-a>hac       :vs $HOME/.config/lvim/lua/hack.lua<cr>
    nnoremap <c-a>map       :vs $HOME/.config/lvim/lua/map.lua<cr>
    nnoremap <c-a>tmu       :vs $HOME/.tmux.conf<cr>
    nnoremap <c-a>fun       :vs $HOME/.config/lvim/lua/func.lua<cr>
    nnoremap <c-a>zsh       :vs $HOME/.zshrc<cr>
]])

-- Minimizar buffers, salvando sessão
vim.cmd([[
    nnoremap <c-a>mx        :mksession! ~/.session.vim<cr>:wincmd o<cr>
    nnoremap <c-a>me        :mksession! ~/.session.vim<cr>
    nnoremap <c-a>ml        :source ~/.session.vim<cr>
]])

-- Ocultar linhas (Toogle:za | all open/close:zr/zm | delete:zd)
vim.cmd("xnoremap <c-a>f    :fold<cr>")

-- Abrir e navegar entre tabs (abas)
vim.cmd([[
    nnoremap <c-a>.         :tabnext<cr>
    nnoremap <c-a>,         :tabprev<cr>
    nnoremap <c-a>c         :tabnew<cr>
]])

-- Miniminizar buffer atual
vim.cmd("nnoremap <c-w>q  	:bun<cr>")

-- Open new splits in a semantic way
vim.cmd([[
    nnoremap <c-w>h         :lefta vsp new <cr>
    nnoremap <c-w>j         :bel sp new<cr>
    nnoremap <c-w>k         :abo sp new<cr>
    nnoremap <c-w>l         :rightb vsp new<cr>
]])

-- Redimensionar janelas
vim.cmd([[
    nnoremap <c-Up>         :resize +2<cr>
    nnoremap <c-Down>       :resize -2<cr>
    nnoremap <c-Left>       :vertical resize -2<cr>
    nnoremap <c-Right>      :vertical resize +2<cr>
]])

-- Habilitar / desabilitar a quebra de linhas
vim.cmd("nnoremap <c-a>w    :set wrap!<cr>")

-- Fugitive + fzf + git
vim.cmd([[
    nnoremap <c-a>gj        :diffget //3<cr>
    nnoremap <c-a>gf        :diffget //2<cr>
    nnoremap <c-a>gs        :G<cr>
]])

-- Fzf-checkout - Manage branches and tags with fzf
vim.cmd("nnoremap <c-a>gc   :GCheckout<cr>")

-- Markdown
vim.cmd("nmap <c-a>b        <Plug>MarkdownPreviewToggle")

-- Esconder distrações
vim.cmd("nnoremap <c-a>o    :Goyo<cr>")

-- On/Off lights
vim.cmd([[
    nmap <c-a>1             :Limelight<cr>
    nmap <c-a>0             :Limelight!<cr>
]])

-- Au[tocmd] capslock = scape quando entrar no vim e = capslock quando sair
vim.cmd([[
    au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
    au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
]])

-- Changes
vim.cmd([[
    nnoremap <c-a>ra        :call ReplaceAll('all')<cr>
    nnoremap <c-a>rl        :call ReplaceAll('line')<cr>
    nnoremap <c-a>rw        :call ReplaceAll('ask')<cr>
]])

-- Altera a tecla CAPS LOCK p/ ESC
vim.cmd([[
    nmap <c-a>za            :silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'<cr>
    nmap <c-a>zz            :silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'<cr>
]])

-- Behave Vim
vim.cmd("nnoremap Y y$")

-- keeping it centered
vim.cmd([[
    nnoremap n nzzzv
    nnoremap N Nzzzv
    nnoremap J mzJ`z
]])

-- Undo break points
vim.cmd([[
    inoremap , ,<c-g>u
    inoremap . .<c-g>u
    inoremap ! !<c-g>u
    inoremap ? ?<c-g>u
]])

-- Jumplist mulations
vim.cmd([[
    nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
    nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
]])

-- Retira os ^M que ficam no final de arquivos salvos pelo windows
vim.cmd("nnoremap <c-a>tt       :%s/\r//g")

-- Minimiza / maximiza buffers fora do cursor
-- vim.cmd("nnoremap <c-w>m        :MaximizerToggle!<cr>")
-- By default it maps to `<F3>` in normal, insert, and visual modes.
vim.cmd([[
    let g:maximizer_set_mapping_with_bang = 1
    nnoremap <c-w>m             :MaximizerToggle<CR>
    vnoremap <c-w>m             :MaximizerToggle<CR>gv
]])

-- Ranger in a floatin window
-- vim.cmd([[
--     nnoremap <silent> <c-a>j    :RnvimrToggle<CR>
--     tnoremap <silent> <c-a>j    <C-\><C-n>:RnvimrToggle<CR>
-- ]])

-- Markdown
-- nmap <C-s> <Plug>MarkdownPreview
-- nmap <M-s> <Plug>MarkdownPreviewStop
vim.cmd("nmap <C-p> <Plug>MarkdownPreviewToggle")

-- Ḣabilita/desabilita o destaque de coluna
vim.cmd("nmap <space><space>    :set cuc!<cr>")

-- Ḣabilita/desabilita LSP
vim.cmd("nmap <space>0          :LspStop<cr>")
vim.cmd("nmap <space>9          :LspStart<cr>")

-- lua vim.lsp.buf.formatting()
-- keymap("n", "<c-a>f", ":Format<cr>", opts)
-- lvim.keys.normal_mode["<c-a>f"] = ":Format<CR>"
lvim.keys.normal_mode["<c-a>b"] = "<cmd>lua vim.lsp.buf.formatting() <CR>"
-- lvim.keys.normal_mode["<c-a>b"] = "<cmd>lua vim.lsp.buf.format { async = true } <CR>"
-- lvim.keys.normal_mode["<c-a>v"] = "<cmd>lua vim.lsp.buf.format { async = true } <CR>"

-- lua require("bufferline").cycle(1)
lvim.keys.normal_mode["<c-a>l"] = "<cmd>BufferLineCycleNext<CR>"
-- lua require("bufferline").cycle(-1)
lvim.keys.normal_mode["<c-a>h"] = "<cmd>BufferLineCyclePrev<CR>"

-- move linha selec. p/ cima/baixo com alt+j/alt+k - (M=ALT e S=Shift)
vim.cmd([[
    xnoremap <S-k>          :move '<-2<cr>gv-gv
    xnoremap <S-j>          :move '>+1<cr>gv-gv
]])
