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
zi snippet OMZL::key-bindings.zsh
zi snippet OMZL::completion.zsh
zi snippet OMZL::git.zsh
zi snippet OMZP::git
zi snippet OMZL::async_prompt.zsh
zi snippet OMZL::prompt_info_functions.zsh
zi snippet OMZP::sudo
zi snippet OMZT::alanpeabody

autoload -Uz compinit && compinit
zi cdreplay -q

zi light zsh-users/zsh-syntax-highlighting
zi light zsh-users/zsh-completions
zi light zsh-users/zsh-autosuggestions

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
alias la='ls -la'
alias ll='ls -l'

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

export EDITOR=vim

if type nvim &>/dev/null; then 
	export EDITOR=nvim
fi

# set cursor shape to |
echo -n '\e[5 q'

