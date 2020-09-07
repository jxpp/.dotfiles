# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.emacs.d/bin

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="fishy"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# xst workaround
if [ "$(ps -o comm= -q $(ps -q $$ -o ppid=))" = 'xst' ]; then
    bindkey "^[[A" history-beginning-search-backward
    bindkey "^[[B" history-beginning-search-forward
fi

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

export LANG=en_US.UTF-8

setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
export TERM="xterm-256color"
export EDITOR="nvim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR
export KEYTIMEOUT=1

alias t="tmux -2 new-session -A -s"

alias qkup="sudo apt update && sudo apt dist-upgrade -y && sudo apt autoremove -y"

function venvname {
    echo "$(pwd | perl -pe "s|$HOME/||" | perl -pe 's|/|\.|g')";
}

function v {
    source $HOME/.venvs/$(venvname)/bin/activate
}

function vc {
    VNAME="$(venvname)";
    VENV="$HOME/.venvs/$VNAME";

    if [ -e $VENV ]; then
        echo "❤  Virtual environment $VNAME already exists, activating.";
        source $VENV/bin/activate;
        return;
    fi

    if [ $1 ]; then
        echo "❤  Initializing virtual environment $VNAME with Python $1.";
        virtualenv -p python${1} $VENV -q;
    else
        echo "❤ Initializing virtual environment $VNAME with $(python3 -V).";
        virtualenv -p python3 $VENV -q;
    fi

    source $VENV/bin/activate;
}

# Configuración de FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS='--height 60% --layout=reverse --preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500"'

alias vf='nvim $(fzf)'

alias fd='fdfind'
export FZF_DEFAULT_COMMAND="fd . ."
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"
# Porsia
export FZF_CTRL_R_OPTS=""

glab() {
    git init && git add . && git commit -a -m "Commit inicial" && git push -u git@gitlab.com:jxpp/$1.git master
}

# Porsiaca
alias vim=nvim

# Docker compose config
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

export JOURNAL_DIR="$HOME/.journal"

j() {
    (cd $JOURNAL_DIR && nvim "$1" +Goyo)
}
alias jf='(cd $JOURNAL_DIR && nvim $(fzf) +Goyo)'
alias ja='(cd $JOURNAL_DIR && nvim +Ag!)'
alias dt='(cd $HOME/.diary && nvim $(date -I).md)'

export ENTRY_DIR="$HOME/"
alias entry="$EDITOR .entries/$(date -Is) +'set ft=markdown'"

load-pyenv () {
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
    export PYENV_VIRTUALENV_DISABLE_PROMPT=0
    export _PYENV_LOADED=1
}

alias m='mpd; ncmpcpp --screen visualizer'

# I hate npm
export PATH=~/.npm-global/bin:$PATH

alias gcpv='git commit -p -v'

export VILYNX_DIR='/home/jxpp/vilynx'
repo () {
    if [ -z $_PYENV_LOADED ]; then
        load-pyenv
    fi
    cd $VILYNX_DIR/repos/$1
    pyenv activate $(basename $(pwd))
}
