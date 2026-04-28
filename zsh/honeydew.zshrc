# Helpful variables

# Colour text
RED='\033[0;31m'
BLUE='\e[1;34m'
LIGHT_BLUE='\e[1;36m'
NC='\033[0m' # No Color
RESET='\e[0m'

# ZSH configuration

# Base Configuration
# Colouring shell
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# COMPINSTALL Config
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle ':completion:*' format 'Did you mean these? %d'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**'
zstyle :compinstall filename '/Users/aksell/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
#bindkey mode
bindkey -v

# Personal & plugin Configurations
# Run commands on startup
echo -e "$LIGHT_BLUE::$RESET Tmux Windows:"
tmux ls
"$HOME/Documents/Programs/C Programs/TaskTrackerCLI/TaskTrackerCLI" list todo

# Set aliases
alias zshconfig="$EDITOR ~/.zshrc"
alias vim="nvim"
alias TaskTrackerCLI="$HOME/Documents/Programs/C\ Programs/TaskTrackerCLI/TaskTrackerCLI"
alias HTTPServer="java -jar $HOME/Documents/Programs/Java\ Programs/HTTPServer/HTTPServer.jar"
alias SpotifyWebAPI="java -jar $HOME/Documents/Programs/Java\ Programs/SpotifyWebAPI/3.0/SpotifyWebAPI-3.0.jar"
alias dc="cd .."
alias connectDB="mariadb -h nectarine -u aksell -p"
alias attach-tmux="tmux attach -t "
alias brew_update-and-upgrade="brew update && brew upgrade"
alias countLines="java -jar $HOME/Documents/Programs/Java\ Programs/RecursiveLineCounter/RecursiveLineCounter.jar"

# ZSH Addons
## Zsh Syntax Highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## Zsh auto suggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Functions

# SSH shortcut
# Usage: komp {hostname or local address}
komp() {
    if [[ $# = 1 ]]; then
        if [[ $1 == *"@"* ]]; then
            ssh $1
            return 0
        fi
        local user=$(whoami)
        ssh $user@$1
    elif [[ $# = 2 ]]; then
        ssh $1@$2
    else
        local user=$(whoami)
        ssh $user@nectarine    
    fi
}

# Append
## Haskell tooling
[ -f "/Users/aksell/.ghcup/env" ] && . "/Users/aksell/.ghcup/env" # ghcup-env
