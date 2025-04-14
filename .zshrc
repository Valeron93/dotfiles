# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /etc/zsh/zpreztorc
source /usr/lib/prezto/init.zsh
source /usr/lib/prezto/runcoms/zshrc

# Run powerlevel10k scripts
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

autoload -Uz promptinit
promptinit
prompt powerlevel10k

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

# A script to create CMake C++ project 
createcmake () {
    local name=$1
    local cmakelists=$name/CMakeLists.txt
    local maincpp=$name/src/main.cpp
    echo "Creating project" $name
    mkdir -p $name
    mkdir -p $name/src
    echo "Creating" $cmakelists
    touch $maincpp
    printf "cmake_minimum_required(VERSION 3.31)\n\n" > $cmakelists
    printf "project(%s)\n\n" $name >> $cmakelists
    printf "add_executable(%s src/main.cpp)\n" $name >> $cmakelists

    echo "Creating" $maincpp
    printf "#include <iostream>\n\n" >> $maincpp
    printf "int main() {\n" >> $maincpp
    printf "    std::cout << \"Hello, world!\\\\n\";\n" >> $maincpp
    printf "}\n" >> $maincpp
}

# from: https://wiki.archlinux.org/index.php/Color_output_in_console#man
export LESS_TERMCAP_mb=$'\e[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;33m'     # begin blink
export LESS_TERMCAP_so=$'\e[01;44;37m' # begin reverse video
export LESS_TERMCAP_us=$'\e[01;37m'    # begin underline
export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'        # reset underline
export GROFF_NO_SGR=1                  # for konsole and gnome-terminal