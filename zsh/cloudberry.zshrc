# Created by newuser for 5.9

# Colour text
RED='\033[0;31m'
BLUE='\e[1;34m'
LIGHT_BLUE='\e[1;36m'
NC='\033[0m' # No Color
RESET='\e[0m'

# Base Configuration
# Colouring
autoload -U colors && colors
# Minimal
#PS1="%B%{$fg[blue]%}[%{$fg[magenta]%}%~%{$fg[blue]%}]%{$reset_color%}$%b "

# Dense
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle ':completion:*' format 'Did you mean these? %d'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**'
zstyle :compinstall filename '/Users/aksell/.zshrc'

export ZSH_CONFIG="$HOME/.zshrc"
export TMUX_CONFIG="$HOME/.tmux.conf"
export NVIM_CONFIG="$HOME/.config/nvim"

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

# Run command on startup
#fastfetch
echo -e "$LIGHT_BLUE::$RESET Tmux Windows:"
tmux ls
# My task tracker program
"$HOME/Documents/Programs/C Programs/TaskTrackerCLI/TaskTrackerCLI" list todo
#"$HOME/Documents/Programs/C Programs/TaskTrackerCLI/TaskTrackerCLI" list in-progress

# Set aliases
alias vim="nvim"
alias TaskTrackerCLI="$HOME/Documents/Programs/C\ Programs/TaskTrackerCLI/TaskTrackerCLI"
alias HTTPServer="java -jar $HOME/Documents/Programs/Java\ Programs/HTTPServer/HTTPServer.jar"
alias SpotifyWebAPI="java -jar $HOME/Documents/Programs/Java\ Programs/SpotifyWebAPI/SpotifyWebAPI-3.0.jar"
alias dc="cd .."
alias connectDB="mariadb -u aksell -p"
alias attach-tmux="tmux attach -t "

# Zsh addons
## Zsh Syntax Highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

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
        ssh nectarine
    fi
}
