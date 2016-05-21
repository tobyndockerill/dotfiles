# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="macovsky"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
plugins=(gitfast bundler common-aliases gem rails history-substring-search tmuxinator vi-mode)
if [ $OSTYPE=="darwin*" ]; then
  plugins+=(brew heroku osx)
fi
plugins+=(zsh-syntax-highlighting)

# User configuration

path=('$HOME/.rbenv/shims')
path+=('/opt/vagrant/bin')
path+=('$HOME/.rbenv/bin')
path+=('/usr/local/var/rbenv/shims')
path+=('/usr/local/bin/git')
path+=('$HOME/dotfiles/bin')
if [ $OSTYPE=="darwin*" ]; then
  path+=('/Applications/MAMP/Library/bin')
  path+=('/Applications/MAMP/bin/php/php5.6.10/bin')
  path+=('$HOME/Library/Android/sdx/tools')
  path+=('$HOME/Library/Android/sdx/platform-tools')
fi
path+=('/usr/local/bin')
path+=('/usr/local/sbin')
path+=('/usr/bin')
path+=('/bin')
path+=('/usr/sbin')
path+=('/sbin')
path+=('/opt/X11/bin')
path+=('$HOME/dev/cli-tools')


export PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

[ -f .zshrc-private ] && source .zshrc-private

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias v="nvim"
alias v.="nvim ."
alias generate-rails-ctags="ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)"

# Allow RBENV to control ruby version
eval "$(rbenv init -)"

if [ $OSTYPE=="darwin*" ]; then
  test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

  # Homebrew's ZSH completions
  fpath=(/usr/local/share/zsh-completions $fpath)

  # Symlink Homebrew Cask to /Applications by default
  export HOMEBREW_CASK_OPTS="--appdir=/Applications"
fi

# Set elasticsearch memory variables
export ES_MIN_MEM=2g
export ES_MAX_MEM=2g

export TERM="xterm-256color"
