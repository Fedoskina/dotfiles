" Ignore turds left behind by Mercurial.
let g:NERDTreeIgnore=['\.orig', '\.DS_Store', '\~$', '\.swp']

" The default of 31 is just a little too narrow.
let g:NERDTreeWinSize=40

" Disable display of '?' text and 'Bookmarks' label.
let g:NERDTreeMinimalUI=1

" Let <Leader><Leader> (^#) return from NERDTree window.
let g:NERDTreeCreatePrefix='silent keepalt keepjumps'

" Single-click to toggle directory nodes, double-click to open non-directory
" nodes.
let g:NERDTreeMouseMode=2

" Space+n to open NERDTree
nmap <leader>n :NERDTreeToggle<CR>
nmap <C-n> :NERDTreeToggle<CR>

" Space+j to jump in NERDTree
nmap <leader>j :NERDTreeFind<CR>

" Right key to activate NERDTree node
" let NERDTreeMapActivateNode='<Right>'

" Display hidden files
let NERDTreeShowHidden=1

" Open NERDTree with vim but don't focus it
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p

" Close vim if only NERDTree left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

if has('autocmd')
  augroup VINERDTree
    autocmd!
    autocmd User NERDTreeInit call autocmds#attempt_select_last_file()
  augroup END
endif
