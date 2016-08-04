# Set root path
export ROOT=~

# Path to your oh-my-zsh installation.
export ZSH=$ROOT/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:$ROOT/.gem/ruby/1.8/bin:/opt/nginx/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Functions
function case_insensitive_recursive_file_search() {
	find . -not -path '*/\.*' -iname "*$1*"
}

# Aliases
alias gg="git grep"
alias gc="git commit"
alias ga="git add"
alias ga="git add"
alias gap="git add . -p"
alias gs="git status"
alias gl="git log --graph"
alias gmp="git checkout master; git pull origin master"
alias wipe="git add -A && git commit -qm 'WIPE SAVEPOINT' && git reset HEAD~1 --hard"

alias git=hub

alias vundle="vim +PluginInstall +qall"

alias hig="history | grep"
alias ag="alias | grep"

alias ll="ls -l"
alias lg="case_insensitive_recursive_file_search"

alias postgres="postgres -D /usr/local/var/postgres"
alias redis="redis-server /usr/local/etc/redis.conf"
alias run_mongo="mongod --config /usr/local/etc/mongod.conf"

alias backup-ssh="mkdir ~/.ssh; cp ~/.ssh_backup/* ~/.ssh/"

if [[ -a /usr/local/bin/virtualenvwrapper.sh ]]; then
	export WORKON_HOME=$HOME/.virtualenvs
	export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
	source /usr/local/bin/virtualenvwrapper.sh
fi

# Add MacGPG2 to the PATH if it exists
if [[ -d /usr/local/MacGPG2/bin ]]; then
	export PATH="$PATH:/usr/local/MacGPG2/bin"
fi
#
# Add apache-maven-3.3.9 to the PATH if it exists
if [[ -d /usr/local/MacGPG2/bin ]]; then
	export PATH="$PATH:/usr/local/apache-maven-3.3.9/bin"
fi

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"

# CircleCI Aliases
export CIRCLE_DIR=$ROOT/git
if [[ -d $ROOT/git/circleci ]]; then
	export CIRCLE_DIR=$ROOT/git/circleci
fi

# Load a ~/.profile if we have one
if [[ -s ~/.profile ]]; then
	source ~/.profile
fi

alias rft="cd $CIRCLE_DIR/frontend-private; node_modules/karma/bin/karma start karma.dev.conf.js --single-run"
alias cdf="cd $CIRCLE_DIR/frontend-private"
alias rf="cd $CIRCLE_DIR/frontend-private; foreman start"
alias cdc="cd $CIRCLE_DIR/circle"
alias cdp="cd $CIRCLE_DIR/pipeline"
