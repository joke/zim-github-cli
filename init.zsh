(( ${+commands[gh]} || ${+commands[asdf]} && ${+functions[_direnv_hook]} )) && () {

  local command=${commands[gh]:-"$(${commands[asdf]} which gh 2> /dev/null)"}
  [[ -z $command ]] && return 1

  local compfile=$1/functions/_gh
  [[ ! -e $compfile || $compfile -ot $command ]] && $command completion -s zsh >| $compfile
} ${0:h}
