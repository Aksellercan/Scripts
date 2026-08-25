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
# Minimal
#PS1="%B%{$fg[red]%}[%{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Dense
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# COMPINSTALL Config
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle ':completion:*' format 'Did you mean: %d'
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
local tmux_ls=$(tmux ls)
echo $tmux_ls
"$HOME/Documents/Programs/C Programs/TaskTrackerCLI/TaskTrackerCLI" list todo

# Check and attach to already existing tmux session
local sessions=$(echo $tmux_ls | cut -d ':' -f 1);
local current_stat=$(echo $tmux_ls | grep "attached" | cut -d ':' -f 1)
if [[ $current_stat = $session ]]; then
    tmux attach -t ${sessions[1]}
fi

# Set aliases
alias zshconfig="$EDITOR ~/.zshrc"
alias vim="nvim"
alias TaskTrackerCLI="$HOME/Documents/Programs/C\ Programs/TaskTrackerCLI/TaskTrackerCLI"
alias HTTPServer="java -jar $HOME/Documents/Programs/Java\ Programs/HTTPServer/HTTPServer.jar"
alias SpotifyWebAPI="java -jar $HOME/Documents/Programs/Java\ Programs/SpotifyWebAPI/3.0/SpotifyWebAPI-3.0.jar"
alias dc="cd .."

# ls alias
alias ls="ls -l --color"

# Database connection alias
alias connectDB="mariadb -h nectarine -u aksell -p"

alias attach-tmux="tmux attach -t "
alias update_all_brew="brew update && brew upgrade && brew cleanup"
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
        ssh $(whoami)@$2
    else
        local user=$(whoami)
        ssh $user@nectarine    
    fi
}

# Append
## Haskell tooling
[ -f "/Users/aksell/.ghcup/env" ] && . "/Users/aksell/.ghcup/env" # ghcup-env
