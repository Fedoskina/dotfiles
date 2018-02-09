# Checks if working tree is dirty
function parse_git_dirty() {
  local untracked_dirty=0
  local STATUS=''

  # use cd -q to avoid side effects of changing directory, e.g. chpwd hooks
  cd -q "$*"

  if [[ "$untracked_dirty" == "0" ]]; then
      command git diff --no-ext-diff --quiet --exit-code
  else
      test -z "$(command git status --porcelain --ignore-submodules -unormal)"
  fi

  if [[ $? == 0 ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  else
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  fi
}
