let mapleader=" "
map <leader>s :source ~/.vimrc<CR>

set clipboard=unnamed

" Automatic, language-dependent indentation, syntax coloring and other
" functionality.
filetype indent plugin on
syntax on

" Allow for per-machine overrides in ~/.vim/host/hostname and
" ~/.vim/vimrc.local.
let s:hostfile = $HOME . '/.vim/host/' . substitute(hostname(), "\\..*", '', '')
if filereadable(s:hostfile)
  execute 'source ' . s:hostfile
endif

" Inglorious hack to share config across dev* machines.
if matchstr(hostname(), '\.dev') != ''
  execute 'source ' . $HOME . '/.vim/host/kvm'
endif

let s:vimrc_local = $HOME . '/.vim/vimrc.local'
if filereadable(s:vimrc_local)
  execute 'source ' . s:vimrc_local
endif

" Temporary workaround for MacVim blowing up for any Python plug-in.
if has('gui')
  let g:pathogen_blacklist=['YouCompleteMe', 'ultisnips']
endif

if matchstr(hostname(), '.dev') == '' && !has('mac')
  let g:pathogen_blacklist=['ultisnips']
endif

if has('packages')
  packloadall
else
  " Use Pathogen for plug-in loading.
  source $HOME/.vim/pack/bundle/opt/vim-pathogen/autoload/pathogen.vim
  call pathogen#infect('pack/bundle/start/{}')
endif

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
