set commentstring=##%s

runtime! macros/matchit.vim

if exists("loaded_matchit")
  let b:match_ignorecase = 1
  let b:match_words = '<:>,' .
    \ '<\@<=TMPL_IF.*>:<\@<=TMPL_ELSE>:<\@<=TMPL_ELSIF.*>:<\@<=/TMPL_IF>,' .
    \ '<\@<=TMPL_COMMENT>:<\@<=/TMPL_COMMENT>,' .
    \ '<\@<=TMPL_WS.*>:<\@<=/TMPL_WS>,' .
    \ '<\@<=TMPL_SETVAR.*>:<\@<=/TMPL_SETVAR>,' .
    \ '<\@<=TMPL_BLOCK.*>:<\@<=/TMPL_BLOCK>,' .
    \ '<\@<=TMPL_MARKER.*>:<\@<=/TMPL_MARKER.*>,' .
    \ '<\@<=TMPL_LOOP.*>:<\@<=TMPL_BREAK>:<\@<=TMPL_CONTINUE>:<\@<=/TMPL_LOOP>,' .
    \ '<\@<=TMPL_FOR.*>:<\@<=TMPL_BREAK>:<\@<=TMPL_CONTINUE>:<\@<=/TMPL_FOR>,' .
    \ '<\@<=TMPL_WITH.*>:<\@<=/TMPL_WITH>,' .
    \ '<\@<=TMPL_UNLESS.*>:<\@<=/TMPL_UNLESS>,' .
    \ '<\@<=TMPL_CASE.*>:<\@<=TMPL_WHEN.*>:<\@<=TMPL_OTHERWISE>:<\@<=/TMPL_CASE>' .
    \ '<\@<=[ou]l\>[^>]*\%(>\|$\):<\@<=li\>:<\@<=/[ou]l>,' .
    \ '<\@<=dl\>[^>]*\%(>\|$\):<\@<=d[td]\>:<\@<=/dl>,' .
    \ '<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>'
endif

if exists("loaded_nerd_comments")
  let s:NERDCustomDelimiters = {
      \ 'tmpl': { 'left': '##', 'leftAlt': '<TMPL_COMMENT>', 'rightAlt': '</TMPL_COMMENT>' }
      \ }

  call extend(g:NERDDelimiterMap, s:NERDCustomDelimiters)
endif
