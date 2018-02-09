" If UltiSnips' own "after" hook runs after us (and `:scriptnames` shows that it
" does), don't let it overwrite us.
let did_UltiSnips_after=1

if !(matchstr(hostname(), '.dev') == '' && !has('mac'))
  " Note: assuming here that `g:UltiSnipsExpandTrigger` and
  " `g:UltiSnipsJumpForwardTrigger` are the same.
  execute 'inoremap <silent> ' . g:UltiSnipsExpandTrigger .
        \ ' <C-R>=autocomplete#expand_or_jump("N")<CR>'
  execute 'snoremap <silent> ' . g:UltiSnipsExpandTrigger .
        \ ' <Esc>:call autocomplete#expand_or_jump("N")<CR>'
  execute 'inoremap <silent> ' . g:UltiSnipsJumpBackwardTrigger .
        \ ' <C-R>=autocomplete#expand_or_jump("P")<CR>'
  execute 'snoremap <silent> ' . g:UltiSnipsJumpBackwardTrigger .
        \ ' <Esc>:call autocomplete#expand_or_jump("P")<CR>'
endif
