#env | grep PATH Set root path
export ROOT=~

# Path to your oh-my-zsh installation.
export ZSH=$ROOT/.oh-my-zsh

# So gpg works
export GPG_TTY=$(tty)

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="sobole"

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
plugins=(git github git-extras zsh-syntax-highlighting zsh-autosuggestions)

# User configuration
export PATH=$PATH"/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/opt/nginx/sbin"
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

function django-test-with-coverage() {
  poetry run coverage run manage.py test $1
  poetry run coverage report
}

alias django="poetry run python manage.py"
alias django-test="poetry run coverage run manage.py test"
alias django-notebook="django shell_plus --notebook"
alias django-format="poetry run black .; git add .; git commit -m \"auto formatting via black\";"
alias django-shell="django shell"
alias django-run="django runserver"
alias pip="pip3"

alias vundle="vim +PluginInstall +qall"

alias hig="history | grep"
alias ag="alias | grep"

alias ll="ls -ltrh"
alias lg="case_insensitive_recursive_file_search"

alias start-postgres="postgres -D /usr/local/var/postgres"
alias start-redis="redis-server /usr/local/etc/redis.conf"
alias start-mongo="mongod --config /usr/local/etc/mongod.conf"
alias start-rabbit="rabbitmq-server"
alias start-mysql="mysqld"

alias start-graylog="ssh -f -N -L 9000:graylog-primary.infra.circleci.com:80 jumphost"
alias start-rmq-legacy-admin="ssh -f -N -L 8672:10.0.66.57:15672 jumphost"

alias django="poetry run python manage.py"
alias prettier="yarn lint; git add .; git commit -m \"auto lint with prettier\";"

alias backup-ssh="mkdir ~/.ssh; cp ~/.ssh_backup/* ~/.ssh/"

# Make python3 our default
alias python="/usr/local/bin/python3"

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Add local ruby to the path
export PATH="/usr/local/opt/ruby/bin:$PATH"

# Add rbenv second so it takes priority
export PATH=$HOME"/.rbenv/bin:"$PATH
eval "$(rbenv init -)"

# Load a ~/.profile if we have one
if [[ -s ~/.profile ]]; then
	source ~/.profile
fi

export PATH="$HOME/.poetry/bin:$PATH"

# nvm for node version management
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
