autoload -U colors && colors

function update_current_git_vars() {
  unset __CURRENT_GIT_BRANCH
  unset __CURRENT_GIT_BRANCH_STATUS
  unset __CURRENT_GIT_BRANCH_AHEAD
  unset __CURRENT_GIT_BRANCH_IS_DIRTY
  local st="$(git status 2>/dev/null)"
  if [ -n "$st" ]; then
    local -a arr
    arr=(${(f)st})
    if echo $arr[1] | grep "Not currently on any branch." >/dev/null; then
      __CURRENT_GIT_BRANCH='no-branch'
    else
      __CURRENT_GIT_BRANCH="$(echo $arr[1] | awk ' { print $4 } ')"
    fi
    if echo $arr[2] | grep "Your branch is" >/dev/null; then
      if echo $arr[2] | grep "ahead" >/dev/null; then
        __CURRENT_GIT_BRANCH_STATUS='ahead'
        __CURRENT_GIT_BRANCH_AHEAD=$(echo $st | grep 'ahead' | cut -d' ' -f9)
      elif echo $arr[2] | grep "diverged" >/dev/null; then
        __CURRENT_GIT_BRANCH_STATUS='diverged'
      else
        __CURRENT_GIT_BRANCH_STATUS='behind'
      fi
    fi
    if echo $st | grep "nothing to commit (working directory clean)" >/dev/null; then
    else
      __CURRENT_GIT_BRANCH_IS_DIRTY='1'
    fi
  fi
}

function prompt_git_info() {
  update_current_git_vars

  if [ -n "$__CURRENT_GIT_BRANCH" ]; then
    local s="${ZSH_THEME_COLOR_YELLOW}${ZSH_THEME_GIT_PROMPT_PREFIX}"

    s+="$__CURRENT_GIT_BRANCH"

    if [ -n "$__CURRENT_GIT_BRANCH_IS_DIRTY" ]; then
      s+="${ZSH_THEME_COLOR_RED}${ZSH_THEME_GIT_PROMPT_DIRTY}"
    fi

    case "$__CURRENT_GIT_BRANCH_STATUS" in
      ahead) s+="${ZSH_THEME_COLOR_GREEN}${ZSH_THEME_GIT_AHEAD}${__CURRENT_GIT_BRANCH_AHEAD}" ;;
      diverged) s+="${ZSH_THEME_COLOR_GREEN}${ZSH_THEME_GIT_DIVERGED}" ;;
      behind) s+="${ZSH_THEME_COLOR_GREEN}${ZSH_THEME_GIT_BEHIND}" ;;
    esac

    s+="${ZSH_THEME_GIT_PROMPT_SUFFIX}${ZSH_THEME_COLOR_RESET}"

    echo ${s}
  fi
}

function chpwd_update_git_vars() {
  update_current_git_vars
}

function precmd_update_git_vars() {
  if [ -n "$__EXECUTED_GIT_COMMAND" ]; then
    update_current_git_vars
    unset __EXECUTED_GIT_COMMAND
  fi
}

function preexec_update_git_vars() {
  case "$1" in
    g*|git*|gitx*|gb*|gc*|commit*|vi*|rm*) __EXECUTED_GIT_COMMAND=1 ;;
  esac
}

if [ -e ~/.rvm/bin/rvm-prompt ]; then
  RUBY_PROMPT_="[\$(~/.rvm/bin/rvm-prompt v g s)]"
fi

ZSH_THEME_COLOR_YELLOW="%{$fg[yellow]%}"
ZSH_THEME_COLOR_GREEN="%{$fg[green]%}"
ZSH_THEME_COLOR_RED="%{$fg[red]%}"
ZSH_THEME_COLOR_RESET="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""

ZSH_THEME_GIT_PROMPT_DIRTY="⚡"
ZSH_THEME_GIT_AHEAD="↑"
ZSH_THEME_GIT_DIVERGED="↕"
ZSH_THEME_GIT_BEHIND="↓"

user_at_host() {
  if [ $UID -eq 0 ]; then
    echo -n "${ZSH_THEME_COLOR_RED}%n";
  else
    echo -n "${ZSH_THEME_COLOR_GREEN}%n";
  fi
  if [ "$(uname -s)" != "Darwin" ]; then
    echo -n "%{$fg[green]%}@%m"
  fi
  echo -n "%{$reset_color%}"
}

PROMPT='$(user_at_host) %~ $(prompt_git_info) ${ZSH_THEME_COLOR_RED}»${ZSH_THEME_COLOR_RESET} '
