#
# ~/.bashrc
#

[[ $- != *i* ]] && return

#---------------------------------------------------
#  Color definitions
#---------------------------------------------------
RESET="\[\e[0m\]"
BOLD="\[\e[1m\]"
DIM="\[\e[2m\]"
RED="\[\e[31m\]"
GREEN="\[\e[32m\]"
YELLOW="\[\e[33m\]"
BLUE="\[\e[34m\]"
MAGENTA="\[\e[35m\]"
CYAN="\[\e[36m\]"
GRAY="\[\e[90m\]"

#---------------------------------------------------
#  Prompt
#---------------------------------------------------
PS1="${BOLD}${CYAN}\u@\h${RESET}:${BLUE}\w${RESET} $ "

#---------------------------------------------------
#  Aliases
#---------------------------------------------------

alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -lha'
alias grep='grep --color=auto'
alias df='df -h'
alias ..='cd ..'
alias ...='cd ../..'
alias update='sudo pacman -Syu'
#---------------------------------------------------
#  Less clutter
#---------------------------------------------------
export HISTSIZE=1000
export HISTCONTROL=ignoredups:erasedups
export EDITOR=nvim

# from: https://wiki.archlinux.org/index.php/Color_output_in_console#man
export LESS_TERMCAP_mb=$'\e[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;33m'     # begin blink
export LESS_TERMCAP_so=$'\e[01;44;37m' # begin reverse video
export LESS_TERMCAP_us=$'\e[01;37m'    # begin underline
export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'        # reset underline
export GROFF_NO_SGR=1                  # for konsole and gnome-terminal

bind 'set show-all-if-ambiguous on'
# bind 'TAB:menu-complete'

#---------------------------------------------------
#  Enable programmable completion features
#---------------------------------------------------
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

createcmake () {
    name=$1
    cmakelists=$name/CMakeLists.txt
    maincpp=$name/src/main.cpp
    echo "Creating project" $name
    mkdir -p $name
    mkdir -p $name/src
    echo "Creating" $cmakelists
    printf "cmake_minimum_required(VERSION 3.31)\n\n" > $cmakelists
    printf "project(%s)\n\n" $name >> $cmakelists
    printf "add_executable(%s src/main.cpp)\n" $name >> $cmakelists

    echo "Creating" $maincpp
    printf "#include <iostream>\n\n" >> $maincpp
    printf "int main() {\n" >> $maincpp
    printf "    std::cout << \"Hello, world!\\\\n\";\n" >> $maincpp
    printf "}\n" >> $maincpp
}

export PATH="$PATH:$(go env GOPATH)"
