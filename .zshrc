# eval brew env if brew is installed (macOS)
if [[ -f "/opt/homebrew/bin/brew" ]] then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# add Golang bin to PATH
if type go &>/dev/null; then 
	export PATH="$PATH:$(go env GOPATH)/bin"
fi


ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

setopt promptsubst

ZSH_THEME="alanpeabody"

zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZL::async_prompt.zsh
zinit snippet OMZL::prompt_info_functions.zsh
zinit snippet OMZP::sudo
zinit snippet OMZT::alanpeabody

autoload -Uz compinit && compinit
zinit cdreplay -q

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab


# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


# Aliases
alias ls='ls -h --color'
alias vim='nvim'
alias vi='nvim'
alias la='ls -la'
alias ll='ls -l'


if test -x fzf; then 

    eval "$(fzf --zsh)"

fi

export EDITOR=vi

