" Automatically wrap at 72 characters and spell check commit messages
setlocal textwidth=72

if has('folding')
  setlocal nofoldenable
endif

if has('syntax')
  setlocal spell
endif
