# bash completion support for git-extras.

_git_changelog(){
  __gitcomp "-l -t --list --tag"
}

_git_contrib(){
  __gitcomp "$(git shortlog -s | cut -f2)" # TODO buggy if author's name contains whitespaces :(
}

_git_count(){
  __gitcomp "--all"
}

_git_delete_branch(){
  __gitcomp "$(__git_heads)"
}

_git_delete_submodule(){
  __gitcomp "$(git submodule status | awk '{print $2}')"
}

_git_delete_tag(){
  __gitcomp "$(__git_tags)"
}

_git_extras(){
  __gitcomp "--version update"
}

_git_graft(){
  __gitcomp "$(__git_heads)"
}

_git_ignore(){
  case "$cur" in
  --*)
    __gitcomp "--global --local"
    return
    ;;
  -*)
    __gitcomp "--global --local -g -l"
    return
    ;;
  esac
}

_git_squash(){
  __gitcomp "$(__git_heads)"
}

_git_undo(){
   __gitcomp "--hard --soft -h -s"
}
