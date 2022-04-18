-- ┌─────────────────────────────────────────┐
-- │        LvimFiles by André Lima          │
-- ├─────────────────────────────────────────┤
-- | email: andreneji@gmail.com              |
-- | https://github.com/andreneji/lvim/      |
-- └─────────────────────────────────────────┘

-- ==== Functions ====

-- Limelight settings
vim.cmd([[
    let g:limelight_conceal_ctermfg = 'gray'
    let g:limelight_conceal_ctermfg = 240
    let g:limelight_conceal_guifg = 'DarkGray'
    let g:limelight_conceal_guifg = '#777777'
]])

-- "*** Goyo settings
vim.cmd([[
    function! s:goyo_enter()
        if executable('tmux') && strlen($TMUX)
          silent !tmux set status off
          silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
        endif
        set noshowmode
        set noshowcmd
        set nocursorline
        " CocDisable
        Limelight
        set cul
        set number
        set relativenumber
    endfunction

    function! s:goyo_leave()
        if executable('tmux') && strlen($TMUX)
          silent !tmux set status on
          silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
        endif
        set showmode
        set showcmd
        set cursorline
        " CocEnable
        Limelight!
        set cul
        set number
        set relativenumber
    endfunction

    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()
]])

-- Replaces
-- echom 'olá mundo!'
-- a:    - argument da function
-- rtype - replace type
vim.cmd([[
    function ReplaceAll(rtype)
        if a:rtype == 'ask'
          let a = input('Type a word: ')
        else
          let a = expand('<cword>')
        endif

        if !empty(a)
          let b = input('Change "' . a . '" by: ')
          if !empty(b)
            let l = line('.')
              if a:rtype == 'all' || a:rtype == 'ask'
                execute '%s/' . a . '/' . b . '/g'
              elseif a:rtype == 'line'
                execute 's/' . a . '/' . b . '/g'
              endif
              execute l
            endif
        endif
    endfunction
]])

-- " Removes trailing spaces
vim.cmd([[
    function TrimWhiteSpace()
      %s/\s*$//
      ''
    :endfunction
]])

vim.cmd([[nmap  <c-a>q  :call TrimWhiteSpace()<CR>]])
-- vim.cmd([[nmap! <c-a>q  :call TrimWhiteSpace()<CR>]])

-- Removes trailing spaces before saving
-- vim.cmd([[autocmd BufWritePre * :%s/\s\+$//e]])
