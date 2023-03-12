(( ${+commands[gh]} || ${+commands[asdf]} && ${+functions[_direnv_hook]} )) && () {

  local command=${commands[gh]:-"$(${commands[asdf]} which gh 2> /dev/null)"}
  [[ -z $command ]] && return 1

  local compfile=$1/functions/_gh
  if [[ ! -e $compfile || $compfile -ot $command ]]; then
    $command completion -s zsh >| $compfile
    print -u2 -PR "* Detected a new version 'gh'. Regenerated completions."
  fi
} ${0:h}
